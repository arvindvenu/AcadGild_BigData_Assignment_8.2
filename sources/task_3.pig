-- SUM function
-- problem statement: calculate total expenses for each employee
-- load the employee expense details
emp_expenses = LOAD '../input/employee_expenses.txt' AS (emp_id:int, expenses:int);

/*
for a single employee there are going to be multiple rows.
so first group the expenses by employee id
group operation will genarete an inner bag of expenses per 
unique employee id
*/
emp_expenses_grouped = GROUP emp_expenses by emp_id;

/*
The group operation above creates a relation whose tuples will have a field called
group(the value of which will be the value of the field on which grouping is done.
in this case the emp_id) and an inner bag named emp_expenses (which will have all 
tuples from the original relation which belong to this group).

so summing up the expenses fields of all the tuples in the inner bag to find out the 
total expenses for this employee
*/
emp_expenses_summed = FOREACH emp_expenses_grouped GENERATE group AS emp_id, SUM(emp_expenses.expenses) AS total_expenses;

-- store the output in local file system
STORE emp_expenses_summed INTO '../output/task_3' USING PigStorage(',');

