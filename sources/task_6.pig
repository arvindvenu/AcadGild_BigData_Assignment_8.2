-- LIMIT operator
-- problem statement: find the first employee in the list of employees
-- load the employee details
employee_details = LOAD '../input/employee_details.txt' USING PigStorage(',') AS (id:int, fname:chararray, lname:chararray, sal:int, rating:int);

-- use limit operator to find the first employee in the list
first_employee = LIMIT employee_details 1;

-- store the output in local file system
STORE first_employee INTO '../output/task_6' USING PigStorage(',');

