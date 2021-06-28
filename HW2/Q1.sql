CREATE TABLE Room
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
CONSTRAINT CHK_Time CHECK (startTime<endTime));


drop trigger if exists check_availability;

-- Trigger to check for conflicts
DELIMITER |
Create trigger check_availability
BEFORE INSERT on Room
FOR EACH ROW
BEGIN
DECLARE n INT;
DECLARE n1 INT;
select count(*) into n from Room where roomNum=new.roomNum and NOT (new.startTime>=endTime or new.endTime<=startTime);
select count(*) into n1 from Room where groupName = new.groupName and NOT (new.startTime>=endTime or new.endTime<=startTime);
IF n>0 then SIGNAL SQLSTATE
'45000' SET MESSAGE_TEXT = 'SORRY, ROOM OCCUPIED - INVALID ENTRY'; END if; 
IF n1>0 then SIGNAL SQLSTATE
'45000' SET MESSAGE_TEXT = 'SORRY, GROUP ALREADY ASSIGNED A ROOM DURING THIS TIMESLOT - INVALID ENTRY'; END if; 
END; 
| 
DELIMITER |


-- EXPLANATION
-- For the first fix where we must check that for any new entry into the database the startTime must be smaller in value than the endTime.
-- To check this as seen above we use the CHECK constraint function of MySQL (CONSTRAINT CHK_Time CHECK (startTime<endTime)) to do so. With the help of this constraint we can make sure that any entry that violates the startTime < endTime constraint will not be inserted into the table.
-- Now for the second fix, where we must check before assigning a room to a group that the room is not already assigned to another group whose startTime and endTime clashes with the new entry.
-- For this we can make use of a trigger.
-- Trigger definition -
-- Trigger timing : Before
-- Trigger event : Insert
-- Trigger level : row level trigger
-- Trigger action : Check if a conflict occurs and count the number of conflicts. If the count is greater than 0 a conflict is present and thus we have an error handling mechamism using the SIGNAL SQLSTATE '45000'.
-- Here, '45000' signifies "unhandled user-defined exception".
-- We return this error code and also return an error message - "SORRY, ROOM OCCUPIED - INVALID ENTRY". This will also prevent the insertion from taking place.
-- Additionally, Here, I have also considered another scenario where a particular group (say, C) can be assigned to 2 different rooms at the same time. Thus this would create a conflict in time slot for the same group by being assigned to different rooms simultaneously.