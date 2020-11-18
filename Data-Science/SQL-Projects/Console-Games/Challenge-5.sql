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



