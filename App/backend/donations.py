import sqlite3
import config
import generic
import datetime
TABLE_NAME="Donations"

COL_DONATION_ID='Donation_ID'
COL_USER_ID='User_ID'
COL_TRAIL_ID='Trail_ID'
COL_MAINTAINER_ID = 'Maintainer_ID'
COL_AMMOUNT = 'Ammount'
COL_DATE = 'Date'
COL_TIME = 'Time'
COL_DONATION_LOCATION = 'Donation_Location'

def drop_Donations_table(db = config.DB_TEST_Trailfunds):
    generic.drop_table(TABLE_NAME,db)

def create_Donations_table(db = config.DB_TEST_Trailfunds):
    print("create_Donation_table()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = f"""
    create table if not exists {TABLE_NAME} (
        {COL_DONATION_ID} integer primary key,
        {COL_USER_ID} integer not null,
        {COL_TRAIL_ID} integer not null,
        {COL_MAINTAINER_ID} integer text not null,
        {COL_AMMOUNT} double not null,
        {COL_DATE } text,
        {COL_TIME} text
    )
    """
    cur.execute(sql)
    connection.commit()
    connection.close()

def insert_Donations(values,db=config.DB_TEST_Trailfunds):
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
        insert into Donations (User_ID,Trail_ID,Maintainer_ID,Ammount,Date,Time)
        values (:User_ID,:Trail_ID,:Maintainer_ID,:Ammount,:Date,:Time)
    """
    params = {'User_ID': values['User_ID'],
              'Trail_ID': values['Trail_ID'],
              'Maintainer_ID': values['Maintainer_ID'],
              'Ammount': values['Ammount'],
              'Date': values['Date'],
              'Time': values['Time']
              }
    cur.execute(sql,params)
    connection.commit()
    connection.close()
    return cur.lastrowid

def select_Donations_by_id(id,db=config.DB_TEST_Trailfunds):
    print("select_Donations_by_id()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
      select User_ID,Trail_ID,Maintainer_ID,Ammount,Date,Time from Donations
      where (Donation_ID = :Donation_ID)
      """
    params = {'Donation_ID':id}
    cur.execute(sql,params)
    response=cur.fetchone()
    for row in cur.execute(sql, params):
        print(row)
    if response != None:
        return {
            'Donation_ID' :id,
            'User_ID': response[0],
            'Trail_ID':response[1],
            'Maintainer_ID': response[2],
            'Ammount':response[3],
            'Date': response[4],
            'Time': response[5],
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
        
def test_Donations():
    db=config.DB_TEST_Trailfunds
    drop_Donations_table(db)
    create_Donations_table(db)
    id1=insert_Donations({'User_ID':1, 'Trail_ID':2, 'Maintainer_ID':3, 'Ammount':5.00,'Date': '', 'Time': '' },db)
    id2=insert_Donations({'User_ID':2, 'Trail_ID':1, 'Maintainer_ID':3, 'Ammount':1.00,'Date': '', 'Time': ''},db)
    row1 = select_Donations_by_id(id1,db)
    row2 = select_Donations_by_id(id2,db)
    if row1['Donation_ID'] != id1:
        raise ValueError('id1: Id wrong:' + str(row1['ID']))
    if row1['User_ID'] != 1:
        raise ValueError('id1 User wrong.')
    if row2['Trail_ID'] != 1:
        raise ValueError('id2 Trail_ID wrong.')
    if row2['Ammount'] != 1.00:
        raise ValueError('id2 Ammount Wrong.')
    #print_Donations_table()

def print_Donations_table():
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


