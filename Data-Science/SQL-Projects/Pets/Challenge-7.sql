CREATE DATABASE pets;
USE pets;

DROP TABLE pet_details;
DROP TABLE procedure_history;

CREATE TABLE pet_details(
	PetID VARCHAR(7) PRIMARY KEY,
    pet_name VARCHAR(15),
    Kind VARCHAR(10),
    gender VARCHAR(7),
    age INT,
    OwnerID INT,
    FOREIGN KEY(OwnerID) REFERENCES owner_details(OwnerID) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-Pets.csv'
INTO TABLE pet_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE owner_details(
	OwnerID INT PRIMARY KEY,
    owner_name VARCHAR(20),
    owner_surname VARCHAR(20),
    street_address VARCHAR(40),
    city VARCHAR(30),
    state VARCHAR(2),
    state_full VARCHAR(15),
    zipcode VARCHAR(5)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-Owners.csv'
INTO TABLE owner_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM owner_details
LIMIT 5;

SELECT * FROM pet_details
LIMIT 5;

CREATE TABLE procedure_details(
	ProcedureType VARCHAR(20),
    ProcedureSubCode INT,
    procedure_desc VARCHAR(25),
    price INT,
    PRIMARY KEY(ProcedureType, ProcedureSubCode)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-ProceduresDetails.csv'
INTO TABLE procedure_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM procedure_details
LIMIT 5;

CREATE TABLE procedure_history(
    pet_id VARCHAR(7),
    procedure_date DATE,
    ProcedureType VARCHAR(20),
    ProcedureSubCode INT,
    PRIMARY KEY(pet_id, procedure_date, ProcedureType, ProcedureSubCode)
    #FOREIGN KEY(pet_id) REFERENCES pet_details(PetID) ON DELETE CASCADE,
    #FOREIGN KEY(ProcedureType, ProcedureSubCode) REFERENCES procedure_details(ProcedureType, ProcedureSubCode) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-ProceduresHistory.csv'
INTO TABLE procedure_history
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


## TASK 1 : Extract information about pets and their owners side by side
SELECT pet_details.pet_name, owner_details.owner_name, owner_details.owner_surname FROM owner_details
JOIN pet_details ON (pet_details.ownerID = owner_details.ownerID)
LIMIT 20;

## TASK 2 : Find out which pets from this clinic had procedures performed
SELECT pet_details.PetID, pet_details.pet_name, pet_details.Kind FROM procedure_history
LEFT JOIN pet_details ON (pet_details.PetID = procedure_history.pet_id)
WHERE PetID IS NOT NULL;

## TASK 3 : Match up all procedures performed to their descriptions
SELECT procedure_history.pet_id, procedure_history.ProcedureType, procedure_history.ProcedureSubCode,
procedure_details.procedure_desc, procedure_details.price FROM procedure_history
JOIN procedure_details ON (procedure_history.ProcedureType = procedure_details.ProcedureType
 AND procedure_history.ProcedureSubCode = procedure_details.ProcedureSubCode)
LIMIT 20;

## TASK 4 : Same as above, but only on pets from the clinic in question
