-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE Tickets (
    TicketID SERIAL PRIMARY KEY,
    customer INT NOT NULL,
    seat INT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline INT NOT NULL,
    from_city INT NOT NULL,
    from_country INT NOT NULL,
    to_city INT NOT NULL,
    to_country INT NOT NULL,
);

CREATE TABLE Seats (
    SeatID SERIAL PRIMARY KEY,
    Row INT NOT NULL,
    Number INT NOT NULL,
);

CREATE TABLE Airlines (
    AirlineID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Cities (
    CityID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Countries (
    CountryID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
);

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_customer FOREIGN KEY(customer)
REFERENCES Customers (CustomerID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_seat FOREIGN KEY(seat)
REFERENCES Seats (SeatID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_airline FOREIGN KEY(airline)
REFERENCES Airlines (AirlineID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_from_city FOREIGN KEY(from_city)
REFERENCES Cities (CityID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_from_country FOREIGN KEY(from_country)
REFERENCES Countries (CountryID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_to_city FOREIGN KEY(to_city)
REFERENCES Cities (CityID);

ALTER TABLE Tickets ADD CONSTRAINT fk_Tickets_to_country FOREIGN KEY(to_country)
REFERENCES Countries (CountryID);

