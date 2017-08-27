-- MAX function
-- problem statement: find the employee with max salary
-- load the employee details
employee_details = LOAD '../input/employee_details.txt' USING PigStorage(',') AS (id:int, fname:chararray, lname:chararray, sal:int, rating:int);

-- grouping all tuples into one tuple. It will be easier to find the max
employee_details_grp_all = GROUP employee_details ALL;

/*
apply the max function on the group(which actually contains
all the rows) to find the max salary
*/
employee_details_max_sal = FOREACH employee_details_grp_all GENERATE MAX(employee_details.sal) as max_sal;

/*
to find which employee has the highest salary self join employee_details_max_sal with
the employee_details based on the sal fields and max_sal fields
*/
emp_with_max_sal = JOIN employee_details BY sal, employee_details_max_sal BY max_sal;


-- store the output in local file system
STORE emp_with_max_sal INTO '../output/task_5' USING PigStorage(',');

