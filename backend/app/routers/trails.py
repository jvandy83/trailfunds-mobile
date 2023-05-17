from exponent_server_sdk import (
    DeviceNotRegisteredError,
    PushClient,
    PushMessage,
    PushServerError,
    PushTicketError,
)

import time

from config import Settings

import jwt

import json

from requests.exceptions import ConnectionError, HTTPError

from fastapi import APIRouter

from geopy.distance import geodesic

from src.prisma import prisma, Trail, Notification

settings = Settings()

push_token = jwt.encode(
    {
        "alg": "ES256",
        "kid": settings.apn_push_key,
        "iss": settings.apn_issuer_key,
        "iat": time.time(),
    },
    settings.apn_push_token_secret,
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
    print(
        "distance inside distance-from-me: ",
        geodesic((nearLat, nearLon), (farLat, farLon)).miles,
    )
    # distance is returned in km from geodesic method
    return geodesic((nearLat, nearLon), (farLat, farLon)).miles


@router.get("/radius-push-notification")
async def get_radius_to_determine_push_notification(
    lat: float,
    lon: float,
    radius: int,
    token: str,
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
        trail = trails[0]

        message = f"It looks like you're using {trail['name']}, today."

        def send_notification():
            return PushClient().publish(
                PushMessage(
                    to=token,
                    body=message,
                    data=trails[0],
                )
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


@router.get("/trail/notification-enabled")
async def enable_trail_notification(trailId: str):
    notification = await Notification.create(data={"trail_id": trailId})

    print("***notification***: ", notification)

    return {notification: "notification enabled"}


@router.get("/get-trail")
async def search_trails(trailId: str):
    trail = await Trail.find_unique(where={"id": trailId})

    return {"trail": trail}
