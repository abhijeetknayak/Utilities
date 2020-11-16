## NESTED Queries

## Find names of all employees who have sold more than 30000 to a
## single client

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id FROM works_with
    WHERE works_with.total_sales > 30000
);


## Find all clients who are handled by Michael Scott's branch
## Assume Michael Scott's emp_id is known
SELECT client_table.client_name FROM client_table
WHERE client_table.branch_id = (
    SELECT branch.branch_id FROM branch
    WHERE branch.mgr_id = 102
);

CREATE TABLE trigger_list(
    comm_name varchar(40)
);

CREATE 
    TRIGGER t1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_list VALUES("Added Male Employee");
        ELSEIF NEW.sex= 'F' THEN
            INSERT INTO trigger_list VALUES("Added Female Employee");
        ELSE
            INSERT INTO trigger_list VALUES("Added other employee");
        END IF;
    END$$
DELIMITER ;

INSERT INTO employee VALUES(111, "New", "Female", '1995-06-07', 'F', 78000, NULL, NULL);
select * from trigger_list;

DROP TRIGGER t1;