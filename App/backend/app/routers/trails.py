from fastapi import APIRouter

from geopy.distance import geodesic

from src.prisma import Trail

router = APIRouter(
    prefix="/api/v1/trails",
    tags=["trails"],
)

@router.get('/near-me')
async def get_trails_near_me(lat: float, lon: float, radius: int):
  print(lat, lon, radius)

  trails = await Trail.query_raw(
    f'''
    SELECT id, latitude, longitude, name
    FROM "Trail" WHERE ST_DWithin(ST_MakePoint(longitude, latitude),
    ST_MakePoint({lon}, {lat})::geography, {radius} * 1609.34 );
    ''',
  )
  print('trails_query: ', trails)


  return {'trails': trails}

@router.get('/distance-from-me')
async def get_distance_to_trail(nearLat: float, nearLon: float, farLat: float, farLon: float):

  return {'distance': geodesic((nearLat,nearLon ), (farLat,farLon )).miles}
  
@router.get('/search-trails')
async def search_trails(query: str):

  trails = []

  if len(query) > 0:
    trails = await Trail.find_many(
    take = 10,
    where = {
      'name': {
        'contains': query
      }
    })

    return {'trails': trails}

  else:

    return {'trails': trails}
  
@router.get('/get-trail')
async def search_trails(trailId: str):

  print(trailId)

  trail = await prisma_trail.find_unique(where={'id': trailId})

  print(trail)

  return {'trail': trail}
  