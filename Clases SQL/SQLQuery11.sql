/* Insertar Registros 
   en una misma tabla pero con números de valores distintos
*/
USE TutorialDB
GO
INSERT INTO dbo.Articulos
   ([codigo_art],[descripcion],[entradas],[salidas],[precioUnitario],[almacen],[tipo_iva])
VALUES
   (N'6', N'Placas Base', 1200,0,30.14,'C',21)

  INSERT INTO dbo.Articulos
   ([codigo_art],[descripcion],[entradas],[salidas],[precioUnitario],[almacen],[fecha_salida],[tipo_iva])
VALUES
   (N'6', N'Placas Base', 1000,0,39.12,'C','01/05/2018',21)
GO
-- Visualizamos todos los registros de la Tabla  'Articulos'
SELECT * FROM dbo.Articulos;
