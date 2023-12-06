DROP DATABASE IF EXISTS IH_AideenMc;

CREATE DATABASE IH_AideenMc;

use IH_AideenMc;

CREATE TABLE TeamLead (
  leadID INT PRIMARY KEY NOT NULL,
  leadForename VARCHAR(20) NOT NULL,
  leadSurname VARCHAR(30) NOT NULL,
  leadMessage VARCHAR(240) NOT NULL
);

CREATE TABLE Capability (
  capabilityID INT PRIMARY KEY NOT NULL,
  capabilityName VARCHAR(70) NOT NULL
);

CREATE TABLE Band (
  bandID INT PRIMARY KEY NOT NULL,
  bandName VARCHAR(30) NOT NULL,
  bandLevel TINYINT NOT NULL
);

CREATE TABLE Training (
  trainingID INT PRIMARY KEY NOT NULL,
  trainingName VARCHAR(100) NOT NULL,
  trainingLink VARCHAR(400) NOT NULL,
  trainingType VARCHAR(20) NOT NULL
);

CREATE TABLE Competency (
  competencyID INT PRIMARY KEY NOT NULL,
  competencyName VARCHAR(255) NOT NULL
);

CREATE TABLE Competency_Band (
  competencyID INT NOT NULL,
  bandID INT NOT NULL,
  competencyDescription VARCHAR(500) NOT NULL,
  PRIMARY KEY (competencyID, bandID),
  FOREIGN KEY (competencyID) REFERENCES Competency(competencyID),
  FOREIGN KEY (bandID) REFERENCES Band(bandID)
);

CREATE TABLE JobFamily (
  familyID INT PRIMARY KEY NOT NULL,
  familyName VARCHAR(70) NOT NULL,
  capabilityID INT NOT NULL,
  FOREIGN KEY (capabilityID) REFERENCES Capability(capabilityID)
);

CREATE TABLE JobRole (
  roleID INT PRIMARY KEY NOT NULL,
  roleName VARCHAR(50) NOT NULL,
  bandID INT NOT NULL,
  familyID INT NOT NULL,
  specSummary VARCHAR(500) NOT NULL,
  sharepointLink VARCHAR(1000),
  FOREIGN KEY (bandID) REFERENCES Band(bandID),
  FOREIGN KEY (familyID) REFERENCES JobFamily(familyID)
);

CREATE TABLE Responsibility (
  responsibilityID INT PRIMARY KEY NOT NULL,
  responsibilityName VARCHAR(255) NOT NULL,
  roleID INT NOT NULL,
  FOREIGN KEY (roleID) REFERENCES JobRole(roleID)
);

CREATE TABLE Training_Band (
  trainingID INT NOT NULL,
  bandID INT NOT NULL,
  PRIMARY KEY (trainingID, bandID),
  FOREIGN KEY (trainingID) REFERENCES Training(trainingID),
  FOREIGN KEY (bandID) REFERENCES Band(bandID)
);

CREATE TABLE Family_Lead (
  leadID INT NOT NULL,
  familyID INT NOT NULL,
  subGroupName VARCHAR(30),
  PRIMARY KEY (leadID, familyID),
  FOREIGN KEY (leadID) REFERENCES TeamLead(leadID),
  FOREIGN KEY (familyID) REFERENCES JobFamily(familyID)
);


CREATE TABLE `Role`(
	RoleID TINYINT PRIMARY KEY NOT NULL,
    Name VARCHAR(64) NOT NULL
);

CREATE TABLE `User`(
	Username VARCHAR(64) PRIMARY KEY NOT NULL,
    `Password` VARCHAR(64) NOT NULL,
    RoleID TINYINT NOT NULL, 
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
    );
    
    
CREATE TABLE Token(
	Username VARCHAR(64) NOT NULL,
    Token VARCHAR(64) NOT NULL,
    Expiry DATETIME NOT NULL,
    FOREIGN KEY (Username) REFERENCES User(Username)

);