USE Dyrleage_Organiserings_DB
GO

CREATE VIEW vCostumer_Overview as
SELECT p.Patient_Id, p.Patient_Navn, p.Dyr_Type, p.Rase, t.Termin_Tid_Start, t.Termin_Tid_Slut, CONCAT(Leage_Fornavn, ' ', Leage_Efternavn) as Leage
FROM Patienter p
INNER JOIN Terminer t ON t.Patient_Id = p.Patient_Id
INNER JOIN Leager l ON l.Leage_Id = t.Leage_Id;

CREATE VIEW vEjer_Patient_Overview AS
SELECT e.Ejer_Id, CONCAT(e.Ejer_Fornavn, ' ', e.Ejer_Efternavn) as Ejer_Navn, e.Postnummer, p.Patient_Id, p.Patient_Navn
FROM Ejer e
FULL OUTER JOIN Patienter p ON e.Ejer_Id =p.Ejer_Id;

CREATE PROCEDURE Patient_X_Terminer
	@Patient_Id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Patient_Navn, Termin_Tid_Start, Termin_Tid_Slut, Leage FROM vCostumer_Overview c
	WHERE c.Patient_Id = @Patient_Id;
   
END
GO
CREATE PROCEDURE DELETE_RECORD

@Ejer_Id INT,
@Patient_Id INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM Terminer WHERE Patient_Id = @Patient_Id;
	DELETE FROM Patienter WHERE Patient_Id = @Patient_Id;
	DELETE FROM Ejer WHERE Ejer_Id = @Ejer_Id;
END
GO
CREATE TRIGGER Achieve_Ejer 
   ON Ejer FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Saved_Ejer(Ejer_Fornavn, Ejer_Efternavn, Ejer_Tlf_nr, Ejer_Email, Postnummer, Gade)
	SELECT d.Ejer_Fornavn, d.Ejer_Efternavn, d.Ejer_Tlf_nr, d.Ejer_Email, d.Postnummer, d.Gade FROM deleted d;	  
 END   
 GO
CREATE TRIGGER Achieve_Patienter 
   ON Patienter FOR DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Saved_Patienter(Ejer_Id, Patient_Navn, Dyr_Type, Rase)
	SELECT d.Ejer_Id, d.Patient_Navn, d.Dyr_Type, d.Rase FROM deleted d;										   
    							
END	
GO
CREATE INDEX Dyr_Navne
ON Patienter (Patient_Navn);