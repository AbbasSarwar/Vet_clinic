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
SELECT species from animals;
ROLLBACK
SELECT species from animals;

begin

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is null;

SELECT * from animals

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


//
SELECT animals.name,owners.full_name from animals join owners
on animals.owner_id = owners.id
where full_name = 'Melody Pond'

SELECT animals.name,species.full_name from animals join species
on animals.species_id = species.id
where full_name = 'POKEMON'

SELECT animals.name,owners.full_name from animals LEFT join owners 
on animals.owner_id = owners.id

SELECT COUNT(*), species.full_name FROM animals JOIN species 
on animals.species_id = species.id
GROUP BY species.id;

SELECT animals.name,species.full_name from animals 
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.full_name = 'Digimon'

SELECT animals.name from animals JOIN owners 
ON animals.species_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester'

SELECT owners.full_name, COUNT(animals.id) as total
from animals JOIN owners 
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY total DESC
LIMIT 1