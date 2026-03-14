CREATE TABLE Sector_Analysis (
    Year_ID NUMBER(4),
    Sector_Name VARCHAR2(100),
    Profit_Mln NUMBER(15, 2),
    Loss_Mln NUMBER(15, 2),
    Avg_Salary NUMBER(10, 2)
);
INSERT INTO Sector_Analysis (Year_ID, Sector_Name, Profit_Mln, Loss_Mln, Avg_Salary)
VALUES (2021, 'Senaye', 34288.5, 1318.0, 1141.2);

INSERT INTO Sector_Analysis (Year_ID, Sector_Name, Profit_Mln, Loss_Mln, Avg_Salary)
VALUES (2021, 'Tikinti', 2563.3, 251.1, 868.9);

INSERT INTO Sector_Analysis (Year_ID, Sector_Name, Profit_Mln, Loss_Mln, Avg_Salary)
VALUES (2021, 'Neqliyyat', 1111.4, 400.9, 973.8);

INSERT INTO Sector_Analysis (Year_ID, Sector_Name, Profit_Mln, Loss_Mln, Avg_Salary)
VALUES (2021, 'IKT', 467.4, 74.0, 1146.9);

COMMIT;
SELECT Sector_Name, 
       Profit_Mln, 
       Loss_Mln,
       ROUND((Loss_Mln / Profit_Mln) * 100, 2) AS Loss_Percentage
FROM Sector_Analysis
ORDER BY Loss_Percentage DESC;
CREATE OR REPLACE VIEW Audit_Summary_View AS
SELECT Sector_Name,
       Profit_Mln,
       Loss_Mln,
       Avg_Salary,
       ROUND((Loss_Mln / Profit_Mln) * 100, 2) AS Loss_Rate,
       CASE 
            WHEN (Loss_Mln / Profit_Mln) > 0.20 THEN 'Yüks?k Risk'
            WHEN (Loss_Mln / Profit_Mln) BETWEEN 0.10 AND 0.20 THEN 'Orta Risk'
            ELSE 'Stabil'
       END AS Audit_Status
FROM Sector_Analysis;