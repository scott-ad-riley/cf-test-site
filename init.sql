CREATE TABLE food IF NOT EXISTS (
  id serial PRIMARY KEY,
  name varchar ( 50 ) UNIQUE NOT NULL
);

INSERT INTO food (name) VALUES ('cheese');
