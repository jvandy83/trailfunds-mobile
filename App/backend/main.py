from fastapi import FastAPI
from pydantic import BaseModel

import stripe

stripe.api_key='sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn'
stripe.ApplePayDomain.create(
  domain_name="trailfunds.ngrok.io"
)

app = FastAPI()

class Donation(BaseModel):
    amount: int
class User(BaseModel):
    email: str
    password: str
class UserLogin(BaseModel):
    email: str
    password: str
class UserSignUp(BaseModel):
    firstName: str
    lastName: str
    email: str
    password: str


@app.get('/api/v1/auth/test')
async def test():
  return { 'msg': 'test was successful'}

@app.get("/")
async def root():
  return {"message": "Hello World"}

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

@app.post('api/v1/auth/login')
async def login(user: UserLogin):
  email = ['vanthedev@gmail.com']
  password = 'password'
  access_token = 'abc'
  refresh_token = '123'

  if user.email in email and user.password == password:
    return {'msg': 'success', 'isLoggedIn': True, 'accessToken': access_token, 'refreshToken': refresh_token, 'user': {'firstName': 'Jared', 'lastName': 'Vandeventer'} }
  else:
    return {'msg': 'login information is incorrect'}
    


@app.post('/api/v1/auth/sign-up')
async def sign_up(user: UserSignUp):
  access_token = 'abc'
  refresh_token = '123'
  
  emails = ['sdfasd', 'asdfasd', 'asdfasdfa']

  if user.email in emails:
    return { 'error': 'user with that email already exists'}
  else:
    # hash password 
    # save user to DB
    return { 'firstName': 'Jared', 'lastName': 'Vandeventer', 'isNew': True, 'id': '123456', 'accessToken': access_token, 'refreshToken': refresh_token}

@app.get('/api/v1/user/{user_id}')
async def get_user(user_id):
  access_token = 'abc'
  refresh_token = '123'
  return {'user': {'firstName': 'Jared', 'lastName': 'Vandeventer', 'isNew': False, 'id': '123456', 'accessToken': access_token, 'refreshToken': refresh_token }}

 
