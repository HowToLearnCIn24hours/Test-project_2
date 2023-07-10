
Create database LGBT_survey_DB;

CREATE TABLE IF NOT EXISTS LGBT_survey_DB.Country (
  idCountry INT NOT NULL PRIMARY KEY,
  CountryCode VARCHAR(100) NOT NULL
  );

CREATE TABLE IF NOT EXISTS LGBT_survey_DB.Subset (
  idLGBT INT NOT NULL PRIMARY KEY,
  subset VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS LGBT_survey_DB.QuestionCode (
  idQuestionCode INT NOT NULL PRIMARY KEY,
  question_code VARCHAR(20) NOT NULL,
  question_label TEXT NOT NULL
  );

CREATE TABLE IF NOT EXISTS LGBT_survey_DB.MainTable (
  row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CountryCode INT NOT NULL,
  subset INT NOT NULL,
  question_code INT NOT NULL,
  answer VARCHAR(255) NOT NULL,
  percentage INT NOT NULL,
  CONSTRAINT country_code_fk
    FOREIGN KEY (CountryCode)
    REFERENCES LGBT_survey_DB.Country (idCountry)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT subset_fk
    FOREIGN KEY (subset)
    REFERENCES LGBT_survey_DB.Subset (idLGBT)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT question_code_fk
    FOREIGN KEY (question_code)
    REFERENCES LGBT_survey_DB.QuestionCode (idQuestionCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  );

Create view temp_table AS (  
SELECT c.CountryCode, s.subset, qc.question_code, qc.question_label, m.answer, m.percentage
FROM maintable m 
LEFT JOIN Country c ON m.CountryCode = c.idCountry
LEFT JOIN Subset s ON m.subset = s.idLGBT
LEFT JOIN QuestionCode qc ON m.question_code = qc.idQuestionCode
);


SELECT c.CountryCode, s.subset, qc.question_code, qc.question_label, m.answer, m.percentage
FROM maintable m 
LEFT JOIN Country c ON m.CountryCode = c.idCountry
LEFT JOIN Subset s ON m.subset = s.idLGBT
LEFT JOIN QuestionCode qc ON m.question_code = qc.idQuestionCode 
WHERE qc.question_code LIKE '%c2%' 
Order by  m.percentage DESC;


