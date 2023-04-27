CREATE DATABASE hw_5;
USE hw_5;

CREATE TABLE cars 
(       
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	NAME VARCHAR(10) NOT NULL, 
	COST INT NOT NULL
);

INSERT INTO cars (NAME, COST)
VALUES
	("Audi", 52642),
    ("Mercedes", 57127),
    ("Skoda", 9000),
    ("Volvo", 29000),
    ("Bentley", 350000),    
    ("Citroen", 21000),    
	("Hummer", 41400),   
    ("Volkswagen", 21600);


/* 1. Создайте представление, в которое попадут 
автомобили стоимостью до 25 000 долларов*/

CREATE VIEW first_view
AS SELECT * FROM cars
WHERE COST > 25000;

SELECT * FROM first_view;

/* 2. Изменить в существующем представлении порог 
для стоимости: пусть цена будет до 30 000 долларов 
(используя оператор ALTER VIEW) */

ALTER VIEW first_view
AS SELECT * FROM cars
WHERE COST < 30000;

SELECT * FROM first_view;

/* 3. Создайте представление, в котором будут только 
автомобили марки “Шкода” и “Ауди” */

CREATE VIEW second_view
AS SELECT * FROM cars WHERE NAME = "Skoda" OR NAME = "Audi";

SELECT * FROM second_view;

/* 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 
2020 и всю следующую неделю.
Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.
Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.
Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа */

CREATE TABLE Analysis 
(       
	an_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	an_name VARCHAR(10) NOT NULL, 
	an_cost FLOAT NOT NULL,
    an_price FLOAT NOT NULL,
    an_group VARCHAR(10) NOT NULL
);

SELECT * FROM Analysis;

CREATE TABLE Groupps
(       
	gr_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	gr_name VARCHAR(10) NOT NULL, 
	gr_temp FLOAT NOT NULL
    );

SELECT * FROM Groupps;

CREATE TABLE Orders 
(       
	ord_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	ord_datetime VARCHAR(10) NOT NULL, 
	ord_an INT NOT NULL,
    FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';



