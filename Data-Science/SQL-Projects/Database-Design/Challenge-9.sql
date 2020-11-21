## Table suggested 
CREATE TABLE Transactions (
    transactionid varchar(10),
    timestampsec datetime,
    customerid varchar(10),
    firstname varchar(100),
    surname varchar(100),
    shipping_state varchar(100),
    item varchar(100),
    descr varchar(1000),
    retail_price float,
    loyalty_discount float
);

## 100 character for firstname and surname seems like a lot. Let's reduce that to 20 character each.
## Similarly for the shipping state, lets trim it to 25 characters or even lesser.
## For the 'item' column, it seems like we always have 10 character, Lets max this out at 15.
## And for the description, maybe a 100 characters seems to be enough for the items up to now.
## Transaction ID should be the unique value. Set this to PRIMARY KEY

CREATE TABLE Transactions (
    transactionid varchar(10) PRIMARY KEY,
    timestampsec datetime,
    customerid varchar(10),
    firstname varchar(20),
    surname varchar(20),
    shipping_state varchar(25),
    item varchar(15),
    descr varchar(100),
    retail_price float,
    loyalty_discount float
);

## Set sql mode to none to allow floating point data truncation
SET sql_mode = '';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-OLTP.csv'
INTO TABLE Transactions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Transactions
LIMIT 5;

## By making these modifications in the database table, we have been able to save quite a lot of memory.
## In total, we save about 1100 characters worth of space per row, which seems small, but with a large number of rows, can
## be a significant amount of space saving.