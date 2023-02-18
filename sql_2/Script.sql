DROP DATABASE IF EXISTS skypro;
CREATE DATABASE skypro;

\c skypro

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL
);

-- Задание 1

-- 1. Доведите количество записей в таблице до 5.
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('John', 'Nattath', 'Male', 25);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Jane', 'Doe', 'Female', 30);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Bob', 'Smith', 'Male', 40);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Alice', 'Brown', 'Female', 28);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Sam', 'Jones', 'Male', 55);

-- 2. Получите информацию об именах и фамилиях по всем сотрудникам. Колонки должны называться «Имя» и «Фамилия».
SELECT first_name AS "Имя", last_name AS "Фамилия" FROM employee;

-- 3. Получите всю информацию о сотрудниках, которые младше 30 или старше 50 лет.
SELECT * FROM employee WHERE age < 30 OR age > 50;

-- 4. Получите всю информацию о сотрудниках, которым от 30 до 50 лет.
SELECT * FROM employee WHERE age BETWEEN 30 AND 50;

-- 5. Выведите полный список сотрудников, которые отсортированы по фамилиям в обратном порядке.
SELECT * FROM employee ORDER BY last_name DESC;

-- 6. Выведите сотрудников, имена которых длиннее 4 символов.
SELECT * FROM employee WHERE LENGTH(first_name) > 4;

-- Задаине 2

-- 1. Измените имена у двух сотрудников так, чтобы на 5 сотрудников было только 3 разных имени, то есть чтобы получились две пары тезок и один сотрудник с уникальным именем.
UPDATE employee SET first_name = 'Alice' WHERE id = 1;
UPDATE employee SET first_name = 'Jane' WHERE id = 3;

SELECT first_name, last_name FROM employee;

-- 2. Посчитайте суммарный возраст для каждого имени. Выведите в двух столбцах «имя» и «суммарный возраст».
SELECT first_name, SUM(age) AS "Суммарный возраст" FROM employee GROUP BY first_name;

-- 3. Выведите имя и самый юный возраст, соответствующий имени.
SELECT first_name, MIN(age) AS "Самый юный возраст" FROM employee GROUP BY first_name;

-- 4. Выведите имя и максимальный возраст только для неуникальных имен. Результат отсортируйте по возрасту в порядке возрастания.
SELECT first_name, MAX(age) AS "Максимальный возраст" 
  FROM employee 
 WHERE first_name IN (SELECT first_name FROM employee GROUP BY first_name HAVING COUNT(*) > 1) 
 GROUP BY first_name 
 ORDER BY "Максимальный возраст" ASC;
