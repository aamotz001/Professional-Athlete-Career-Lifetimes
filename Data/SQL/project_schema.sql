-- This table will contain NHL starting data
CREATE TABLE NHL_starting (
  player VARCHAR PRIMARY KEY,
  position VARCHAR,
  C INT,
  D INT,
  LW INT,
  RW INT,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain NHL retiring data
CREATE TABLE NHL_retiring (
  player VARCHAR PRIMARY KEY,
  position VARCHAR,
  C INT,
  D INT,
  LW INT,
  RW INT,
  retire_year INT,
  retire_age INT,
  years_played INT
);

-- This table will contain all NHL data after running the code to join the starting and retiring tables
CREATE TABLE NHL (
  player VARCHAR PRIMARY KEY,
  position VARCHAR,
  C INT,
  D INT,
  LW INT,
  RW INT,
  start_year INT,
  start_age INT,
  years_played INT,
  retire_year INT,
  retire_age INT
);


--If the below code does not correctly import the clean data, 
--please input the direct location of each file on your local machine between the single quotations next to the FROM command. 

COPY NHL_starting(player, position, C, D, LW, RW, start_year, start_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_start_nhl.csv'
DELIMITER ','
CSV HEADER;

COPY NHL_retiring(player, position, C, D, LW, RW, retire_year, retire_age, years_played)
FROM '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\clean_retire_nhl.csv'
DELIMITER ','
CSV HEADER;



--This code will join the NHL_starting and NHL_retiring tables together into the NHL table, which wil lbe used in our Neural Network Model
INSERT INTO NHL
SELECT NHL_starting.player, NHL_starting.position, NHL_starting.C, NHL_starting.D, NHL_starting.LW, NHL_starting.RW, NHL_starting.start_year, NHL_starting.start_age, NHL_starting.years_played, NHL_retiring.retire_year, NHL_retiring.retire_age
FROM NHL_starting
LEFT JOIN NHL_retiring
ON (NHL_starting.player = NHL_retiring.player)



--This code will be used to export the NHL table for running the neural network model.
-- If this code does not correctly export the data, please input the direct location of the Clean_Data folder on your local machine
-- between the single quotations next to the TO command.
COPY NHL
TO '.\Professional-Athlete-Career-Lifetimes\Data\Clean_Data\nhl_model_data.csv'
DELIMITER ','
CSV HEADER;

