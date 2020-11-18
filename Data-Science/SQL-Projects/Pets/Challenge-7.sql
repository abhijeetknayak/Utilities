CREATE DATABASE pets;
USE pets;

DROP TABLE pet_details;

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

