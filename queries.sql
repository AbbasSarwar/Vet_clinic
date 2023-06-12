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


//

select animals.name, visits.date_of_visit from animals JOIN visits ON
visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1


SELECT animals.name, COUNT(*) as Co from visits JOIN vets
ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name

select vets.name, species.full_name from vets LEFT JOIN specializations 
ON vets.id = specializations.vet_id
LEFT JOIN species 
ON species.id = specializations.species_id

SELECT vets.name,animals.name,visits.date_of_visit from visits JOIN animals 
ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND
visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'

SELECT animals.name,COUNT(*) as MOST from animals JOIN visits
ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
GROUP BY animals.name
ORDER BY MOST DESC
LIMIT 1

SELECT animals.name, vets.name, MIN(visits.date_of_visit) as Firsts from animals JOIN visits
ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name,vets.name
ORDER BY Firsts
LIMIT 1;

SELECT animals.name,vets.name, MAX(visits.date_of_visit) as most_recent from animals join visits ON
visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
GROUP BY animals.name,vets.name
ORDER BY most_recent DESC
LIMIT 1

select count(*) from visits
join animals on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
LEFT join specializations on vets.id = specializations.vet_id and animals.species_id = specializations.species_id
where specializations.vet_id IS NULL;

SELECT species.full_name, COUNT(*) FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.full_name
ORDER BY COUNT(*) DESC
LIMIT 1;

//Performance QUERIES
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4 // took more than 1sec
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';


// Applying Index to visits
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

explain analyze SELECT * FROM Denom where vet_id = 2;