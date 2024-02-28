
USE Dyrleage_Organiserings_DB
go

DROP INDEX Patienter.Dyr_Navne;
DROP TRIGGER Achieve_Ejer;
DROP TRIGGER Achieve_Patienter;
DROP PROCEDURE DELETE_RECORD;
DROP PROCEDURE Patient_X_Terminer;
DROP VIEW vCostumer_Overview;

DROP TABLE Terminer;
DROP TABLE Arbejdsdage;
DROP TABLE Patienter;
DROP TABLE Behandlinger;
DROP TABLE Saved_Patienter;
DROP TABLE Saved_Ejer;
DROP TABLE Ejer;
DROP TABLE Leager;