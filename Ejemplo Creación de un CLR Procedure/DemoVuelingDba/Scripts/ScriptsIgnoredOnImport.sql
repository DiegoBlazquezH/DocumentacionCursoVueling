USE VuelingDB
GO

-- borro el procedimiento (Cuidado en Produccion - mejor alter y no DROP)
IF OBJECT_ID ('dbo.ClrDemo','PC') IS NOT NULL
    DROP PROCEDURE dbo.ClrDemo;
GO
-- Registramos el assemblie (Cuidado en Produccion - mejor alter y no DROP)
IF  EXISTS (SELECT * FROM sys.assemblies asms WHERE asms.name = N'DemoVuelingDba')
    DROP ASSEMBLY DemoVuelingDba;
GO
CREATE ASSEMBLY DemoVuelingDba FROM 'C:\CursoSqlServer2017\DemoVuelingDba\DemoVuelingDba\bin\Debug\DemoVuelingDba.dll' WITH PERMISSION_SET = EXTERNAL_ACCESS;
GO
-- Creo un procedimiento almacenado enlazado al ensamblado anterior
CREATE PROCEDURE dbo.ClrDemo 
AS EXTERNAL NAME DemoVuelingDba.StoredProcedures.ClrDemo; 

-- Ejuctamos stored Procedure
--GO
--EXEC dbo.ClrDemo
--GO