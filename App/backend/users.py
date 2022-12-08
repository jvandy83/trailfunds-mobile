import sqlite3
import config
import generic

TABLE_NAME="Users"

COL_USER_ID='User_ID'
COL_First_Name='First_Name'
COL_Last_Name='Last_Name'
COL_Middle_Initial='Middle_Initial'
COL_ADDRESS='Address'
COL_STATE = 'State'
COL_ZipCode = 'ZipCode'
COL_FavoriteTrail = 'FavoriteTrail' #id?
COL_Username = 'Username'
COL_Password = 'Password'
COL_Email = 'Email'
COL_SignUpDate = 'SignUpDate'


def drop_user_table(db = config.DB_TEST_Trailfunds):
    generic.drop_table(TABLE_NAME,db)

def create_user_table(db = config.DB_TEST_Trailfunds):
    print("create_User_table()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = f"""
    create table if not exists {TABLE_NAME} (
        {COL_USER_ID} integer primary key,
        {COL_First_Name} text not null,
        {COL_Last_Name} text not null,
        {COL_Middle_Initial} text not null,
        {COL_ADDRESS} text not null,
        {COL_STATE} text not null,
        {COL_ZipCode} integer not null,
        {COL_FavoriteTrail} integer not null, 
        {COL_Username} text not null,
        {COL_Password} text not null,
        {COL_Email} text not null
    )
    """
    cur.execute(sql)
    connection.commit()
    connection.close()

def insert_User(values,db=config.DB_TEST_Trailfunds):
    print("insert_Users()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
        insert into Users (First_Name,Last_Name,Middle_Initial,Address,State,ZipCode,FavoriteTrail,Username,Password,Email)
        values ( :First_Name, :Last_Name,  :Middle_Initial, :Address, :State, :ZipCode, :FavoriteTrail, :Username, :Password, :Email)
    """
    params = {'First_Name': values['First_Name'],
              'Last_Name': values['Last_Name'],
              'Middle_Initial': values['Middle_Initial'],
              'Address': values['Address'],
              'State': values['State'],
              'ZipCode': values['ZipCode'],
              'FavoriteTrail': values['FavoriteTrail'],
              'Username': values['Username'],
              'Password': values['Password'],
              'Email': values['Email']}
    cur.execute(sql,params)
    connection.commit()
    connection.close()
    return cur.lastrowid

def select_user_by_id(id,db=config.DB_TEST_Trailfunds):
    print("select_user_by_id()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
      select First_Name,Last_Name,Middle_Initial,Address,State,ZipCode,FavoriteTrail,Username,Password,Email from Users
      where (User_ID = :User_ID)
      """
    params = {'User_ID':id}
    cur.execute(sql,params)
    response=cur.fetchone()
    for row in cur.execute(sql, params):
        print(row)
    if response != None:
        return {
            'User_ID' :id,
            'First_Name': response[0],
            'Last_Name': response[1],
            'Middle_Initial': response[2],
            'Address':response[3],
            'State': response[4],
            'ZipCode':response[5],
            'FavoriteTrail': response[6],
            'Username': response[7],
            'Password': response[8],
            'Email': response[9],

        }
    else:
        return None

def fetch_row_length(db):
    connection = sqlite3.connect(db)
    cursor = connection.cursor()
    sql = f"""
    SELECT COUNT({COL_USER_ID}) FROM {TABLE_NAME}
      """
    cursor.execute(sql)
    response=cursor.fetchone()
    connection.commit()
    connection.close()
    if response != None:
        return response[0]
    else:
        return None

def test_Users():
    db=config.DB_TEST_Trailfunds
    drop_user_table(db)
    create_user_table(db)
    id1=insert_User({'First_Name':'Nathan','Last_Name':'Daniel','Middle_Initial':'R', 'Address':'250 Mesa Ave', 'State':'CO', 'ZipCode':81501, 'FavoriteTrail':1, 'Username':'NDaniel01', 'Password':'1345$WootWoot', 'Email':'Nate@thedanielfamily.com'},db)
    id2=insert_User({'First_Name':'John','Last_Name':'Doe','Middle_Initial':'F', 'Address':'123 Alphabet Street', 'State':'WA', 'ZipCode':12345, 'FavoriteTrail':2, 'Username':'JohnDoe02', 'Password':'FooBar', 'Email':'Foo@Bar.com'},db)
    row1 = select_user_by_id(id1,db)
    row2 = select_user_by_id(id2,db)
    if row1['User_ID'] != id1:
        raise ValueError('id1: Id wrong:' + str(row1['ID']))
    if row1['First_Name'] != 'Nathan':
        raise ValueError('id1 First Name wrong.')
    if row2['Address'] != '123 Alphabet Street':
        raise ValueError('id2 Address wrong.')
    if row2['Username'] != 'JohnDoe02':
        raise ValueError('id2 Username wrong.')
    print_Users_table()

def print_Users_table():
    print(' ')
    print("-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-")
    print(f"             {TABLE_NAME}                ")
    print("-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-")
    db=config.DB_TEST_Trailfunds
    connection = sqlite3.connect(db)
    cur = connection.cursor()  
    for row in cur.execute(f'SELECT * FROM {TABLE_NAME}'):
        print(row)
    connection.commit()
    connection.close


