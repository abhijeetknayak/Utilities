## UNION operator - Need to have same number of columns
SELECT first_name FROM employee
UNION
SELECT branch_name FROM branch;

## Find a list of all money spent or earned by the company
SELECT salary FROM employee
UNION
SELECT total_sales FROM works_with;

## JOINS
## Inner Join
SELECT branch.mgr_id, employee.first_name, branch.branch_name
FROM branch JOIN employee
ON employee.emp_id = branch.mgr_id;

INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

## LEFT JOIN - Includes all rows from the left table
SELECT branch.mgr_id, employee.first_name, branch.branch_name
FROM branch LEFT JOIN employee
ON employee.emp_id = branch.mgr_id;

## RIGHT JOIN - Includes all rows from the right table
SELECT branch.mgr_id, employee.first_name, branch.branch_name
FROM branch RIGHT JOIN employee
ON employee.emp_id = branch.mgr_id;
