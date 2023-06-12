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


INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-04-23'), 
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-01-08')

INSERT INTO specializations (vet_id, species_id) VALUES 
(1,1),
(3,1),
(3,2),
(4, 2)

  INSERT INTO visits(animal_id, vet_id, date_of_visit)
VALUES 
     (1, 1, '2020-05-24'),
	  (1, 3, '2020-07-22'),
	  (2, 4, '2021-02-02'),
	  (3, 2, '2020-01-05'),
	  (3, 2, '2020-03-08'),
	  (3, 2, '2020-05-14'),
	  (4, 3, '2021-05-04'),
	  (5, 4, '2021-02-24'),
	  (6, 2, '2019-12-21'),
	  (6, 1, '2020-08-10'),
	  (6, 2, '2021-04-07'),
	  (7, 3, '2019-09-29'),
	  (8, 4, '2020-10-03'),
	  (8, 4, '2020-11-04'),
	  (9, 2, '2019-01-24'),
	  (9, 2, '2019-05-15'),
	  (9, 2, '2020-02-27'),
	  (9, 2, '2020-08-03'),
	  (10, 3, '2020-05-24'),
	  (10, 1, '2021-01-11');

		//Re Inserted the following VALUES // run for 4times
	  INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
	  insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

      INSERT INTO Denom
      SELECT * FROM visits
      WHERE vet_id = 2;
