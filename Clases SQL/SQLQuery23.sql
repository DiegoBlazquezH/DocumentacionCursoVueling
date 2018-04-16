CREATE ASSEMBLY SqlServerProject2
  FROM 'c:\prueba\SqlServerProject2.dll';
go
CREATE TYPE TCuenta
	 EXTERNAL NAME SqlServerProject1.[TCuenta];
go
CREATE TABLE Prueba(
id int,
cuenta TCuenta);
