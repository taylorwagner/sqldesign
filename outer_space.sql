-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies (name) 
VALUES ('Milky Way');

CREATE TABLE center_stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO center_stars (name)
VALUES ('The Sun', 'Proxima Centauri', 'Gliese 876');

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT
);

INSERT INTO moons (name)
VALUES ('The Moon', 'Phobos', 'Deimos', 'Naiad', 'Thalassa', 'Despina', 'Galatea', 'Larissa', 'S/2004 N 1', 'Proteus', 'Triton', 'Nereid', 'Halimede', 'Sao', 'Laomedeia', 'Psamathe', 'Neso')

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES center_stars,
  galaxy INT REFERENCES galaxies,
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

CREATE TABLE planets_moons (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES planets,
  moon_id INT REFERENCES moons
);

INSERT INTO planets_moons (planet_id, moon_id)
VALUES (1, 1), (2, 2), (2, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13), (4, 14), (4, 15), (4, 16), (4, 17);

