-- DISTINCT operator
-- problem statement: Find the distinct list of employee ids in the employee_expenses file

-- load the employee expenses
employee_expenses = LOAD '../input/employee_expenses.txt' AS (emp_id:int, expenses:int);

/*
to find the distinct list of employee ids first we need to extract the only list of
employee ids from the tuples
*/
employee_ids = FOREACH employee_expenses GENERATE emp_id;

-- remove duplicates using DISTINCT operator
distinct_emp_ids = DISTINCT employee_ids;


-- store the output in local file system
STORE distinct_emp_ids INTO '../output/task_8' USING PigStorage('\t');

