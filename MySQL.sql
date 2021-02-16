CREATE DATABASE shop;
USE shop;

CREATE USER 'admin'@'localhost';
GRANT ALL PRIVILEGES ON shop.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'viewer'@'localhost';
GRANT SELECT, SHOW VIEW ON shop.* TO viewer@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE book(
    id SERIAL,
    category VARCHAR(255) UNIQUE PRIMARY KEY);

INSERT INTO book VALUES
    (1, 'science fiction'),
    (2, 'novel'),
    (3, 'technical reading');

CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    category VARCHAR(255),
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

SET SQL_SAFE_UPDATES = 0;
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