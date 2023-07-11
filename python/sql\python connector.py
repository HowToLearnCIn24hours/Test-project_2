import mysql.connector
from mysql.connector import errorcode
connection = mysql.connector.connect(user='root', password='password', host='localhost', database='lgbt_survey_db')
cursor = connection.cursor()
query = """
SELECT maintable.row_id, 
country.CountryCode, 
subset.subset, 
questioncode.question_code, 
questioncode.question_label, 
maintable.answer, 
maintable.percentage 
FROM maintable, country, questioncode, subset
"""
cursor.execute(query)
results = []
for i, data in enumerate(cursor):
    results.append(data)

cursor.close()
connection.close()

df.pulled = pd.DataFrame(results)
