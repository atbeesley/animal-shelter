DROP TABLE animals;
DROP TABLE customers;

CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  admission_date VARCHAR(255),
  adoptable BOOL
);

CREATE TABLE customers(
  id SERIAL8 primary key,
  name VARCHAR(255),
  age INT2,
  profession VARCHAR(255)
);
