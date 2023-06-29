import mysql.connector
from mysql.connector import errorcode
connection = mysql.connector.connect(user='root', password='password', host='localhost', database='lgbt_survey_db')
cursor = connection.cursor()
query = ("SELECT maintable.row_id, country.CountryCode, subset.subset, questioncode.question_code, questioncode.question_label, maintable.answer, maintable.percentage FROM maintable, country, questioncode, subset")
try:
    cursor.execute(query)
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
       print("Database does not exist")
    else:
        print(err)

import numpy as np

query.shape
