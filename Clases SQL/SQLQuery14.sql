USE TutorialDB
UPDATE dbo.Articulos set precioUnitario=400,almacen='C',tipo_iva=21
WHERE precioUnitario is NULL AND almacen is NULL  AND tipo_iva is NULL;

-- DELETE FROM dbo.tabla; vs TRUNCATE TABLE dbo.tabla; 
DELETE FROM dbo.Articulos WHERE precioUnitario=3;
DELETE FROM dbo.Articulos WHERE salidas<=190.00 AND ENTRADAS>=40;
DELETE FROM dbo.Articulos WHERE salidas>=100 OR ENTRADAS>0 

SELECT * FROM dbo.Articulos;
 