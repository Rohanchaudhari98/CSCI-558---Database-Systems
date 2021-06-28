SELECT ClassName,count(*) AS Total from rohanchaudhari.Enrollment
group by ClassName Order by Total DESC,ClassName DESC;

-- EXPLANATION
-- Here, we count the number of student per class using the count(*) function and group by ClassName. 
-- After which as per the requirements we order them in based of descending order of number of students persent in a class.
-- To add a further condition which does not significantly affect our results, we also order the classname in descending order thus obtaining the required result.