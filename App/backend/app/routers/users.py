from fastapi import APIRouter, Depends, HTTPException

from typing import Annotated

from pydantic import BaseModel

from dependencies import get_auth

class User(BaseModel): 
    first_name: str
    last_name: str
    email: str
    id: str

router = APIRouter(
    prefix="/api/v1/users",
    tags=["users"],
    dependencies=[Depends(get_auth)],
    responses={401: {"description": "Not authorized"}},
)

@router.get('/me')
async def get_user(current_user: Annotated[User, Depends(get_auth)]):
  return current_user
  