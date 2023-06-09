CREATE TABLE animals(
id SERIAL PRIMARY KEY NOT NULL,
name varchar(40) NOT NULL,
date_of_birth date NOT NULL,
escape_attempts int NOT NULL,
neutered bit,
weight_kg decimal
)

ALTER table animals 
ADD COLUMN species varchar(50)


CREATE TABLE owners (
id serial PRIMARY KEY,
full_name varchar(50), 
age int
)

CREATE TABLE species (
id serial PRIMARY KEY,
full_name varchar(50)
)


ALTER TABLE animals
DROP COLUMN id;

select * from animals

ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY

select * from animals

ALTER TABLE animals
DROP COLUMN species

ALTER TABLE animals
ADD COLUMN species_id int

ALTER TABLE animals
ADD CONSTRAINT fk_species  
FOREIGN KEY(species_id) 
REFERENCES species(id) 
ON DELETE CASCADE;


ALTER TABLE animals
ADD COLUMN owner_id int

ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id)
ON DELETE CASCADE;



//
CREATE TABLE vets 
(
    id SERIAL PRIMARY KEY,
    name varchar(50),
     age int, 
     date_of_graduation date
)

CREATE TABLE specializations (
   vet_id int,
	species_id int,
	CONSTRAINT fk_vets
	FOREIGN KEY (vet_id)
	REFERENCES vets(id),
	CONSTRAINT fk_species
	FOREIGN KEY(species_id)
	REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id)
)


CREATE TABLE visits(
vet_id int,
animal_id int,
date_of_visit date,
CONSTRAINT fk_vet
FOREIGN KEY (vet_id) 
REFERENCES vets(id),
CONSTRAINT fk_animal
FOREIGN KEY (animal_id)
REFERENCES animals(id),
PRIMARY KEY (vet_id, animal_id, date_of_visit)
)