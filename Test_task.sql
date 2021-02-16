
/*
Для следующего объявления необходимо выбрать названия городов упорядоченные в порядке возрастания:
Table cities
  id integer,
  name string
Необходимо сделать CREATE TABLE команду, INSERT команды (вставить города) и сделать SELECT. Диалект SQL можно выбирать любой.
*/

CREATE TABLE cities
    (id INTEGER PRIMARY KEY, name TEXT);
    
INSERT INTO cities VALUES
    (1, 'Kyiv'),
    (2, 'San Francisco'),
    (3, 'Palo Alto');
    
SELECT * FROM cities
ORDER BY name;

/*
Для следующего объявления необходимо выбрать названия районов упорядоченные в порядке возрастания и соединить с таблицей cities:
Table district
  id integer,
             id_city integer,
  name string
Необходимо сделать CREATE TABLE команду, INSERT команды (вставить районы и города) и сделать SELECT с JOIN (вывести код района, название района, название города).  Диалект SQL можно выбирать любой.
*/

CREATE TABLE district (
    id INTEGER PRIMARY KEY,
    id_city INTEGER, 
    name TEXT,
    FOREIGN KEY(id_city) REFERENCES cities(id));
  
INSERT INTO district VALUES
    (3, 1, 'Pechersk'),
    (2, 2, 'Castro'),
    (1, 3, 'Professorville');
    
SELECT d.id AS "District ID", d.name AS "District Name", c.name AS "City Name" 
FROM district AS d
JOIN  cities AS c ON d.id_city = c.id
ORDER BY d.name;