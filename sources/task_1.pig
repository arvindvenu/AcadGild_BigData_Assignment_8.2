-- CONCAT function
-- problem statement: find the full name of all employees
-- load the employee details
employee_details = LOAD '../input/employee_details.txt' USING PigStorage(',') AS (id:int, fname:chararray, lname:chararray, sal:int, rating:int);

-- for each employee generate first name, last name and full name.
-- full name is geberated by concatenating first name followed by space and last name
emp_fname_lname_concat = FOREACH employee_details GENERATE fname, lname, CONCAT (fname,' ',lname) AS full_name;

-- store the output in local file system
STORE emp_fname_lname_concat INTO '../output/task_1' USING PigStorage(',');

