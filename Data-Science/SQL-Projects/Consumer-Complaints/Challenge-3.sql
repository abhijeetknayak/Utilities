CREATE DATABASE consumer_complaints;
USE consumer_complaints;
SHOW VARIABLES LIKE "secure_file_priv";

DROP TABLE complaints;

CREATE TABLE complaints(
	date_received varchar(10),
    product_name varchar(500),
    sub_product varchar(500),
    issue varchar(500),
    sub_issue varchar(500),
    consumer_complaint_narrative varchar(5000),
    company_public_response varchar(500),
    company varchar(500),
    state_name varchar(2),
    zip_code varchar(10),
    tags varchar(40),
    consumer_consent_provided varchar(30),
    submitted_via varchar(20),
    date_sent varchar(10),
    company_response_to_consumer varchar(2000),
    timely_response varchar(3),
    consumer_disputed varchar(3),
    complaint_id varchar(10) PRIMARY KEY
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-ConsumerComplaints.csv'
INTO TABLE complaints
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

## TASK 1 : How many complaints were received and sent on the same day
SELECT COUNT(*) FROM complaints
WHERE complaints.date_received = complaints.date_sent;

## TASK 2 : Extract the complaints received in the state of New York
SELECT * FROM complaints
WHERE complaints.state_name = 'NY'
LIMIT 5;

## TASK 3 : Extract the complaints received in the states of NY and California
SELECT * FROM complaints
WHERE complaints.state_name = 'NY' OR complaints.state_name = 'CA'
LIMIT 10;

## TASK 4 : Extract all rows with the word 'Credit' in the product field
SELECT * FROM complaints
WHERE complaints.product_name LIKE '%Credit%'
LIMIT 10;

