DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  status VARCHAR(255)
);

CREATE TABLE records(
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  title VARCHAR(255),
  genre VARCHAR(255),
  released INT,
  artwork VARCHAR(255),
  quantity INT,
  buy_price INT,
  sell_price INT
);
