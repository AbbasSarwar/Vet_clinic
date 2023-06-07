INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (1, 'Agumon', '2020-02-03', 0, B'1', 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (2, 'Gabumon', '2018-11-03', 2, B'1', 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (3, 'Pikachu', '2021-01-07', 1, B'0', 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (4, 'Devimon', '2017-05-23', 5, B'1', 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (5, 'Charmander', '2020-02-08', 0, B'0', -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (6, 'Plantmon', '2021-11-15', 2, B'1', -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (7, 'Squirtle', '1993-04-02', 3, B'0', -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (8, 'Angemon', '2015-06-12', 1, B'1', -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (9, 'Boarmon', '2005-06-07', 7, B'1', 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (10, 'Blossom', '1998-10-13', 3, B'1', 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg ) VALUES (11, 'Ditto', '2022-05-14', 4, B'1', 22);


INSERT INTO owners (full_name, age) 
VALUES 
('Sam Smith', 34), 
('Jennifer Orwell', 19), 
('Bob', 45), 
('Melody Pond', 77),
('Dean Winchester', 14), 
('Jodie Whittaker', 38)
select * from owners

INSERT INTO species (full_name) 
VALUES 
('POKEMON'), 
('Digimon')
select * from species


UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon'

select * from animals

UPDATE animals
SET species_id = 1
WHERE species_id is NULL

select * from animals


UPDATE animals
SET owner_id = (SELECT id from owners where full_name = 'Sam Smith')
WHERE name = 'Agumon'
select * from animals

UPDATE animals
SET owner_id = (SELECT id from owners where full_name = 'Jennifer Orwell')
WHERE name in ('Gabumon', 'Pikachu')
select * from animals

UPDATE animals
SET owner_id = (SELECT id from owners where full_name = 'Bob')
WHERE name in ('Devimon', 'Plantmon')
select * from animals

UPDATE animals
SET owner_id = (SELECT id from owners where full_name = 'Melody Pond')
WHERE name in ('Charmander', 'Squirtle', 'Blossom')
select * from animals

UPDATE animals
SET owner_id = (SELECT id from owners where full_name = 'Dean Winchester')
WHERE name in ('Angemon', 'Boarmon')
select * from animals

