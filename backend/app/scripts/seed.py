import os
import json


async def seed_db(Trail):
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
                    }
                )

            await Trail.create_many(data=filtered_trails)

            return {"msg": "trails were created"}

    return {"msg": "trails already exist"}


"""
{
  "geometry": {        LON         LAT
    "coordinates": [-108.55511, 39.081311], 
    "type": "Point"
  }, 
  "properties": {
    "Name": "Escalante Hall", "altitudeMode": "clampToGround", "begin": null, "drawOrder": null, "end": null, "extrude": "0", "icon": null, "snippet": "", "tessellate": "-1", "timestamp": null, "visibility": "-1"
  }, 
  "type": "Feature"
}
"""
