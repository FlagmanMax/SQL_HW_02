USE lesson2;

# Task 01
/*
1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
Справа располагается рисунок к первому
заданию.

id order_date count_product
1 2022-01-01 156
2 2022-01-02 180
3 2022-01-03 21
4 2022-01-04 124
5 2022-01-05 341
*/
CREATE TABLE sales 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT
);

INSERT INTO sales
(order_date, count_product)
 VALUES
(
    '2022-01-01',
    156
);

INSERT INTO sales
(order_date, count_product)
 VALUES
(
    '2022-01-02',
    180
);

INSERT INTO sales
(order_date, count_product)
 VALUES
(
    '2022-01-03',
    21
);

INSERT INTO sales
(order_date, count_product)
 VALUES
(
    '2022-01-04',
    124
);

INSERT INTO sales
(order_date, count_product)
 VALUES
(
    '2022-01-05',
    341
);

# Task 02
/*
 Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ

id заказа Тип заказа
1 Средний заказ
2 Средний заказ
3 Маленький заказ
4 Средний заказ
5 Большой заказ
*/

SELECT 
	id AS 'Id заказа',
    CASE 
			WHEN count_product < 100 THEN 'Маленький заказ'
			WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
			ELSE 'Большой заказ'
	END AS 'Тип заказа'
    FROM sales;
    
# Task 03
/*
Создайте таблицу “orders”, заполните ее значениями
id employee_id amount order_status
1 e03 15.00 OPEN
2 e01 25.50 OPEN
3 e05 100.70 CLOSED
4 e02 22.18 OPEN
5 e04 9.50 CANCELLED
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

CREATE TABLE orders 
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(15),
    amount FLOAT,
    order_status VARCHAR(30)
);
INSERT INTO orders
(employee_id, amount, order_status)
 VALUES
(
    'e03',
    15.00,
    'OPEN'
);
INSERT INTO orders
(employee_id, amount, order_status)
 VALUES
(
    'e01',
    25.50,
    'OPEN'
);
INSERT INTO orders
(employee_id, amount, order_status)
 VALUES
(
    'e05',
    100.70,
    'CLOSED'
);
INSERT INTO orders
(employee_id, amount, order_status)
 VALUES
(
    'e02',
    22.18,
    'OPEN'
);
INSERT INTO orders
(employee_id, amount, order_status)
 VALUES
(
    'e04',
    9.50,
    'CANCELLED'
);
SELECT 
	id,
    employee_id,
    cast(amount as decimal(10,2)) as 'amount',
    order_status 
FROM orders;

SELECT 
	id,
    employee_id,
    cast(amount as decimal(10,2)) as 'amount',
    CASE order_status
			WHEN 'OPEN' THEN 'Order is in open state'
			WHEN 'CLOSED' THEN 'Order is closed'
			WHEN 'CANCELLED' THEN 'Order is cancelled'
		END AS 'full_order_status'
    FROM orders;

