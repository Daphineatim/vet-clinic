/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS animals
CREATE TABLE animals
(
	id int GENERATED ALWAYS AS IDENTITY,
    name varchar,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    species varchar
);
