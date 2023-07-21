-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE TABLE IF NOT EXISTS sales
(
Id INT AUTO_INCREMENT PRIMARY KEY,
OrderDate DATE NOT NULL,
ProductCount INT DEFAULT 0
);

INSERT INTO sales (OrderDate, ProductCount)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id,
CASE 
	When ProductCount <100
		Then "Small order"
	When ProductCount >300
		Then "Big order"
	Else "Average order"
END AS OrderType
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE IF NOT EXISTS orders
(
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id VARCHAR(45) NOT NULL,
amount FLOAT DEFAULT 0,
order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT *,
CASE 
	When order_status="OPEN"
		Then "Order is in open state"
	When order_status="CLOSED"
		Then "Order is closed"
	When order_status="CANCELLED"
		Then "Order is cancelled"
END AS full_order_status
FROM orders;
