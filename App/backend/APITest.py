from flask import Flask, jsonify, request
from http import HTTPStatus
import main
import users
import config
app = Flask(__name__)
db=config.DB_TEST_Trailfunds 
members = []
# recipes = []
####-=-=-=-=-=NOTE=-=-=-=-=-####
#   The calls can come from SQL not just taking in the full DB into a Json
#   If we do that we make more SQL Requests and Not have 2 places to change 
#   I was using this as a proof of consept
#### int and find LENGTH ####

i = 1
length =  users.fetch_row_length(db) 
for i in range(1, length + 1):
    members.append(users.select_user_by_id(i,db))

#### Basic GET ####
@app.route('/recipes', methods=['GET'])
def get_recipes():
    return jsonify({'data': recipes})


@app.route('/recipes/<int:recipe_id>', methods=['GET'])
def get_recipe(recipe_id):
    recipe = next((recipe for recipe in recipes if recipe['ContentID'] == recipe_id), None)
    if recipe:
        return jsonify(recipe)

    return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND

@app.route('/recipes/Group/<int:GroupID>', methods=['GET'])
def get_Group(GroupID):
    recipelist = []
    for recipe in recipes:
        if recipe['GroupID'] == GroupID:
            recipelist.append(recipe)
    if recipe:
        return jsonify(recipelist)

    return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND

@app.route('/recipes/Page/<int:PageID>', methods=['GET'])
def get_Page(PageID):
    recipelist = []
    for recipe in recipes:
        if recipe['PageID'] == PageID:
            recipelist.append(recipe)
    if recipe:
        return jsonify(recipelist)

    return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND

@app.route('/recipes', methods=['POST'])
def create_recipe():
    data = request.get_json()
    GroupID = data.get("GroupID")
    ContentType = data.get('ContentType')
    ContentHeld = data.get('ContentHeld')
    PageID = data.get("PageID")

    recipe = {
        'ContentID': len(recipes) + 1,
        'GroupID': GroupID,
        'ContentType': ContentType,
        'ContentHeld': ContentHeld,
        'PageID': PageID
    }
    print(recipe)

    recipes.append(recipe)
    content.insert_content(recipe, db)
    return jsonify(recipe), HTTPStatus.CREATED

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
    APITest.run()
