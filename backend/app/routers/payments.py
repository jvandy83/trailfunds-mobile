import uuid

from fastapi import APIRouter, Depends, HTTPException

from typing import Annotated

from pydantic import BaseModel

from dependencies import get_auth

import stripe

from src.prisma import Trailbucks as TrailbucksModel, Transaction, TrailOrg, Trail

stripe.api_key = "sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn"
# stripe.ApplePayDomain.create(
#   domain_name="trailfunds.ngrok.io"
# )


class User(BaseModel):
    first_name: str
    last_name: str
    email: str
    id: str


class Donation(BaseModel):
    amount: str
    userId: str
    trailId: str


class Trailbucks(BaseModel):
    amount: str
    userId: str


router = APIRouter(
    prefix="/api/v1",
    tags=["payments"],
    dependencies=[Depends(get_auth)],
    responses={401: {"description": "Not authorized"}},
)


@router.get("/payment-intents/{amount}")
async def make_payment_intent(amount: str):
    try:
        customer = stripe.Customer.create(name="Jared")
        ephemeral_key = stripe.EphemeralKey.create(
            customer=customer["id"],
            stripe_version="2020-03-02",
        )

        payment_intent = stripe.PaymentIntent.create(
            amount=int(amount) * 100, currency="USD", customer=customer.id
        )

        return {
            "message": "Payment initiated!",
            "paymentIntent": payment_intent.client_secret,
            "customer": customer,
            "ephemeralKey": ephemeral_key.secret,
            "data": payment_intent,
        }

    except Exception as e:
        print(e)
        return {"message": "Error"}


@router.post("/trailbucks")
async def add_trailbucks(data: Trailbucks):
    existing_trailbucks_account = await TrailbucksModel.find_unique(
        where={"user_id": data.userId}
    )

    # this will eventually involve calling/receiving
    # a balance from the users financial account

    if existing_trailbucks_account is not None:
        current_balance = existing_trailbucks_account.amount
        deposit = int(data.amount)
        await TrailbucksModel.update(
            where={"user_id": data.userId}, data={"amount": current_balance + deposit}
        )

        return {"msg": "success"}

    try:
        trailbucks = await TrailbucksModel.create(
            data={
                "amount": int(data.amount),
                "user_id": data.userId,
            },
        )
        print(trailbucks)
    except Exception as e:
        print("Error: ", e)

    return {"Error": e}


@router.post("/donate")
async def donate_trailbucks(data: Donation):
    existing_trailbucks_account = await TrailbucksModel.find_unique(
        where={"user_id": data.userId}
    )

    trail_data = await Trail.find_unique(where={"id": data.trailId})

    # this will eventually involve calling/receiving
    # a balance from a Trailfunds stripe account

    if existing_trailbucks_account is not None:
        current_balance = existing_trailbucks_account.amount
        donation = int(data.amount)
        await TrailbucksModel.update(
            where={"user_id": data.userId}, data={"amount": current_balance - donation}
        )

        transaction = await Transaction.create(
            data={
                "amount": int(data.amount),
                "user_id": data.userId,
                "trail_org_id": trail_data.trail_org_id,
                "trail_id": data.trailId,
                "confirmation_number": str(uuid.uuid4())[5:12],
            },
        )

        print("***transaction.id inside Donate endpoint***: ", transaction.id)

        return transaction.id

    return {"msg": "Please add funds to your Trailbucks account :)"}


@router.get("/current-balance")
async def get_current_balance(user: Annotated[User, Depends(get_auth)]):
    current_account = await TrailbucksModel.find_unique(where={"user_id": user["id"]})

    current_balance = current_account.amount

    return current_balance


@router.get("/transactions")
async def get_transactions(user: Annotated[User, Depends(get_auth)]):
    transactions_trail_orgs = await Transaction.find_many(
        order={"created_at": "desc"},
        include={"trail": True, "trail_org": True},
        where={"user_id": user["id"]},
    )

    return transactions_trail_orgs


@router.get("/transaction/{transactionId}")
async def get_transaction(transactionId: str):
    print("***transactionId inside get transaction request***: ", transactionId)
    transaction = await Transaction.find_unique(
        where={"id": transactionId},
        include={"user": True, "trail": True, "trail_org": True},
    )
    print("***transaction***: ", transaction)

    return transaction
