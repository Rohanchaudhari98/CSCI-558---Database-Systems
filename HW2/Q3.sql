SELECT PID from rohanchaudhari.Projects where Step = 0 and Status = 'C' and PID IN 
(SELECT PID from rohanchaudhari.Projects where Step = 1 and Status = 'W');


-- EXPLANATION
-- The query above checks and outputs the Projects where only step 0 has been completed.
-- In the above query we first find all the pid's where step = 0 and status = C. 
-- Then we run an inner query where we filter out the pid's where step = 1 and status = W.
-- We do so only for step = 1 as the question mentiones that only once a step is completed can we move to the next step and thus we cannot have C,W,C,W.
-- Once we get the rows of the inner query we compare the pid's of both the inner and outer query using IN and return those PID's that match.