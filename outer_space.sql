-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE Planets (
    PlanetID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    galaxy INT NOT NULL,
);

CREATE TABLE Planets_Moons (
    Planet_MoonID SERIAL PRIMARY KEY,
    Planet INT NOT NULL,
    Moon INT NOT NULL,
);

CREATE TABLE Moons (
    MoonID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Galaxies (
    GalaxyID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Stars (
    StarID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Orbits (
    OrbitID SERIAL PRIMARY KEY,
    Star INT NOT NULL,
    Planet INT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
);

ALTER TABLE Planets ADD CONSTRAINT fk_Planets_galaxy FOREIGN KEY(galaxy)
REFERENCES Galaxies (GalaxyID);

ALTER TABLE Planets_Moons ADD CONSTRAINT fk_Planets_Moons_Planet FOREIGN KEY(Planet)
REFERENCES Planets (PlanetID);

ALTER TABLE Planets_Moons ADD CONSTRAINT fk_Planets_Moons_Moon FOREIGN KEY(Moon)
REFERENCES Moons (MoonID);

ALTER TABLE Orbits ADD CONSTRAINT fk_Orbits_Star FOREIGN KEY(Star)
REFERENCES Stars (StarID);

ALTER TABLE Orbits ADD CONSTRAINT fk_Orbits_Planet FOREIGN KEY(Planet)
REFERENCES Planets (PlanetID);