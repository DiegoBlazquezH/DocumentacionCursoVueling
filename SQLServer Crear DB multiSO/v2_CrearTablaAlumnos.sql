USE AlumnosDB;

IF OBJECT_ID(N'Alumnos', N'U') IS NOT NULL
	DROP TABLE Alumnos

CREATE TABLE Alumnos(
	GUID nvarchar(38) NOT NULL,
	ID int PRIMARY KEY NOT NULL,
	Nombre nvarchar(50),
	Apellidos nvarchar(50),
	DNI nvarchar(10),
	FechaNacimiento datetime,
	Edad int,
	FechaCompletaAlta datetime,
);