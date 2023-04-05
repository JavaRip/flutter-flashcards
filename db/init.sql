CREATE TABLE Deck (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE Card (
  id SERIAL PRIMARY KEY,
  deckId INTEGER,
  front VARCHAR,
  back VARCHAR
);

CREATE TABLE Review (
  id SERIAL PRIMARY KEY,
  cardId INTEGER,
  ts INTEGER,
  correct Boolean
);

