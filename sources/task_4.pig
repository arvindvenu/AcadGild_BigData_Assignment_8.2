-- MIN function
-- problem statement: find the employee with minimum salary
-- load the employee details
employee_details = LOAD '../input/employee_details.txt' USING PigStorage(',') AS (id:int, fname:chararray, lname:chararray, sal:int, rating:int);

-- grouping all tuples into one tuple. It will be easier to find the min
employee_details_grp_all = GROUP employee_details ALL;

/*
apply the min function on the group(which actually contains
all the rows) to find the minimum salary
*/
employee_details_min_sal = FOREACH employee_details_grp_all GENERATE MIN(employee_details.sal) as min_sal;

/*
to find which employee has the lowest salary self join employee_details_min_sal with
the employee_details based on the sal fields and min_sal fields
*/
emp_with_min_sal = JOIN employee_details BY sal, employee_details_min_sal BY min_sal;


-- store the output in local file system
STORE emp_with_min_sal INTO '../output/task_4' USING PigStorage(',');

