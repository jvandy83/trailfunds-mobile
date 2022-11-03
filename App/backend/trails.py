import sqlite3
import config
import generic

TABLE_NAME="Trails"

COL_Trial_ID='Trail_ID'
COL_TRAIL_NAME='Trail_Name'
COL_LATITUDE='Latitude'
COL_LONGITUDE='Longitude'
COL_MAINTAINER_ID = 'Maintainer_ID'

## THINGS THAT WE CAN ADD
# DESCRIPTION


def drop_trail_table(db = config.DB_TEST_Trailfunds):
    generic.drop_table(TABLE_NAME,db)

def create_trail_table(db = config.DB_TEST_Trailfunds):
    print("create_Trail_table()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = f"""
    create table if not exists {TABLE_NAME} (
        {COL_Trial_ID} integer primary key,
        {COL_TRAIL_NAME} text not null,
        {COL_LATITUDE} double not null,
        {COL_LONGITUDE} double not null,
        {COL_MAINTAINER_ID} integer not null
    )
    """
    cur.execute(sql)
    connection.commit()
    connection.close()

def insert_Trail(values,db=config.DB_TEST_Trailfunds):
    print("insert_Trails()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
        insert into Trails (Trail_Name,Latitude,Longitude,Maintainer_ID)
        values ( :Trail_Name, :Latitude,  :Longitude, :Maintainer_ID)
    """
    params = {'Trail_Name': values['Trail_Name'],
              'Latitude': values['Latitude'],
              'Longitude': values['Longitude'],
              'Maintainer_ID': values['Maintainer_ID']}
    cur.execute(sql,params)
    connection.commit()
    connection.close()
    return cur.lastrowid

def select_trail_by_id(id,db=config.DB_TEST_Trailfunds):
    print("select_Trail_by_id()")
    connection = sqlite3.connect(db)
    cur = connection.cursor()
    sql = """
      select Trail_Name,Latitude,Longitude,Maintainer_ID from Trails
      where (Trail_ID = :Trail_ID)
      """
    params = {'Trail_ID':id}
    cur.execute(sql,params)
    response=cur.fetchone()
    for row in cur.execute(sql, params):
        print(row)
    if response != None:
        return {
            'Trail_ID' :id,
            'Trail_Name': response[0],
            'Latitude': response[1],
            'Longitude': response[2],
            'Maintainer_ID':response[3]
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

def test_Trails():
    db=config.DB_TEST_Trailfunds
    drop_trail_table(db)
    create_trail_table(db)
    id1=insert_Trail({'Trail_Name':'Trail_1','Latitude':8675.309,'Longitude':8160.918,'Maintainer_ID':120395},db)
    id2=insert_Trail({'Trail_Name':'Trail_2','Latitude':1579.509,'Longitude':8630.037,'Maintainer_ID':102749},db)
    row1 = select_trail_by_id(id1,db)
    row2 = select_trail_by_id(id2,db)
    if row1['Trail_ID'] != id1:
        raise ValueError('id1: Id wrong:' + str(row1['ID']))
    if row1['Trail_Name'] != 'Trail_1':
        raise ValueError('id1 Trail_Name wrong.')
    if row2['Latitude'] != 1579.509:
        raise ValueError('id2 Latitude wrong.')
    if row2['Longitude'] != 8630.037:
        raise ValueError('id2 Longitude wrong.')
   # print_Trail_table()

def print_Trail_table():
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
   # connection.close

