import sqlite3
import generic
import config
import users
import trails
import maintainers
import donations
import random
  
maintainers.test_Maintainers()
trails.test_Trails()
users.test_Users()
donations.test_Donations()
def drop_all_tables(db = config.DB_TEST_Trailfunds):
    generic.drop_table('Users',db)
    generic.drop_table('Donations',db)
    generic.drop_table('Trails',db)
    generic.drop_table('Maintainer',db)



def getdonationwithname(id, db = config.DB_TEST_Trailfunds):
    print("select_Extended_Donation_by_id()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
      SELECT Donations.Donation_ID, Users.First_Name, Users.Last_Name, Donations.Ammount
      FROM Donations
      INNER JOIN Users ON Donations.User_ID = Users.User_ID
      """
    params = {'Donation_ID':id}
    cur.execute(sql,params)
    response=cur.fetchone()
    print("-=-=-=-=-=-=-=-=-=-=-=--=-=-")
    print(" donationID, Firstname, Lastname, Amount")
    print("-=-=-=-=-=-=-=-=-=-=-=--=-=-")
    for row in cur.execute(sql, params):
        print(row)
    if response != None:
        return {
            'Donation_ID' :id,
            'User_ID': response[0],
            'First_Name':response[1],
            'Last_Name': response[2],
            'Ammount': response[3]
        }
    else:
        return None
print(' ')
print("-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-")
print("          Multi Tabel Query                ")
print("-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-")

def Test_DB():
  # Drop All tabels
  db=config.DB_TEST_Trailfunds
  drop_all_tables(db)
  donations.create_Donations_table(db)
  users.create_user_table(db)
  trails.create_trail_table(db)
  maintainers.create_Maintainer_table(db)
  # Create tabels
  # Populate fields ~ 20 peer tabel
  # USERS
  User1 = users.insert_User({'First_Name':'Lauryn','Last_Name':'Ali','Middle_Initial':'A','Address':'352 West Rd','State':'NH','ZipCode': 13301,'FavoriteTrail':1,'Username':'User1','Password':'1234','Email':'User1@gmail.com'},db)
  User2 = users.insert_User({'First_Name':'Shane','Last_Name':'Love','Middle_Initial':'B','Address':'123 Ave','State':'MN','ZipCode':32159,'FavoriteTrail':1,'Username':'User2','Password':'2234','Email':'User2@gmail.com'},db)
  User3 = users.insert_User({'First_Name':'Hamish','Last_Name':'Robertson','Middle_Initial':'C','Address':'250 Mesa','State':'CO','ZipCode':81501,'FavoriteTrail':2,'Username':'User3','Password':'3234','Email':'User3@gmail.com'},db)
  User4 = users.insert_User({'First_Name':'Lily-Mae','Last_Name':'Whitfield','Middle_Initial':'D','Address':'9408 Hackberry LN','State':'CO','ZipCode':80129,'FavoriteTrail':3,'Username':'User4','Password':'4234','Email':'User4@gmail.com'},db)
  User5 = users.insert_User({'First_Name':'Ruby','Last_Name':'Walsh','Middle_Initial':'E','Address':'123 Car Ave','State':'AZ','ZipCode':31088,'FavoriteTrail':4,'Username':'User5','Password':'5234','Email':'User5@gmail.com'},db)
  User6 = users.insert_User({'First_Name':'Sidra','Last_Name':'Battle','Middle_Initial':'F','Address':'901 Main St','State':'NH','ZipCode':27834,'FavoriteTrail':5,'Username':'User6','Password':'6234','Email':'User6@gmail.com'},db)
  User7 = users.insert_User({'First_Name':'Jasmine','Last_Name':'Phelps','Middle_Initial':'G','Address':'Tree Lane','State':'NY','ZipCode':27665,'FavoriteTrail':6,'Username':'User7','Password':'7234','Email':'User7@gmail.com'},db)
  User8 = users.insert_User({'First_Name':'Anastasia','Last_Name':'Schaefer','Middle_Initial':'H','Address':'135 stellarJay Way','State':'NM','ZipCode':39874,'FavoriteTrail':7,'Username':'User8','Password':'8234','Email':'User8@gmail.com'},db)
  User9 = users.insert_User({'First_Name':'Saskia','Last_Name':'Cope','Middle_Initial':'I','Address':'932 Creststone Way','State':'WY','ZipCode':80982,'FavoriteTrail':9,'Username':'User9','Password':'9234','Email':'User9@gmail.com'},db)
  User10 = users.insert_User({'First_Name':'Shea','Last_Name':'Terrell','Middle_Initial':'G','Address':'9981 Highway lane','State':'IL','ZipCode':67503,'FavoriteTrail':8,'Username':'User10','Password':'1034','Email':'User10@gmail.com'},db)

  #trails

  Trail1 = trails.insert_Trail({'Trail_Name':'Trail_1',  'Latitude':1234.309,'Longitude':4321.918,'Maintainer_ID':1},db)
  Trail2 = trails.insert_Trail({'Trail_Name':'Trail_2',  'Latitude':2234.309,'Longitude':4322.918,'Maintainer_ID':2},db)
  Trail3 = trails.insert_Trail({'Trail_Name':'Trail_3',  'Latitude':3234.309,'Longitude':4323.918,'Maintainer_ID':3},db)
  Trail4 = trails.insert_Trail({'Trail_Name':'Trail_4',  'Latitude':4234.309,'Longitude':4324.918,'Maintainer_ID':1},db)
  Trail5 = trails.insert_Trail({'Trail_Name':'Trail_5',  'Latitude':5234.309,'Longitude':4325.918,'Maintainer_ID':2},db)
  Trail6 = trails.insert_Trail({'Trail_Name':'Trail_6',  'Latitude':6234.309,'Longitude':4326.918,'Maintainer_ID':3},db)
  Trail7 = trails.insert_Trail({'Trail_Name':'Trail_7',  'Latitude':7234.309,'Longitude':4327.918,'Maintainer_ID':1},db)
  Trail8 = trails.insert_Trail({'Trail_Name':'Trail_8',  'Latitude':8234.309,'Longitude':4328.918,'Maintainer_ID':2},db)
  Trail9 = trails.insert_Trail({'Trail_Name':'Trail_9',  'Latitude':9234.309,'Longitude':4329.918,'Maintainer_ID':3},db)
  Trail10 = trails.insert_Trail({'Trail_Name':'Trail_10','Latitude':1034.309,'Longitude':4301.918,'Maintainer_ID':4},db)

  #maintainers

  Maintainer1 = maintainers.insert_Maintainer({'Maintainer_Name':'Maintaner_1', 'Address':'123 Main St', 'State':'CO', 'ZipCode':81501,'Username':'Main1', 'Password':'1234', 'Email':'maintainer1@gmail.com'},db)
  Maintainer2 = maintainers.insert_Maintainer({'Maintainer_Name':'Maintaner_2', 'Address':'223 Main St', 'State':'CO', 'ZipCode':80129,'Username':'Main2', 'Password':'2234', 'Email':'maintainer2@gmail.com'},db)
  Maintainer3 = maintainers.insert_Maintainer({'Maintainer_Name':'Maintaner_3', 'Address':'323 Main St', 'State':'CO', 'ZipCode':81081,'Username':'Main3', 'Password':'3234', 'Email':'maintainer3@gmail.com'},db)
  Maintainer4 = maintainers.insert_Maintainer({'Maintainer_Name':'Maintaner_4', 'Address':'423 Main St', 'State':'CO', 'ZipCode':81501,'Username':'Main4', 'Password':'4234', 'Email':'maintainer4@gmail.com'},db)

  DonationAmmount = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
  donationArray = [0]
  #Donations
  for i in range(100):
    Ammount = random.choice(DonationAmmount)
    UserID = random.randrange(1, 9, 1)
    TrailID = random.randrange(1, 9, 1)
    MaintainerID = random.randrange(1, 3, 1)
    temp = donations.insert_Donations({'User_ID':UserID, 'Trail_ID':TrailID, 'Maintainer_ID': MaintainerID, 'Ammount':Ammount,'Date': '', 'Time': '' },db)
    donationArray.append(temp)

  # Start INner Joieens
    # Show all donations for a user by id
    # insert new donation by custom insert ie: only thing needed is amount
    # show all donations to a single maintainer
    # show all donations to a trail
    # show all trails for a maintainer
    # 
def filterDonationsByUser_Name(First_Name,db = config.DB_TEST_Trailfunds):
  print("FitlerByName()")
  connection = sqlite3.connect(db)
  cur = connection.cursor()
  sql = """
    SELECT Donations.Donation_ID, Users.First_Name, Users.Last_Name, Donations.Ammount
    FROM Donations
    INNER JOIN Users ON Donations.User_ID = Users.User_ID
    WHERE FIRST_NAME = Users.First_Name 
    """
  params = {'FIRST_NAME':First_Name}
  cur.execute(sql,params)
  response=cur.fetchone()
  print("-=-=-=-=-=-=-=-=-=-=-=--=-=-")
  print(" donationID, Firstname, Lastname, Amount")
  print("-=-=-=-=-=-=-=-=-=-=-=--=-=-")
  for row in cur.execute(sql, params):
      print(row)
  if response != None:
    return {
          'Donation_ID' :response[0],
          'User_ID': response[1],
          'First_Name':First_Name,
          'Last_Name': response[2],
          'Ammount': response[3]
        }
  else:
    return None



db=config.DB_TEST_Trailfunds
#Test_DB()
getdonationwithname(1, db)
donations.print_Donations_table()
filterDonationsByUser_Name('Hamish',db)