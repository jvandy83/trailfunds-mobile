
import json

from src.prisma import prisma_user, prisma

trails = None
 
# Opening JSON file
with open('TrailData.json', 'r') as openfile:
 
    # Reading from json file
    raw = json.load(openfile)
    trails = raw['features']

filtered_trails = []
 
for trail in trails:
  filtered_trails.append({'latitude': trail['geometry']['coordinates'][0], 'longitude': trail['geometry']['coordinates'][1], 'name': trail['properties']['Name']})

async def create_seed_trails():
  await prisma.connect()
  await prisma_user.create_many(
    data=filtered_trails
  )
  await prisma.disconnect()


create_seed_trails()

"""


{
  "geometry": {
    "coordinates": [-108.55511, 39.081311], 
    "type": "Point"
  }, 
  "properties": {
    "Name": "Escalante Hall", "altitudeMode": "clampToGround", "begin": null, "drawOrder": null, "end": null, "extrude": "0", "icon": null, "snippet": "", "tessellate": "-1", "timestamp": null, "visibility": "-1"
  }, 
  "type": "Feature"
}

{
  latitude: coordinates[0]
  longitude: coordinates[1]
  name: properties['name']
}


"""