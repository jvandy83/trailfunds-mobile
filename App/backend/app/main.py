from src.prisma import prisma, Trail

from fastapi import FastAPI

from routers import users, auth, payments, trails

from scripts.seed import seed_db

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

@app.get("/seed-db")
async def root():
  res = await seed_db(Trail)
  return res




  
