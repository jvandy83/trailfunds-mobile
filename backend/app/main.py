from src.prisma import prisma, Trail

import json

from fastapi import FastAPI

from routers import users, auth, payments, trails

app = FastAPI()

app.include_router(users.router)
app.include_router(auth.router)
app.include_router(payments.router)
app.include_router(trails.router)


async def seed_db():
    trails = await Trail.find_many()

    filtered_trails = []

    if len(trails) == 0:
        # Opening JSON file
        with open("TrailData.json", "r") as openfile:
            # Reading from json file
            raw = json.load(openfile)
            trails = raw["features"]

            for trail in trails:
                filtered_trails.append(
                    {
                        "longitude": trail["geometry"]["coordinates"][0],
                        "latitude": trail["geometry"]["coordinates"][1],
                        "name": trail["properties"]["Name"],
                        "trail_org_id": "clgpr0tu9000181qk6888h4jo",
                    }
                )

            await Trail.create_many(data=filtered_trails)

            return {"msg": "trails were created"}

    return {"msg": "trails already exist"}


# DB setup and tear down
@app.on_event("startup")
async def startup():
    await prisma.connect()


@app.on_event("shutdown")
async def shutdown():
    await prisma.disconnect()


@app.get("/")
async def root():
    return {"msg": "server is running"}


@app.get("/seed-db")
async def add_trails():
    res = await seed_db()
    return res
