-- Abrir Base de Datos Tutorial DB
USE TutorialDB  
-- Crear nueva Tabla llamada 'Tabla01' con Chema 'dbo'
-- La tabla si existe la borramos
IF OBJECT_ID('dbo.Tabla01', 'U') IS NOT NULL
DROP TABLE dbo.Tabla01
GO
-- Creamos la Tabla
CREATE TABLE dbo.Tabla01
(
   CustomerId        INT    NOT NULL   PRIMARY KEY, -- Clave Primaria
   Nombre      [NVARCHAR](50)  NOT NULL,
   Lugar       [NVARCHAR](50)  NOT NULL,
   Email       [NVARCHAR](50)  NOT NULL,
   Sueldo      [DECIMAL](10,2) NOT NULL
);
GO
select * from dbo.Tabla01;
