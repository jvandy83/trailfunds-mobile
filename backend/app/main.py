from src.prisma import prisma, Trail, TrailOrg

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

    print("trail length: ", len(trails))

    # print(trails)

    if len(trails) == 0:
        filtered_trails = []

        # Opening JSON file
        with open("TrailData.json", "r") as openfile:
            # Reading from json file
            raw = json.load(openfile)
            trails = raw["features"]

            trail_org = await TrailOrg.create(data=({"name": "COPMOBA"}))

            print("***trail_org***: ", trail_org)

            for trail in trails:
                filtered_trail = {
                    "longitude": trail["geometry"]["coordinates"][0],
                    "latitude": trail["geometry"]["coordinates"][1],
                    "name": trail["properties"]["Name"],
                }
                updated_trail = await Trail.create(
                    data={**filtered_trail, "trail_org_id": trail_org.id}
                )

                print("***updated_trail dict***: ", dict(updated_trail))

                filtered_trails.append(dict(updated_trail))

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
