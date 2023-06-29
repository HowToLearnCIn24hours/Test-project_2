ALTER TABLE maintable
DROP FOREIGN KEY question_label_fk;

DROP table questionlabel;

ALTER table questioncode 
ADD question_label TEXT;

ALTER TABLE maintable
DROP question_label;

DELETE from maintable;



