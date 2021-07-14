
-- This table will contain NBA starting year data
CREATE TABLE NBA_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain NBA retiring year data
CREATE TABLE NBA_retiring (
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

-- This table will contain MLB starting data
CREATE TABLE MLB_starting (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT
);

-- This table will contain MLB retiring data
CREATE TABLE MLB_retiring (
  playerID VARCHAR PRIMARY KEY,
  sport VARCHAR,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT 
);
