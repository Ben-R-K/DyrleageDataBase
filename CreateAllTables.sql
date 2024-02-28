
USE Dyrleage_Organiserings_DB
go

CREATE TABLE Leager(
Leage_Id INT PRIMARY KEY IDENTITY(1,1),
Leage_Fornavn nvarchar(25) NOT NULL,
Leage_Efternavn nvarchar(15) NOT NULL);
go
CREATE TABLE Ejer(
Ejer_Id INT PRIMARY KEY IDENTITY(1,1),
Ejer_Fornavn nvarchar(25) NOT NULL,
Ejer_Efternavn nvarchar(15) NOT NULL,
Ejer_Tlf_nr INT NOT NULL,
Ejer_Email nvarchar(35),
Postnummer INT NOT NULL,
Gade nvarchar(30) NOT NULL);
go
CREATE TABLE Saved_Ejer(
Ejer_Id INT PRIMARY KEY IDENTITY(1,1),
Ejer_Fornavn nvarchar(25) NOT NULL,
Ejer_Efternavn nvarchar(15) NOT NULL,
Ejer_Tlf_nr INT NOT NULL,
Ejer_Email nvarchar(35),
Postnummer INT NOT NULL,
Gade nvarchar(30) NOT NULL,
Save_Date Date DEFAULT GETDATE());
go
CREATE TABLE Saved_Patienter(
Patient_Id INT PRIMARY KEY IDENTITY(1,1),
Ejer_Id INT NOT NULL,
Patient_Navn nvarchar(12) NOT NULL,
Dyr_Type nvarchar(15) NOT NULL,
Rase nvarchar(30) NOT NULL,
Save_Date Date DEFAULT GETDATE());
go
CREATE TABLE Behandlinger(
Behandlings_Id INT PRIMARY KEY IDENTITY(1,1),
Behandling nvarchar(20) NOT NULL);
go
CREATE TABLE Patienter(
Patient_Id INT PRIMARY KEY IDENTITY(1,1),
Ejer_Id INT FOREIGN KEY REFERENCES Ejer(Ejer_Id) NOT NULL,
Patient_Navn nvarchar(12) NOT NULL,
Dyr_Type nvarchar(15) NOT NULL,
Rase nvarchar(30) NOT NULL);
go
CREATE TABLE Arbejdsdage(
Arbejds_Dag_Id INT PRIMARY KEY IDENTITY(1,1),
Start_Tid DATETIME NOT NULL,
Slut_Tid DATETIME NOT NULL,
Leage_Id INT FOREIGN KEY REFERENCES Leager(Leage_Id) NOT NULL);
go
CREATE TABLE Terminer(
Termin_Id INT PRIMARY KEY IDENTITY(1,1),
Leage_Id INT FOREIGN KEY REFERENCES Leager(Leage_Id) NOT NULL,
Patient_Id INT FOREIGN KEY REFERENCES Patienter(Patient_Id) NOT NULL,
Behandlings_Id INT FOREIGN KEY REFERENCES Behandlinger(Behandlings_Id) NOT NULL,
Termin_Tid_Start DATETIME NOT NULL,
Termin_Tid_Slut DATETIME NOT NULL);