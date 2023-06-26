import mysql.connector
from mysql.connector import errorcode
connection = mysql.connector.connect(user='root', password='h:DcY67Nf?', host='localhost', database='lgbt_survey_db')
cursor = connection.cursor()
query = ("SELECT maintable.row_id, country.CountryCode, subset.subset, questioncode.question_code, questioncode.question_label, maintable.answer, maintable.percentage FROM maintable, country, questioncode, subset")
try:
    cursor.execute(query)
    #change the password of database because this is going to be public (create new user?)https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
       print("Database does not exist")
    else:
        print(err)

import pandas as pd
import numpy as np
"""
import matplotlib as plt
#import seaborn as sns
plt.style.use('ggplot')
pd.set_option('display.max_colwidth', None) #Dispaly full questions
pd.set_option('max_columns', 200)
"""
query.shape
