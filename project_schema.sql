
-- This table will contain all starting year data

CREATE TABLE sports_starting (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);

-- This table will contain all retiring year data

CREATE TABLE sports_retiring (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT 
);



-- This table will contain NBA starting year data
CREATE TABLE NBA_starting (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_starting (sport) 
);

-- This table will contain NBA retiring year data
CREATE TABLE NBA_retiring (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_retiring (sport) 
);

-- This table will contain NFL starting data
CREATE TABLE NFL_starting (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_starting (sport) 
);

-- This table will contain NFL retiring data
CREATE TABLE NFL_retiring (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_retiring (sport)
);

-- This table will contain NHL starting data
CREATE TABLE NHL_starting (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_starting (sport) 
);

-- This table will contain NHL retiring data
CREATE TABLE NHL_retiring (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_retiring (sport) 
);

-- This table will contain MLB starting data
CREATE TABLE MLB_starting (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  start_year INT,
  start_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_starting (sport) 
);

-- This table will contain MLB retiring data
CREATE TABLE MLB_retiring (
  sport VARCHAR PRIMARY KEY,
  position VARCHAR,
  retire_year INT,
  retire_age INT,
  years_played INT,
  FOREIGN KEY (sport) REFERENCES sports_retiring (sport) 
);