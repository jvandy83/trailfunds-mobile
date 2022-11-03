import sqlite3
import config
import generic

TABLE_NAME="Maintainer"

COL_MAINTAINER_ID='Maintainer_ID'
COL_Maintainer_Name='Maintainer_Name'
COL_ADDRESS='Address'
COL_STATE = 'State'
COL_ZipCode = 'ZipCode'
COL_Username = 'Username'
COL_Password = 'Password'
COL_Email = 'Email'
COL_SignUpDate = 'SignUpDate'


def drop_Maintainer_table(db = config.DB_TEST_Trailfunds):
    generic.drop_table(TABLE_NAME,db)

def create_Maintainer_table(db = config.DB_TEST_Trailfunds):
    print("create_User_table()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = f"""
    create table if not exists {TABLE_NAME} (
        {COL_MAINTAINER_ID} integer primary key,
        {COL_Maintainer_Name} text not null,
        {COL_ADDRESS} text not null,
        {COL_STATE} text not null,
        {COL_ZipCode} integer not null,
        {COL_Username} text not null,
        {COL_Password} text not null,
        {COL_Email} text not null
    )
    """
    cur.execute(sql)
    connection.commit()
    connection.close()

def insert_Maintainer(values,db=config.DB_TEST_Trailfunds):
    print("insert_Maintainers()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
        insert into Maintainer (Maintainer_Name,Address,State,ZipCode,Username,Password,Email)
        values ( :Maintainer_Name,:Address, :State, :ZipCode, :Username, :Password, :Email)
    """
    params = {'Maintainer_Name': values['Maintainer_Name'],
              'Address': values['Address'],
              'State': values['State'],
              'ZipCode': values['ZipCode'],
              'Username': values['Username'],
              'Password': values['Password'],
              'Email': values['Email']}
    cur.execute(sql,params)
    connection.commit()
    connection.close()
    return cur.lastrowid

def select_Maintainer_by_id(id,db=config.DB_TEST_Trailfunds):
    print("select_Maintainer_by_id()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
      select Maintainer_Name,Address,State,ZipCode,Username,Password,Email from Maintainer
      where (Maintainer_ID = :Maintainer_ID)
      """
    params = {'Maintainer_ID':id}
    cur.execute(sql,params)
    response=cur.fetchone()
    for row in cur.execute(sql, params):
        print(row)
    if response != None:
        return {
            'Maintainer_ID' :id,
            'Maintainer_Name': response[0],
            'Address':response[1],
            'State': response[2],
            'ZipCode':response[3],
            'Username': response[4],
            'Password': response[5],
            'Email': response[6],

        }
    else:
        return None
        
def fetch_row_length(db):
    connection = sqlite3.connect(db)
    cursor = connection.cursor()
    sql = f"""
    SELECT COUNT({COL_MAINTAINER_ID}) FROM {TABLE_NAME}
      """
    cursor.execute(sql)
    response=cursor.fetchone()
    connection.commit()
    connection.close()
    if response != None:
        return response[0]
    else:
        return None


def test_Maintainers():
    db=config.DB_TEST_Trailfunds
    drop_Maintainer_table(db)
    create_Maintainer_table(db)
    id1=insert_Maintainer({'Maintainer_Name':'Maintaner_1', 'Address':'250 Mesa Ave', 'State':'CO', 'ZipCode':81501,'Username':'NDaniel01', 'Password':'1345$WootWoot', 'Email':'Nate@thedanielfamily.com'},db)
    id2=insert_Maintainer({'Maintainer_Name':'Maintaner_2', 'Address':'123 Alphabet Street', 'State':'WA', 'ZipCode':12345,'Username':'JohnDoe02', 'Password':'FooBar', 'Email':'Foo@Bar.com'},db)
    row1 = select_Maintainer_by_id(id1,db)
    row2 = select_Maintainer_by_id(id2,db)
    if row1['Maintainer_ID'] != id1:
        raise ValueError('id1: Id wrong:' + str(row1['ID']))
    if row1['Maintainer_Name'] != 'Maintaner_1':
        raise ValueError('id1 First Name wrong.')
    if row2['Address'] != '123 Alphabet Street':
        raise ValueError('id2 Address wrong.')
    if row2['Username'] != 'JohnDoe02':
        raise ValueError('id2 Username wrong.')
    # print_Maintainers_table()

def print_Maintainers_table():
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
    #connection.close


