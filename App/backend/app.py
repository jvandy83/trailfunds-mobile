from flask import Flask, jsonify, request, send_file
from http import HTTPStatus
from flask_cors import CORS

from os import path

import main
import users
import trails
import maintainers
import donations
import config

import stripe


stripe.api_key='sk_test_D4pNByx08dJpJShCHbDp79Y70007pq01Qn'
stripe.ApplePayDomain.create(
  domain_name="trailfunds.ngrok.io"
)

app = Flask(__name__)
CORS(app)

db=config.DB_TEST_Trailfunds
members = []
trails_A = []
maintainerlist = []
donationlist = []

main.Test_DB()
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

i = 1
donationLength = donations.fetch_row_length(db) ##SQL Query
for i in range(1, donationLength + 1):
   donationlist.append(donations.select_Donations_by_id(i,db))

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

@app.route('/donations', methods=['GET'])
def get_donations():
    return jsonify({'data': donationlist})



@app.route('/members/<int:member_id>', methods=['GET'])
def get_member(member_id):

    ### for member in members.all():
    member = next((member for member in members if member['User_ID'] == member_id), None)
    if member:
        return jsonify(member)

    return jsonify({'message': 'User not found'}), HTTPStatus.NOT_FOUND

@app.route('/members/<string:username>/<string:password>', methods=['GET'])
def get_memberbyusername(username,password):

    ### for member in members.all():
    member = next((member for member in members if member['Username'] == username), None)
    if member and password == member['Password']:
        return jsonify(member['User_ID'])

    return jsonify({'message': 'User not found'}), HTTPStatus.NOT_FOUND

@app.route('/trails/<int:trails_id>', methods=['GET'])
def get_trailbyID(trails_id):

    ### for member in members.all():
    trail = next((trail for trail in trails_A if trail['Trail_ID'] == trails_id), None)
    if trail:
        return jsonify(trail)

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

@app.route('/donations/<int:member_id>', methods=['GET'])
def get_donations_by_member(member_id):
    memberdonations = []
    for donation in donationlist:
        if donation['User_ID'] == member_id:
            memberdonations.append(donation)
    if  memberdonations != None:
        return jsonify( memberdonations)

    return jsonify({'message': 'User not found'}), HTTPStatus.NOT_FOUND


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

@app.route('/donations', methods=['POST'])
def create_donation():
    data = request.get_json()
    Ammount = data.get("Ammount")
    Date = data.get("Date")
    Maintainer_ID = data.get("Maintainer_ID")
    Time = data.get("Time")
    Trail_ID = data.get("Trail_ID")
    User_ID = data.get("User_ID")

    donation = {
        'User_ID': User_ID,
        'Donation_ID': len(donationlist) + 1,
        'Ammount': Ammount,
        'Date': Date,
        'Maintainer_ID': Maintainer_ID,
        'Time': Time,
        'Trail_ID': Trail_ID

    }
    print(donation)

    donationlist.append(donation)
    donations.insert_Donations(donation, db)
    return jsonify(donation), HTTPStatus.CREATED

###  Example... for put, will implement when needed
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

### DELETE FUNCTION #### BUG ####  Demo will implement after!!!
@app.route('/recipes/DeleteByID/<int:ContentID>',methods=['DELETE'])
def Delete_ByID(ContentID):
    recipe = next((recipe for recipe in recipes if recipe['ContentID'] == ContentID), None)
    if not recipe:
        return jsonify({'message': 'recipe not found'}), HTTPStatus.NOT_FOUND
    recipes.remove(recipe)
    return jsonify(recipes)

### Stripe payments ###
@app.route('/payment-intents', methods=['POST'])
def make_payment_intent():

    print(request.json)
    
    amount = request.json['amount']

    try:
        customer = stripe.Customer.create(
            name = 'Jared'
        )
        ephemeral_key = stripe.EphemeralKey.create(
            customer=customer['id'],
            stripe_version='2020-03-02',
        )

        payment_intent = stripe.PaymentIntent.create(
            amount = int(amount) * 100,
            currency = 'USD',
            customer = customer.id
        )
        print('***ephemeral_key***: ', ephemeral_key)
        print('***customer***: ', customer)
        print('***payment_intent***: ', payment_intent)
        return jsonify({ 'message': 'Payment initiated!', 'paymentIntent': payment_intent.client_secret, 'customer': customer, 'ephemeralKey': ephemeral_key.secret, 'data': payment_intent })
    
    except Exception as e:
        print(e)
        return jsonify({'message': 'Error'})

@app.route('/.well-known/apple-developer-merchantid-domain-association', methods=['GET'])
def verify_merchant_account():
    return send_file(path.normpath('./stripe/apple-developer-merchantid-domain-association'))

if __name__ == '__main__':
    app.run()
