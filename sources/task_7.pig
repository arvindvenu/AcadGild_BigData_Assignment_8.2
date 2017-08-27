-- STORE operator
-- problem statement: Read the employees file as comma separated file
-- and store it as tab separated file
-- load the employee details
employee_details = LOAD '../input/employee_details.txt' USING PigStorage(',') AS (id:int, fname:chararray, lname:chararray, sal:int, rating:int);

-- store the output in local file system as tab separated in the path specified
STORE employee_details INTO '../output/task_7' USING PigStorage('\t');

