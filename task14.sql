CREATE DATABASE MyTest;
CREATE TABLE Region (RegionID int PRIMARY KEY NOT NULL, RegionDescription nchar(50) NOT NULL);
CREATE TABLE Territories (TerritoryID int PRIMARY KEY NOT NULL, TerritoryDescription nchar(50) NOT NULL,
RegionID int NOT NULL, FOREIGN KEY (RegionID) REFERENCES Region(RegionID));
INSERT INTO Region (RegionID, RegionDescription)
VALUES (1, 'Krasnoyarsk region'), (2, 'Krasnodar region'), (3, 'Kaliningrad region');
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES (1, 'Krasnoyarsk', 1), (2, 'Krasnodar', 2), (3, 'Kaliningrad', 3);