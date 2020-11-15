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