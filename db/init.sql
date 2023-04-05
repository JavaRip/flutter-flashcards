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

INSERT INTO 
  Deck (name) 
VALUES
  ('World Capitals1'),
  ('World Capitals2'),
  ('World Capitals3'),
  ('World Capitals4'),
  ('World Capitals5');

INSERT INTO
  Card (deckId, front, back)
VALUES
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Afghanistan', 'Kabul'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Tirana (Tirane)', 'Albania'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Algiers', 'Algeria'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Andorra la Vella', 'Andorra'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Luanda', 'Angola'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Saint Johns', 'Antigua and Barbuda'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Buenos Aires', 'Argentina'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Yerevan', 'Armenia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Canberra', 'Australia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals1'), 'Vienna', 'Austria'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Baku', 'Azerbaijan'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Nassau', 'Bahamas'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Manama', 'Bahrain'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Dhaka', 'Bangladesh'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Bridgetown', 'Barbados'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Minsk', 'Belarus'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Brussels', 'Belgium'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Belmopan', 'Belize'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Porto Novo', 'Benin'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals2'), 'Thimphu', 'Bhutan'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'La Paz (administrative)', 'Sucre (official) Bolivia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Sarajevo', 'Bosnia and Herzegovina'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Gaborone', 'Botswana'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Brasilia', 'Brazil'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Bandar Seri Begawan', 'Brunei'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Sofia', 'Bulgaria'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Ouagadougou', 'Burkina Faso'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Gitega', 'Burundi'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Phnom Penh', 'Cambodia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals3'), 'Yaounde', 'Cameroon'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Ottawa', 'Canada'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Praia', 'Cape Verde'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Bangui', 'Central African Republic'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Djamena', 'Chad'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Santiago', 'Chile'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Beijing', 'China'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Bogota', 'Colombia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Moroni', 'Comoros'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Kinshasa', 'Congo'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals4'), 'Brazzaville', 'Congo'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'San Jose', 'Costa Rica'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Yamoussoukro', 'Côte dIvoire (Ivory Coast)'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Zagreb', 'Croatia'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Havana', 'Cuba'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Nicosia', 'Cyprus'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Prague', 'Czech Republic (Czechia)'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Copenhagen', 'Denmark'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Djibouti', 'Djibouti'),
  ((SELECT id FROM Deck WHERE name = 'World Capitals5'), 'Roseau', 'Dominica');