CREATE DATABASE shop;

CREATE ROLE admin SUPERUSER;

CREATE ROLE viewer;
GRANT CONNECT ON DATABASE shop TO viewer;
GRANT SELECT ON all tables IN schema public TO viewer;

CREATE TABLE book(
    id SERIAL,
    category TEXT UNIQUE PRIMARY KEY);

INSERT INTO book VALUES
    (1, 'science fiction'),
    (2, 'novel'),
    (3, 'technical reading');

CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    price INTEGER CHECK (price > 0),
    FOREIGN KEY(category) REFERENCES book(category));

INSERT INTO product VALUES
    (1, 'Cold Stars', 'science fiction', 100),
    (2, 'Algorhytms', 'technical reading', 100),
    (3, 'Sleepless in Seattle', 'novel', 100),
    (4, 'Space fish', 'science fiction', 23),
    (5, 'Python better than C', 'technical reading', 300),
    (6, 'They call me Metaclass', 'technical reading', 900);

UPDATE product SET price=350
WHERE id=1;

UPDATE product SET price = 1.1*price;

DELETE FROM product WHERE id=2;

SELECT * FROM product 
ORDER BY name;

SELECT * FROM product 
ORDER BY price DESC;

SELECT * FROM product
ORDER BY price DESC
LIMIT 3;

SELECT * FROM product
ORDER BY price
LIMIT 3;

SELECT * FROM product
ORDER BY price DESC
LIMIT 3
OFFSET 3;

SELECT name FROM product 
ORDER BY price DESC
LIMIT 1;

SELECT name FROM product 
ORDER BY price
LIMIT 1;

SELECT COUNT(*) FROM product;

SELECT AVG(price) FROM product;

CREATE VIEW BestBooks AS
    SELECT id, name, category, ROUND(price, 2)
    FROM product
    ORDER BY price DESC
    LIMIT 3;