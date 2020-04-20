DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams (
    TeamID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
);

CREATE TABLE Goals (
    GoalID SERIAL PRIMARY KEY,
    Scored_by INT NOT NULL,
    Scored_for INT NOT NULL,
    Match INT NOT NULL,
);

CREATE TABLE Players (
    PlayerID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Team INT NOT NULL,
);

CREATE TABLE Referees (
    RefereeID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
);

CREATE TABLE Matches (
    MatchID SERIAL PRIMARY KEY,
    Team1 INT NOT NULL,
    Team2 INT NOT NULL,
    Referee1 INT NOT NULL,
    Referee2 INT NOT NULL,
    Referee3 INT NOT NULL,
    Season INT NOT NULL,
);

CREATE TABLE Seasons (
    SeasonID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Start_Date date NOT NULL,
    End_Date date NOT NULL,
);

CREATE TABLE Results (
    ResultID SERIAL PRIMARY KEY,
    Match INT NOT NULL,
    Team INT NOT NULL,
    PoINTs INT NOT NULL,
);

ALTER TABLE Goals ADD CONSTRAINT fk_Goals_Scored_by FOREIGN KEY(Scored_by)
REFERENCES Players (PlayerID);

ALTER TABLE Goals ADD CONSTRAINT fk_Goals_Scored_for FOREIGN KEY(Scored_for)
REFERENCES Teams (TeamID);

ALTER TABLE Goals ADD CONSTRAINT fk_Goals_Match FOREIGN KEY(Match)
REFERENCES Matches (MatchID);

ALTER TABLE Players ADD CONSTRAINT fk_Players_Team FOREIGN KEY(Team)
REFERENCES Teams (TeamID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Team1 FOREIGN KEY(Team1)
REFERENCES Teams (TeamID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Team2 FOREIGN KEY(Team2)
REFERENCES Teams (TeamID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Referee1 FOREIGN KEY(Referee1)
REFERENCES Referees (RefereeID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Referee2 FOREIGN KEY(Referee2)
REFERENCES Referees (RefereeID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Referee3 FOREIGN KEY(Referee3)
REFERENCES Referees (RefereeID);

ALTER TABLE Matches ADD CONSTRAINT fk_Matches_Season FOREIGN KEY(Season)
REFERENCES Seasons (SeasonID);

ALTER TABLE Results ADD CONSTRAINT fk_Results_Match FOREIGN KEY(Match)
REFERENCES Matches (MatchID);

ALTER TABLE Results ADD CONSTRAINT fk_Results_Team FOREIGN KEY(Team)
REFERENCES Teams (TeamID);

INSERT INTO Teams (Name) VALUES ('FC Barcelona');
INSERT INTO Teams (Name) VALUES ('Real Madrid');
INSERT INTO Teams (Name) VALUES ('Atletico Madrid');
INSERT INTO Teams (Name) VALUES ('Sevilla');

INSERT INTO Players (First_Name, Last_Name, Team) VALUES ('Lionel','Messi', 1);
INSERT INTO Players (First_Name, Last_Name, Team) VALUES ('Luis','Suarez', 1);
INSERT INTO Players (First_Name, Last_Name, Team) VALUES ('Gareth','Bale', 2);