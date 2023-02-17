CREATE DATABASE skypro;

\c skypro

CREATE TABLE employee (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL
);

INSERT INTO employee (first_name, last_name, gender, age) VALUES ('John', 'Doe', 'Male', 25);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Jane', 'Doe', 'Female', 30);
INSERT INTO employee (first_name, last_name, gender, age) VALUES ('Bob', 'Smith', 'Male', 40);

SELECT * FROM employee;

UPDATE employee SET first_name = 'Alice' WHERE id = 1;
SELECT * FROM employee;

DELETE FROM employee WHERE id = 2;
SELECT * FROM employee;
