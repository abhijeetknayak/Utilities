## Find all employees
SELECT * FROM employee;

## Find all clients
SELECT * FROM client_table;

## Find all employees ordered by Salaries
SELECT * FROM employee
ORDER BY employee.salary;

## Find all employees ordered by Sex and then name
SELECT * FROM employee
ORDER BY employee.sex, employee.first_name, employee.last_name;

## First 5 employees in the table
SELECT * FROM employee
LIMIT 5;

## Find the first and last names of all employees
SELECT first_name, last_name FROM employee;

## Find the forename and surnames of all employees
SELECT first_name AS forename, last_name AS surname
FROM employee;

## Find out all the different genders
SELECT DISTINCT sex FROM employee;

## Find the number of employees
SELECT COUNT(*) FROM employee;

## Count of employees who have supervisors
SELECT COUNT(super_id) FROM employee;

## Count of all female employees born after 1970
SELECT COUNT(*) FROM employee
WHERE sex = 'F' AND birth_date > '1970-01-01';

## Find average of all employee salaries
SELECT AVG(salary) FROM employee;

## Find the sum of all employee salaries
SELECT SUM(salary) FROM employee;

## Find out how many male and female employees there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

## Find total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

## How much money was spent by each client
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

## WILDCARDS - Similar to Regular Expressions python
## Suppliers that have 'label' in their names
SELECT * FROM branch_supplier
WHERE supplier_name LIKE ('%label%');

## Employees born in July?
SELECT * FROM employee
WHERE birth_date LIKE '____-07-__';

## Clients who are schools
SELECT * FROM client_table
WHERE client_name LIKE '%school%';