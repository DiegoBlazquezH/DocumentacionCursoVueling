-- Intrucciónes.
USE TutorialDB;
GO
SELECT etiqueta=CASE codigo_art
	WHEN 10 THEN 'Impresoras'
	WHEN 20 THEN 'Escáneres'
	WHEN 1002 THEN 'Teclados Alambricos'
	ELSE 'Otros'
	END,
	codigo_art, descripcion
  FROM ARTICULOS
  ORDER BY CODIGO_CAT;
go

SELECT 'Descripción precio' =CASE
	WHEN precioUnitario<50 THEN 'Descuento'
	WHEN precioUnitario BETWEEN 50 AND 150 THEN 'Normal'
	ELSE 'Exclusivo'
	END,
	codigo_art, descripcion
  FROM ARTICULOS;
go
-- e IF
DECLARE @numcli int=153689;
IF exists(SELECT * FROM empleados WHERE emplnum=@numcli) 
  BEGIN
	DELETE FROM Pedidos01 WHERE n_cliente=@numcli;
	DELETE FROM empleados WHERE emplnum=@numcli;
	PRINT 'Suppression OK';
  END
ELSE
  PRINT 'No hay cliente para este número';
go

-- f WHILE

DECLARE @incremento numeric(4,2)=1.01;

WHILE (SELECT AVG(precioUnitario) FROM ARTICULOS)<240 
BEGIN
	UPDATE ARTICULOS 
		SET precioUnitario=ISNULL(precioUnitario,0)*@incremento
	IF(SELECT MAX(precioUnitario) FROM ARTICULOS WHERE CODIGO_CAT=10)>300
		BREAK;
	SELECT @incremento=@incremento+0.01;
END;
go


