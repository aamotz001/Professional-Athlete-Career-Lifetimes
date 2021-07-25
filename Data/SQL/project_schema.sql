
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



