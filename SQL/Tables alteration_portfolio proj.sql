#Tables alternation
ALTER TABLE maintable
DROP FOREIGN KEY question_label_fk;

DROP table questionlabel;

ALTER table questioncode 
ADD question_label TEXT;

ALTER TABLE maintable
DROP question_label;

DELETE from maintable;

#univariate analysis - description analysis type
#mean value
#median value
#min value
SELECT MIN(column_name)
FROM table_name
WHERE condition;
#max value
SELECT country.CountryCode, questioncode.question_code, questioncode.question_label, maintable.answer, MAX(maintable.percentage) AS max_percentage
FROM maintable, country, questioncode
WHERE questioncode.question_code = 'fb1_3' AND maintable.answer = 'Very widespread'
GROUP BY country.CountryCode, questioncode.question_code, questioncode.question_label, maintable.answer;


