CREATE DATABASE games;
USE games;

SET sql_mode = '';
#SET sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';  #Reset sql mode back to prevent truncation

DROP TABLE console_games;
DROP TABLE console_dates;

CREATE TABLE console_games (
    game_rank integer PRIMARY KEY,
    game_name varchar(1200),
    platform_name varchar(1200),
    game_year integer NULL,
    genre varchar(200),
    publisher varchar(1200),
    na_sales double NULL,
    eu_sales double NULL,
    jp_sales double NULL,
    other_sales double NULL
);

CREATE TABLE console_dates (
    platform_name varchar(120),
    first_retail_availability date,
    discontinued date,
    units_sold_mill double NULL,
    platform_comment varchar(120)    
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-ConsoleGames.csv'
INTO TABLE console_games
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/P9-ConsoleDates.csv'
INTO TABLE console_dates
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM console_games
LIMIT 5;

SELECT * FROM console_dates;

## Data loading into Database complete!

## TASK 1 : What percent of global sales were made in North America
ALTER TABLE console_games
ADD COLUMN global_sales double NULL;

UPDATE console_games
SET global_sales = na_sales + eu_sales + jp_sales + other_sales;

SELECT SUM(na_sales) * 100.0 / sum(global_sales) as NA_Sales_Percentage FROM console_games;

## TASK 2 : Extract a view of the console game titles ordered by platform name in ascending order 
## and year of release in decending order
CREATE VIEW game_titles AS
SELECT game_name FROM console_games
ORDER BY platform_name ASC, game_year DESC;

SELECT * FROM game_titles;

## TASK 3 : Extract the first four characters of game_titles
SELECT SUBSTRING(game_name, 1, 4) AS SUB_STRING FROM console_games;






