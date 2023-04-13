from fastapi import APIRouter, Depends, HTTPException

from typing import Annotated

from pydantic import BaseModel

from dependencies import get_auth

import stripe

stripe.api_key='sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn'
stripe.ApplePayDomain.create(
  domain_name="trailfunds.ngrok.io"
)

class User(BaseModel): 
  first_name: str
  last_name: str
  email: str
  id: str

class Donation(BaseModel):
  amount: int

router = APIRouter(
    prefix="/api/v1",
    # tags=["payments"],
    # dependencies=[Depends(get_auth)],
    # responses={401: {"description": "Not authorized"}},
)

@router.post('/payment-intents')
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