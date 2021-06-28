-- Just to drop an existing view with the name 'prof'
drop view if exists prof;

-- Create a new view 'prof' which holds the cartesian product (CROSS JOIN) of Candidates and Subjects tables.
CREATE VIEW prof as SELECT Instructor,rohanchaudhari.Candidates.subject as cs, rohanchaudhari.Subs.subject as ss from rohanchaudhari.Candidates CROSS JOIN rohanchaudhari.Subs;

-- Select rows from the view 'prof' where the Candidates.subject data value = Subs.subject value and on grouping similar instructors we output only those instructors that have the mentioned subjects under their names.
SELECT Instructor from prof where cs = ss group by Instructor HAVING count(*) = (SELECT COUNT(*) FROM rohanchaudhari.Subs);


-- EXPLANATION
-- Create a table Subs consisting of all the subjects that are to be checked against.
-- Here, create a view (virtual table) 'prof' which contains the columns Instrutor, Candidates.subject and Subs.subject by CROSS JOINING (Cartesian Product) Candidates and Subs tables.
-- After the view is created which contains the cartesian product of the 2 tables, we compare the values of the 2 columns Candidates.subject and Subs.subject to check which row has the same values for both.
-- On finding such rows we then group all the instructors together where the number of rows per instructor is equal to the number of rows/subjects present in the Subs table. 
-- Only the Instructors satisfying this condition are outputted as the Final Result.
-- Thus, this query would require 2 tables/CSV files.