-- Ejemplo de creación Base de Datos y una Tabla
USE master
-- GO es un comando no una sentencia.
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'TutorialDB'
)
CREATE DATABASE TutorialDB
ON PRIMARY(
    name=TutorialDB_data,
	filename='C:\TSql Curso\Data\TutorialDB.mdf',
	size=6MB,
	maxsize=15MB,
	filegrowth=1MB)
	LOG ON(
	name=gescom_log,
	filename='C:\TSql Curso\Data\TutorialDB_log.ldf',
	size=2MB,
	maxsize=2MB,
	filegrowth=0MB
	)
	COLLATE modern_spanish_ci_as
GO
-- Abrir Base de Datos Tutorial DB
USE TutorialDB  
-- Crear nueva Tabla llamada 'Customers' con Chema 'dbo'
-- La tabla si existe la borramos
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
DROP TABLE dbo.Customers
GO
-- Creamos la Tabla
CREATE TABLE dbo.Customers
(
   CustomerId        INT    NOT NULL   PRIMARY KEY, -- Clave Primaria
   Nombre      [NVARCHAR](50)  NOT NULL,
   Lugar       [NVARCHAR](50)  NOT NULL,
   Email       [NVARCHAR](50)  NOT NULL
);
GO
-- Insertamos datos en la Tabla
INSERT INTO dbo.Customers
   ([CustomerId],[Nombre],[Lugar],[Email])
VALUES
   ( 1, N'Juan Jose', N'Albacete', N'No tiene'),
   ( 2, N'Katia', N'Rusia', N'katia@adventure-works.com'),
   ( 3, N'Francisco Garcia', N'Salamanca', N'fjose@adventure-works.com'),
   ( 4, N'Joan Vilanova', N'Barcelona', N'jvilanova@adventure-works.com')
GO
-- Visualizamos todos los registros de la Tabla  'Customers'
SELECT * FROM dbo.Customers;
