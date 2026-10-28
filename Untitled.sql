CREATE TABLE sales (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	product TEXT NOT NULL,
	price NUMERIC(10, 2) NOT NULL CHECK (price > 0),
	quantity INT NOT NULL CHECK (quantity >= 0)
);

INSERT INTO sales (product, price, quantity)
VALUES
	('Laptop', 1000, 5),
	('Phone', 700, 3),
	('Tablet', 500, 2),
	('Printer', 300, 4);

SELECT * FROM sales;

SELECT *
FROM sales
LIMIT 2;

SELECT SUM(price * quantity) AS total_price
FROM sales;

SELECT
	product,
	SUM(quantity) AS total_quantity,
	ROUND(SUM(price * quantity) / NULLIF(SUM(quantity), 0), 2) AS average_price
FROM sales
GROUP BY product
ORDER BY product;

-- insert quantity=0 to check how NULLIF works
INSERT INTO sales (product, price, quantity)
VALUES
	('Display', 400, 0);

SELECT
	product,
	SUM(quantity) AS total_quantity,
	ROUND(SUM(price * quantity) / NULLIF(SUM(quantity), 0), 2) AS average_price
FROM sales
GROUP BY product
ORDER BY product;



