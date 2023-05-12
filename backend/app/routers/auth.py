from fastapi import APIRouter, HTTPException

from src.prisma import User

from config import Settings

from typing import Annotated

from pydantic import BaseModel

import bcrypt

import jwt

settings = Settings()


class UserLogin(BaseModel):
    email: str
    password: str
    isNew: bool


class UserSignUp(BaseModel):
    firstName: str
    lastName: str
    email: str
    password: str
    isNew: bool


router = APIRouter(
    prefix="/api/v1/auth",
    tags=["auth"],
    responses={404: {"description": "Not found"}},
)


@router.post("/sign-up")
async def sign_up(user: UserSignUp):
    existing_user = await User.find_first(where={"email": user.email})

    if existing_user is not None:
        raise HTTPException(status_code=404, detail="E-mail is already in use")

    hashed_password = bcrypt.hashpw(user.password.encode("utf-8"), bcrypt.gensalt())

    created_user = await User.create(
        data={
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": hashed_password.decode(),
            "trailbucks": {
                "create": {
                    "amount": 0,
                }
            },
        }
    )

    # find better way to exclude
    # password using a query
    # or using decorator in prisma file

    access_token = jwt.encode({"id": created_user.id}, settings.secret, "HS256")

    return {
        "currentUser": {
            "email": created_user.email,
            "firstName": created_user.first_name,
            "lastName": created_user.last_name,
            "id": created_user.id,
        },
        "accessToken": access_token,
    }


@router.post("/login")
async def login(user: UserLogin):
    existing_user = await User.find_first(where={"email": user.email})

    if existing_user:
        hashed_password = existing_user.password

        if (
            bcrypt.checkpw(
                user.password.encode("utf-8"), hashed_password.encode("utf-8")
            )
            and existing_user is not None
        ):
            # update user.is_new = false
            updated_user = await User.update(
                where={
                    "id": existing_user.id,
                },
                data={
                    "is_new": {
                        "set": False,
                    },
                },
            )

            access_token = jwt.encode(
                {"id": updated_user.id, "isNew": updated_user.is_new}, settings.secret
            )

            return {
                "currentUser": {
                    "email": updated_user.email,
                    "firstName": updated_user.first_name,
                    "lastName": updated_user.last_name,
                    "id": updated_user.id,
                },
                "accessToken": access_token,
            }

    else:
        raise HTTPException(status_code=404, detail="Username or password in incorrect")
