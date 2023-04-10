import os

from src.prisma import prisma

from fastapi import FastAPI
from pydantic import BaseModel

from typing import Tuple, List, Any

from fastapi_auth_middleware import FastAPIUser, AuthMiddleware

from starlette.authentication import BaseUser

import stripe

import asyncio

import bcrypt

import jwt

stripe.api_key='sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn'
stripe.ApplePayDomain.create(
  domain_name="trailfunds.ngrok.io"
)

app = FastAPI()

# fastapi helper method
# to parse accessToken
# sent from client
# inside request header
def verify_authorization_header(auth_header: str) -> Tuple[List[str], BaseUser]: 
  # Returns a Tuple of a List of scopes (string) and a BaseUser
  user = FastAPIUser(first_name="Code", last_name="Specialist", user_id=1)  # Usually you would decode the JWT here and verify its signature to extract the 'sub'
  scopes = []  # You could for instance use the scopes provided in the JWT or request them by looking up the scopes with the 'sub' somewhere
  return [scopes, user]

# these models represent
# request body from client
class Donation(BaseModel):
    amount: int
class User(BaseModel):
    email: str
    password: str
class UserLogin(BaseModel):
    id: str
    isNew: bool | None = None
    email: str
    password: str
class UserSignUp(BaseModel):
    firstName: str
    lastName: str
    email: str
    password: str

# add middleware to read accessToken from frontend
app.add_middleware(AuthMiddleware, verify_header=verify_authorization_header)

@app.on_event("startup")
async def startup():
    await prisma.connect()
@app.on_event("shutdown")
async def shutdown():
    await prisma.disconnect()

@app.get("/")
async def root():
  return {"message": "Hello World"}

@app.get('/api/v1/user/test')
async def test():
  return { 'msg': 'test was successful'}

### Stripe payments ###
@app.post('/api/v1/payment-intents')
async def make_payment_intent(donation: Donation):
  print(donation)

  try:
    customer = stripe.Customer.create(
        name = 'Jared'
    )
    ephemeral_key = stripe.EphemeralKey.create(
        customer=customer['id'],
        stripe_version='2020-03-02',
    )

    payment_intent = stripe.PaymentIntent.create(
        amount = int(donation.amount) * 100,
        currency = 'USD',
        customer = customer.id
    )
    print('***ephemeral_key***: ', ephemeral_key)
    print('***customer***: ', customer)
    print('***payment_intent***: ', payment_intent)
    
    return {'message': 'Payment initiated!', 'paymentIntent': payment_intent.client_secret, 'customer': customer, 'ephemeralKey': ephemeral_key.secret, 'data': payment_intent }
    
  except Exception as e:
    print(e)
    return {'message': 'Error'}

### this is for web applications only ###
@app.get('/.well-known/apple-developer-merchantid-domain-association')
async def verify_merchant_account():
  return send_file(path.normpath('./stripe/apple-developer-merchantid-domain-association'))

@app.post('/api/v1/user/sign-up')
async def sign_up(user: UserSignUp):

  print('*** USER ***: ', user)

  hashed_password = None

  try:
    password = user.password.encode('utf-8')
    hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())

  except Exception as e:
    print(e)
  
  user = await prisma.user.create(
      data={
        'first_name': user.firstName,
        'last_name': user.lastName,
        'email': user.email,
        'password': hashed_password.decode()
      }
  )

  print(f'created user: {user.json(indent=2, sort_keys=True)}')

  new_user = await prisma.user.find_unique(where={'id': user.id } )
  assert new_user is not None
  print(f'found user: {new_user.json(indent=2, sort_keys=True)}')


  # find better way to exclude 
  # password using prisma query
  user_without_password = { 'first_name': new_user.first_name,'last_name': new_user.last_name,'email': new_user.email }
  print('*** user_without_password ***: ', user_without_password)

  access_token = jwt.encode({'id': new_user.id }, "secret", algorithm="HS256")

  return { 'currentUser': user_without_password, 'accessToken': access_token, 'isNew': True }

@app.post('/api/v1/user/login')
async def login(user: UserLogin) -> Any:
  print('*** USER ***: ', user)

  user = await prisma.user.find_unique(where={'id': user.id } )

  if user != None:
    user_without_password = { 'first_name': user.first_name,'last_name': user.last_name,'email': user.email, 'id': user.id }
    access_token = jwt.encode({'id': user.id }, "secret", algorithm="HS256")
    return { 'currentUser': user_without_password, 'accessToken': access_token, 'isNew': False,  }
  else:
    return { 'msg': 'User does not exist with that email'}

@app.get('/api/v1/user/{user_id}')
async def get_user(user_id):
  access_token = 'abc'
  refresh_token = '123'
  return {'user': {'firstName': 'Jared', 'lastName': 'Vandeventer', 'isNew': False, 'id': '123456', 'accessToken': access_token, 'refreshToken': refresh_token }}

  
