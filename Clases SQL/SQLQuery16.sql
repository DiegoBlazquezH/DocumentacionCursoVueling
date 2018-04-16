-- Crear una Vista.

CREATE VIEW vart(ref, etiqueta, precio) AS
  SELECT CONVERT(char(5),CODIGO_CAT)+'-'+codigo_art,
		 SUBSTRING(descripcion,1,10), precioUnitario
    FROM ARTICULOS;
GO
SELECT * FROM vart;
