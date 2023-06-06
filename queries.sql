SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name from animals WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = '1';
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

begin

UPDATE animals
SET species = 'unspecified'
ROLLBACK

begin

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is null;

commit

SELECT * from animals

begin

DELETE from animals;

select * from animals

ROLLBACK

select from animals



begin

DELETE from animals
WHERE date_of_birth > '2022-01-01';

UPDATE animals
SET weight_kg = weight_kg * -1;

begin

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

commit;


// QUERIES SELECT AGAIN

SELECT COUNT(*) from animals;

SELECT COUNT(*) from animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) from animals

//max escape
SELECT MAX(escape_attempts) from animals
GROUP BY neutered;

//max escape by average
SELECT neutered, AVG(escape_attempts) FROM animals
GROUP BY neutered;

SELECT 
MIN(weight_kg),
MAX(weight_kg)
FROM animals
GROUP BY species;

max escape //by year

SELECT species, AVG(escape_attempts) from animals
WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-12-31'
GROUP BY species;