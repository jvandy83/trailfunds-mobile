import os

from src.prisma import prisma

from fastapi import FastAPI, Request, HTTPException
from fastapi_auth_middleware import FastAPIUser, AuthMiddleware
from pydantic import BaseModel

from routers import users, auth, payments

from typing import Tuple, List, Any

app = FastAPI()

app.include_router(users.router)
app.include_router(auth.router)
app.include_router(payments.router)

# DB setup and tear down
@app.on_event("startup")
async def startup():
    await prisma.connect()
@app.on_event("shutdown")
async def shutdown():
    await prisma.disconnect()

@app.get("/")
async def root():
  return {"message": "Hello World"}




  
