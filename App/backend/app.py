from flask import Flask, jsonify, request
from http import HTTPStatus
import main
import users
import trails
import maintainers
import config
app = Flask(__name__)
db=config.DB_TEST_Trailfunds
members = []
trails_A = []
maintainerlist = []
# recipes = []
####-=-=-=-=-=NOTE=-=-=-=-=-####
#  
#
#
#
#
#### int and find LENGTH ####

i = 1
usrlength =  users.fetch_row_length(db) 
for i in range(1, usrlength + 1):
   members.append(users.select_user_by_id(i,db))
i = 1
trailLength =  trails.fetch_row_length(db) 
for i in range(1, trailLength + 1):
   trails_A.append(trails.select_trail_by_id(i,db))

i = 1
maintainerLength =  maintainers.fetch_row_length(db) 
for i in range(1, maintainerLength + 1):
   maintainerlist.append(maintainers.select_Maintainer_by_id(i,db))
#### Basic GETS ####
@app.route('/members', methods=['GET'])
def get_members():
    return jsonify({'data': members})

@app.route('/trails', methods=['GET'])
def get_trails():
    return jsonify({'data': trails_A})

@app.route('/maintainers', methods=['GET'])
def get_maintainers():
    return jsonify({'data': maintainerlist})



@app.route('/members/<int:member_id>', methods=['GET'])
def get_member(member_id):
    member = next((member for member in members if member['User_ID'] == member_id), None)
    if member:
        return jsonify(member)

    return jsonify({'message': 'User not found'}), HTTPStatus.NOT_FOUND

@app.route('/trails/Maintainers/<int:Maintainer_ID>', methods=['GET'])


def get_trailsByMaintainer(Maintainer_ID):
    traillist = []
    for trail in trails_A:
        if trail['Maintainer_ID'] == Maintainer_ID:
            traillist.append(trail)
    if trail:
        return jsonify(triallist)

    return jsonify({'message': 'trails not found'}), HTTPStatus.NOT_FOUND

@app.route('/recipes/Page/<int:PageID>', methods=['GET'])
def get_Page(PageID):
    recipelist = []
    for recipe in recipes:
        if recipe['PageID'] == PageID:
            recipelist.append(recipe)
    if recipe:
        return jsonify(recipelist)

    return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND

@app.route('/members', methods=['POST'])
def create_member():
    data = request.get_json()
    First_Name = data.get('First_Name')
    Last_Name = data.get('Last_Name')
    Middle_Initial = data.get('Middle_Initial')
    Address = data.get("Address")
    State = data.get("State")
    ZipCode = data.get("ZipCode")
    FavoriteTrail = data.get("FavoriteTrail")
    Username = data.get("Username")
    Password = data.get("Password")
    Email = data.get("Email")
    SignUpDate = data.get("SignUpDate")

    member = {
        'User_ID': len(members) + 1,
        'First_Name':  First_Name,
        'Last_Name': Last_Name,
        'Middle_Initial': Middle_Initial,
        'Address': Address, 
        'State': State,
        'ZipCode': ZipCode, 
        'FavoriteTrail': FavoriteTrail,
        'Username': Username,
        'Password': Password,
        'Email': Email,
        'SignUpDate': SignUpDate

    }
    print(member)

    members.append(member)
    users.insert_User(member, db)
    return jsonify(member), HTTPStatus.CREATED

@app.route('/recipes/<int:recipe_id>', methods=['PUT'])
def update_recipe(recipe_id):
    recipe = next((recipe for recipe in recipes if recipe['ContentID'] == recipe_id), None)

    if not recipe:
        return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND

    data = request.get_json()
    recipe.update(
        {
        'GroupID': data.get("GroupID"),
        'ContentType': data.get('ContentType'),
        'ContentHeld': data.get('ContentHeld'),
        'PageID':  data.get('PageID')
        }
    )
    content.update_content_by_id(recipe_id,recipe, db)

    return jsonify(recipe)

### DELETE FUNCTION #### BUG #### 
@app.route('/recipes/DeleteByID/<int:ContentID>',methods=['DELETE'])
def Delete_ByID(ContentID):
    recipe = next((recipe for recipe in recipes if recipe['ContentID'] == ContentID), None)
    if not recipe:
        return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND
    recipes.remove(recipe)
    return jsonify(recipes)

if __name__ == '__main__':
    app.run()
