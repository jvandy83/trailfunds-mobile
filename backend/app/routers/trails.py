from exponent_server_sdk import (
    DeviceNotRegisteredError,
    PushClient,
    PushMessage,
    PushServerError,
    PushTicketError,
)

from retry.api import retry_call

import time

from config import Settings

import jwt

import json

from requests.exceptions import ConnectionError, HTTPError

from fastapi import APIRouter

from geopy.distance import geodesic

from src.prisma import prisma, Trail

import os
import requests


settings = Settings()

push_token = jwt.encode(
    {
        "kid": settings.apn_push_key,
        "iss": settings.apn_issuer_key,
        "iat": time.time(),
    },
    settings.apn_push_token_secret,
)

print("apn_push_token: ", push_token)

session = requests.Session()
session.headers.update(
    {
        "Authorization": f"Bearer {push_token}",
        "accept": "application/json",
        "accept-encoding": "gzip, deflate",
        "content-type": "application/json",
    }
)

router = APIRouter(
    prefix="/api/v1/trails",
    tags=["trails"],
)


@router.get("/near-me")
async def get_trails_near_me(lat: float, lon: float, radius: int):
    trails = await prisma.query_raw(
        f"""
        SELECT id, latitude, longitude, name
        FROM "Trail" WHERE ST_DWithin(ST_MakePoint(longitude, latitude),
        ST_MakePoint({lon}, {lat})::geography, {radius} * 1609.34 );
        """,
    )
    # print("***trails***: ", trails)

    return {"trails": trails}


@router.get("/distance-from-me")
async def get_distance_to_trail(
    nearLat: float, nearLon: float, farLat: float, farLon: float
):
    # distance is returned in km from geodesic method
    print("***DISTANCE***: ", geodesic((nearLat, nearLon), (farLat, farLon)).miles)
    return geodesic((nearLat, nearLon), (farLat, farLon)).miles


@router.get("/radius-push-notification")
async def get_radius_to_determine_push_notification(
    lat: float,
    lon: float,
    radius: int,
    token: str,
    message: str,
):
    trails = await prisma.query_raw(
        f"""
        SELECT id, latitude, longitude, name
        FROM "Trail" WHERE ST_DWithin(ST_MakePoint(longitude, latitude),
        ST_MakePoint({lon}, {lat})::geography, {radius} );
        """,
    )
    print("***trails***: ", trails)

    if len(trails) > 0:
        print("***SEND A PUSH NOTIFICATION***")

        def send_notification():
            return PushClient(session=session).publish(
                PushMessage(to=token, body=message)
            )

        try:
            response = send_notification()

            print("***response***: ", response)

        except PushServerError as exc:
            # Encountered some likely formatting/validation error.
            print(
                json.dumps(
                    {
                        "token": token,
                        "message": message,
                        # "extra": extra,
                        "errors": exc.errors,
                        "response_data": exc.response_data,
                    }
                )
            )
            raise
        except (ConnectionError, HTTPError) as exc:
            # Encountered some Connection or HTTP error - retry a few times in
            # case it is transient.
            print(json.dumps({"token": token, "message": message}))
            retry_call(send_notification, exceptions=Exception, tries=5)

        try:
            # We got a response back, but we don't know whether it's an error yet.
            # This call raises errors so we can handle them with normal exception
            # flows.
            response.validate_response()
        except DeviceNotRegisteredError:
            # Mark the push token as inactive
            from notifications.models import PushToken

            update_token_status = PushToken.objects.filter(token=token).update(
                active=False
            )
        except PushTicketError as exc:
            # Encountered some other per-notification error.
            print(
                json.dumps(
                    {
                        "token": token,
                        "message": message,
                        # "extra": extra,
                        "push_response": exc.push_response._asdict(),
                    }
                )
            )
            retry_call(update_token_status, exceptions=Exception, tries=5)

        return trails

    return {"msg": "No trails are within the specified radius"}


@router.get("/search-trails")
async def search_trails(query: str):
    trails = []

    if len(query) > 0:
        trails = await Trail.find_many(take=10, where={"name": {"contains": query}})

        return {"trails": trails}

    else:
        return {"trails": trails}


@router.get("/get-trail")
async def search_trails(trailId: str):
    trail = await Trail.find_unique(where={"id": trailId})

    return {"trail": trail}
