import json

from src.prisma import prisma, Trail

from fastapi import FastAPI

from routers import users, auth, payments, trails

app = FastAPI()

app.include_router(users.router)
app.include_router(auth.router)
app.include_router(payments.router)
app.include_router(trails.router)

# DB setup and tear down
@app.on_event("startup")
async def startup():
    await prisma.connect()
    
@app.on_event("shutdown")
async def shutdown():
    await prisma.disconnect()

async def seed_db():
  trails = await Trail.find_many()

  filtered_trails = []

  if len(trails) == 0:
    # Opening JSON file
    with open('TrailData.json', 'r') as openfile:

      # Reading from json file
      raw = json.load(openfile)
      trails = raw['features'] 
        
      for trail in trails:
        filtered_trails.append({ 'longitude': trail['geometry']['coordinates'][0], 'latitude': trail['geometry']['coordinates'][1],'name': trail['properties']['Name']})
        
    #   print('filtered_trails: ', filtered_trails[0])

      await Trail.create_many(
        data=filtered_trails
      )

@app.get("/")
async def root():
  await seed_db()
  return {"message": "Hello World"}




  
