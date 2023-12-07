CREATE TABLE JobRole (
  roleID INT PRIMARY KEY NOT NULL,
  roleName VARCHAR(50) NOT NULL,
  bandID INT NOT NULL,
  familyID INT NOT NULL,
  specSummary VARCHAR(500) NOT NULL,
  sharepointLink VARCHAR(500),
  FOREIGN KEY (bandID) REFERENCES Band(bandID),
  FOREIGN KEY (familyID) REFERENCES JobFamily(familyID)
);

CREATE TABLE Band (
  bandID INT PRIMARY KEY NOT NULL,
  bandName VARCHAR(30) NOT NULL,
  bandLevel TINYINT NOT NULL
);

CREATE TABLE JobFamily (
  familyID INT PRIMARY KEY NOT NULL,
  familyName VARCHAR(70) NOT NULL,
  capabilityID INT NOT NULL,
  FOREIGN KEY (capabilityID) REFERENCES Capability(capabilityID)
);

CREATE TABLE Capability (
  capabilityID INT PRIMARY KEY NOT NULL,
  capabilityName VARCHAR(70) NOT NULL
);