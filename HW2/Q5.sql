SELECT Instructor from rohanchaudhari.Candidates where Subject IN 
(SELECT Subject from rohanchaudhari.subs) group by Instructor HAVING count(*) = (SELECT COUNT(*) FROM rohanchaudhari.subs);



-- EXAPLANATION
-- Create a table Subs consisting of all the subjects that are to be checked against.
-- Here we take every instructor and the subject the instructor teaches and compare it to the set of subjects in the Subs table which are a requirement using the IN operator.
-- Next we group the same instructor together with a condition (HAVING Clause) where we check if the number of rows per instructor is equal to the number of rows/subjects present in the Subs table. Only the Instructors satisfying this condition are outputted as the Final Result.
-- Finally we output only those instructors that obey the condition in the HAVING Clause.
-- Here this is an implementation of division (relational algebra operation) in MySQL.
-- Thus, this query would require 2 tables/CSV files.