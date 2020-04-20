DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Regions (
    RegionID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
);

CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Preferred_Region INT NOT NULL,
);

CREATE TABLE Posts (
    PostID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Body text NOT NULL,
    Posted_by INT NOT NULL,
    Location text NOT NULL,
    Region INT NOT NULL,
    Category INT NOT NULL,
);

CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE,
);

ALTER TABLE Users ADD CONSTRAINT fk_Users_Preferred_Region FOREIGN KEY(Preferred_Region)
REFERENCES Regions (RegionID);

ALTER TABLE Posts ADD CONSTRAINT fk_Posts_Posted_by FOREIGN KEY(Posted_by)
REFERENCES Users (UserID);

ALTER TABLE Posts ADD CONSTRAINT fk_Posts_Region FOREIGN KEY(Region)
REFERENCES Regions (RegionID);

ALTER TABLE Posts ADD CONSTRAINT fk_Posts_Category FOREIGN KEY(Category)
REFERENCES Categories (CategoryID);

