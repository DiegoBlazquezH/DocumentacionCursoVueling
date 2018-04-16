USE TutorialDB
SELECT * FROM dbo.Tabla01 WHERE Lugar LIKE N'B%';
SELECT * FROM dbo.Tabla01 WHERE Lugar IN ('MADRID','BARCELONA','SEVILLA'); 
SELECT * FROM dbo.Tabla01 WHERE Lugar NOT IN ('MADRID','BARCELONA','SEVILLA'); 
SELECT * FROM dbo.Tabla01 WHERE Lugar LIKE N'%d%';
SELECT * FROM dbo.Tabla01 WHERE Sueldo BETWEEN 100 AND 1999;
SELECT * FROM dbo.Tabla01 WHERE Sueldo NOT BETWEEN 100 AND 1999;
SELECT Nombre,Sueldo FROM dbo.Tabla01 WHERE Sueldo>1000 ORDER BY Sueldo;
SELECT * FROM dbo.Tabla01 WHERE Sueldo > 250 AND Sueldo <2000;
SELECT * FROM dbo.Tabla01 WHERE (Sueldo>250 AND Sueldo<2000) OR Lugar='Barcelona';
SELECT * FROM dbo.Tabla01 WHERE (Sueldo>1000 AND Sueldo<5000)  OR (Lugar='Barcelona' AND Nombre='CASADO');

