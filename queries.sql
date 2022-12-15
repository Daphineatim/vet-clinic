/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth>'2016-01-01' AND date_of_birth<'2019-12-31';
SELECT * FROM animals WHERE escape_attempts < 3;
SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg > 10.5; 
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

BEGIN;
UPDATE animals SET species = 'undefined';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species LIKE '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'01-01-2022';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg<0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>'01-01-1990' AND date_of_birth<'01-01-2000' GROUP BY species;

-- Third project

-- What animals belong to Melody Pond?
SELECT name FROM animals JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals 
JOIN species ON species.id = animals.species_id
 WHERE species.name = 'Pokemon';

 -- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM animals 
LEFT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) FROM species
JOIN animals ON species.id = animals.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' 
AND animals.name LIKE 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' 
AND animals.escape_attempts=0;

-- Who owns the most animals?
SELECT owners.full_name as full_name , COUNT(*) as count FROM animals
JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY count DESC LIMIT 1;
