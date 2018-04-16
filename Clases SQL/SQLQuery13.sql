DECLARE @laFecha datetime2;
SET @laFecha='2018-04-09T23:07:45';
SELECT 'Fecha Formato ISO-8601'=@laFecha;
SELECT 'Fecha convertida al tipo Británico Francés(103),Alemán(104),Italiano(105)'=CONVERT(CHAR,@laFecha,103);
USE TutorialDB
SELECT * from Information_Schema.Tables
SELECT * from Information_Schema.Tables where table_name='empleados';
