-- This table will contain NHL starting data
CREATE TABLE NHL_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain NHL retiring data
CREATE TABLE NHL_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT
);


-- This table will contain NFL starting data
CREATE TABLE NFL_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain NFL retiring data
CREATE TABLE NFL_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT
);


-- This table will contain MLB starting data
CREATE TABLE mlb_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain MLB retiring data
CREATE TABLE mlb_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT
);

-- This table will contain NBA starting data
CREATE TABLE nba_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain NBA retiring data
CREATE TABLE nba_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT
);

-- This table will contain all starting data
CREATE TABLE all_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain all retiring data
CREATE TABLE all_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT
);


-- This table will contain all sports data after running the code to join the starting and retiring tables
CREATE TABLE all_data (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT,
  retire_year INT,
  retire_age INT
);



--If the below code does not correctly import the clean data, 
--Please input the direct location of each file on your local machine between the single quotations next to the FROM command. 

COPY NHL_starting(playerid, sport, position, start_year, start_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_start_nhl.csv'
DELIMITER ','
CSV HEADER;

COPY NHL_retiring(playerid, sport, position, retire_year, retire_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_retire_nhl.csv'
DELIMITER ','
CSV HEADER;

COPY nfl_starting(playerid, sport, position, start_year, start_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_ start_nfl.csv'
DELIMITER ','
CSV HEADER;

COPY nfl_retiring(playerid, sport, position, retire_year, retire_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_ retire_nfl.csv'
DELIMITER ','
CSV HEADER;

COPY mlb_starting(playerid, sport, position, start_year, start_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_start_mlb.csv'
DELIMITER ','
CSV HEADER;

COPY mlb_retiring(playerid, sport, position, retire_year, retire_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_retire_mlb.csv'
DELIMITER ','
CSV HEADER;

COPY nba_starting(playerid, sport, position, start_year, start_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_start_nba.csv'
DELIMITER ','
CSV HEADER;

COPY nba_retiring(playerid, sport, position, retire_year, retire_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_retire_nba.csv'
DELIMITER ','
CSV HEADER;


--This deletes players from the NBA table that happen to have the same playerID as players in other sports. Deleting this few records should not impact our analysis.
DELETE FROM nba_starting WHERE playerid = 'Mike Harris';
DELETE FROM nba_retiring WHERE playerid = 'Mike Harris';
DELETE FROM nba_starting WHERE playerid = 'Jason Williams';
DELETE FROM nba_retiring WHERE playerid = 'Jason Williams';
DELETE FROM nba_starting WHERE playerid = 'Travis Williams';
DELETE FROM nba_retiring WHERE playerid = 'Travis Williams';
DELETE FROM nba_starting WHERE playerid = 'Reggie Williams';
DELETE FROM nba_retiring WHERE playerid = 'Reggie Williams';
DELETE FROM nba_starting WHERE playerid = 'Derrick Williams';
DELETE FROM nba_retiring WHERE playerid = 'Derrick Williams';
DELETE FROM nba_starting WHERE playerid = 'Brandon Williams';
DELETE FROM nba_retiring WHERE playerid = 'Brandon Williams';
DELETE FROM nba_starting WHERE playerid = 'Mike Williams';
DELETE FROM nba_retiring WHERE playerid = 'Mike Williams';



--This code will join all of the starting data and retiring data into the all_starting and all_retiring tables respectively

INSERT INTO all_starting
 SELECT * FROM nhl_starting
 UNION
 SELECT * FROM nfl_starting  
 UNION
 SELECT * FROM mlb_starting
 UNION
 SELECT * FROM nba_starting;

INSERT INTO all_retiring
 SELECT * FROM nhl_retiring
 UNION
 SELECT * FROM nfl_retiring  
 UNION
 SELECT * FROM mlb_retiring 
 UNION
 SELECT * FROM nba_retiring;


--This code will join the all_starting and all_retiring tables into one table, all_data, which will be exported for the NNM
INSERT INTO all_data
SELECT all_starting.playerID, all_starting.sport, all_starting.position, all_starting.start_year, all_starting.start_age, all_starting.years_played, all_retiring.retire_year, all_retiring.retire_age
FROM all_starting
LEFT JOIN all_retiring
ON (all_starting.playerID = all_retiring.playerID);


--This code will be used to export the all_data table for running the NNM.
--If the below code does not correctly export the data, 
--Please input the direct location of each file on your local machine between the single quotations next to the FROM command. 

COPY all_data
TO '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\all_data.csv'
DELIMITER ','
CSV HEADER;

