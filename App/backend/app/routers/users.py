from fastapi import APIRouter, Depends

from typing import Annotated

from src.prisma import User as UserModel

from pydantic import BaseModel

from dependencies import get_auth

class User(BaseModel): 
    first_name: str
    last_name: str
    email: str
    id: str
    is_new: bool

router = APIRouter(
    prefix="/api/v1/users",
    tags=["users"],
    dependencies=[Depends(get_auth)],
    responses={401: {"description": "Not authorized"}},
)

@router.get('/me')
async def get_user(user: Annotated[User, Depends(get_auth)]):
 
  current_user = await UserModel.find_unique(where={'id': user['id']})

  print('current_user: ', current_user)

  return { 'firstName': current_user.first_name, 'isNew': current_user.is_new, 'id': current_user.id }
  