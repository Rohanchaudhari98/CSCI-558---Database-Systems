-- To delete the required rows
DELETE FROM rohanchaudhari.Junkmail where SameFam IS NULL and ID IN 
(SELECT Fam from (SELECT SameFam AS Fam from rohanchaudhari.Junkmail) as deleted);


-- Once the rows are deleted we must also update the SameFam column of the other members who have the ID's of the deleted rows as a non NULL value in the SameFam column and set them to NULL as they no longer belong to the database.
UPDATE rohanchaudhari.Junkmail SET SameFam = NULL WHERE SameFam IS NOT NULL;


-- This is to just show the final result after deletion and updation
SELECT * from rohanchaudhari.Junkmail;

-- EXPLANATION
-- We first delete all the rows that have SameFam value as NULL and whose ID's are present in the SameFam column of other rows.
-- We do so by first finding all ID's where SameFam is NULL and check if the ID's of such rows are present in the SameFam column.
-- If they are present we delete those rows with the particular ID's.
-- After the members are deleted from the database we run the 2nd query where we must also update the SameFam column of the other family members to NULL to show how they no longer have the deleted members present. 
-- The 3rd query is just to show all the rows of the table after deletion and updation to show the changes.