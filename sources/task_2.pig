-- TOKENIZE function
-- problem statement: split all the employee details into separate tokens
-- load the employee details
employees = LOAD '../input/employee_details.txt' AS (employee:chararray);

-- each line corresponds to one employee. So split the various fields using tokenize
-- and delimiter is comma(,)
emp_fields = FOREACH employees GENERATE TOKENIZE(employee,',');

-- store the output in local file system
STORE emp_fields INTO '../output/task_2' USING PigStorage('\t');

