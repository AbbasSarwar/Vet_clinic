CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,
name varchar(40) NOT NULL,
date_of_birth date NOT NULL,
escape_attempts int NOT NULL,
neutered bit,
weight_kg decimal
)

ALTER table animals 
ADD COLUMN species varchar(50)
