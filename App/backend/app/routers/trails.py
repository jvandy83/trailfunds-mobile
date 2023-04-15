from fastapi import APIRouter, Depends, HTTPException

from pydantic import BaseModel

from src.prisma import prisma_trail

# class QParams(BaseModel):
#   lat: float
#   lon: float

# from dependencies import get_auth

router = APIRouter(
    prefix="/api/v1/trails",
    tags=["trails"],
)

@router.get('/near-me')
async def get_trails_near_me(lat: float, lon: float, radius: int):
  print(lat, lon, radius)

  trails = await prisma_trail.query_raw(
    f'''
    SELECT id, latitude, longitude, name
    FROM "Trail" WHERE ST_DWithin(ST_MakePoint(longitude, latitude),
    ST_MakePoint({lat}, {lon})::geography, {radius} * 1000 )
    ''',
  )
  print('trails_query: ', trails)


  return {'trails': trails}
  