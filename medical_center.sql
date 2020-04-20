DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Medical_Centers (
    CenterID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Address TEXT NOT NULL,
);

CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    CenterID INT NOT NULL,
    Employed_Since DATE NOT NULL,
);

CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Member_Since DATE NOT NULL,
);

CREATE TABLE Visits (
    VisitID SERIAL PRIMARY KEY,
    Doctor INT NOT NULL,
    Patient INT NOT NULL,
    Diagnosis INT NOT NULL,
    Date DATE NOT NULL,
);

CREATE TABLE Diseases (
    DiseaseID SERIAL PRIMARY KEY,
    Name TEXT NOT NULL UNIQUE,
);

CREATE TABLE Diagnoses (
    DiagnosisID SERIAL PRIMARY KEY,
    Instructions TEXT,
    Disease INT NOT NULL,
    Visit INT NOT NULL,
);

ALTER TABLE Doctors ADD CONSTRAINT fk_Doctors_CenterID FOREIGN KEY(CenterID)
REFERENCES Medical_Centers (CenterID);

ALTER TABLE Visits ADD CONSTRAINT fk_Visits_Doctor FOREIGN KEY(Doctor)
REFERENCES Doctors (DoctorID);

ALTER TABLE Visits ADD CONSTRAINT fk_Visits_Patient FOREIGN KEY(Patient)
REFERENCES Patients (PatientID);

ALTER TABLE Visits ADD CONSTRAINT fk_Visits_Diagnosis FOREIGN KEY(Diagnosis)
REFERENCES Diagnoses (DiagnosisID);

ALTER TABLE Diagnoses ADD CONSTRAINT fk_Diagnoses_Disease FOREIGN KEY(Disease)
REFERENCES Diseases (DiseaseID);

ALTER TABLE Diagnoses ADD CONSTRAINT fk_Diagnoses_Visit FOREIGN KEY(Visit)
REFERENCES Visits (VisitID);

