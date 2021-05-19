-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO airlines (name)
VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO cities (name)
VALUES ('Washington DC'), ('Seattle'), ('Tokyo'), ('London'), ('Los Angeles'), ('Las Vegas'), ('Mexico City'), ('Paris'), ('Casablanca'), ('Dubai'), ('Beijing'), ('New York'), ('Charlotte'), ('Cedar Rapids'), ('Chicago'), ('New Orleans'), ('Sao Paolo'), ('Santiago');

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries (name)
VALUES ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  assignment TEXT NOT NULL
);

INSERT INTO seats (assignment)
VALUES ('33B'), ('8A'), ('12F'), ('20A'), ('23D'), ('18C'), ('9E'), ('1A'), ('32B'), ('10D');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT REFERENCES passengers,
  seat INT REFERENCES seats,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT REFERENCES airlines,
  from_city INT REFERENCES cities,
  from_country INT REFERENCES countries,
  to_city INT REFERENCES cities,
  to_country INT REFERENCES countries
);

INSERT INTO tickets
  (passenger, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
  (3, 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
  (1, 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  (4, 5, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  (2, 6, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  (5, 7, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  (6, 8, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  (5, 9, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  (7, 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);