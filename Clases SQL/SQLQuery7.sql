-- Abrir Base de Datos Tutorial DB
USE TutorialDB  
-- Crear nueva Tabla llamada 'Customers' con Chema 'dbo'
-- La tabla si existe la borramos
GO
IF OBJECT_ID('dbo.Tabla01', 'U') IS NOT NULL
-- Insertamos datos en la Tabla
INSERT INTO dbo.Tabla01
   ([CustomerId],[Nombre],[Lugar],[Email],[sueldo])
VALUES
   ( 80, N'Juan Jose', N'Albacete', N'No tiene',100.20),
   ( 200, N'Katia', N'Rusia', N'katia@adventure-works.com',1000.45),
   ( 300, N'Francisco Garcia', N'Salamanca', N'fjose@adventure-works.com',2000.56),
   ( 400, N'Joan Vilanova', N'Barcelona', N'jvilanova@adventure-works.com',3000.54)
GO
-- Visualizamos todos los registros de la Tabla  'Customers'
SELECT * FROM dbo.Tabla01;
