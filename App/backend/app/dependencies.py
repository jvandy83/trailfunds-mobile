from typing import Annotated

from pydantic import BaseModel

from fastapi import Depends, HTTPException, status

from fastapi.security import OAuth2PasswordBearer

from src.prisma import prisma_user

from config import Settings

import jwt

settings = Settings()

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

def get_auth(token: Annotated[str, Depends(oauth2_scheme)]):
  print('*** token *** :', token)
  credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
  )
  try:
    user = jwt.decode(token, key='secret', algorithms=['HS256'])
    return user
  except Exception as e:
    print('error in decoding jwt: ', e)
    raise credentials_exception
