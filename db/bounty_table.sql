DROP TABLE IF EXISTS bounty_table;

CREATE TABLE bounty_table(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT,
  danger_level VARCHAR(255),
  homeworld VARCHAR(255)
);
