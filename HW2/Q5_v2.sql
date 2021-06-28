SELECT Instructor from rohanchaudhari.Candidates RIGHT JOIN rohanchaudhari.Subs ON rohanchaudhari.Candidates.Subject = rohanchaudhari.Subs.Subject 
group by Instructor HAVING count(*) = (SELECT count(*) FROM rohanchaudhari.Subs) order by Instructor ASC;



-- EXPLANATION

-- Create a table Subs consisting of all the subjects that are to be checked against.
-- Here the query mentioned above first carries out a right outer join on the candidates (left) and Subs (right) table. Here we get all records from the Subs table (right), and the matching records from the Candidates table (left) i.e. We get a list of instructor where the respective subjects the instructor teaches matches with a subject of the Subs table.
-- Ex:
	-- Instructor   Candidates.Subject   	Subs.Subject
	-- Emscr		Javascript				JavaScript
-- Finally we group the multiple rows with the same instructors into 1 with a condition (HAVING Clause) where we check if the number of rows per instructor is equal to the number of rows/subjects present in the Subs table. Only the Instructors satisfying this condition are outputted as the Final Result.
-- Thus, this query will require 2 tables/CSV files.