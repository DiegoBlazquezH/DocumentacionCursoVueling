CREATE FUNCTION numr_pdo(@numcli int) RETURNS int AS
BEGIN
	DECLARE @numr int;
	SELECT @numr=COUNT(*)
	  FROM PEDIDOS
	  WHERE NUMERO_CLI=@numcli;
	RETURN @numr;
END;
GO

select dbo.numr_pdo(1);

GO
CREATE FUNCTION ARTICULOSBarato(@umbral int)
	RETURNS TABLE 
  AS
	RETURN(SELECT * FROM ARTICULOS WHERE PRECIOUNIT_ART<@umbral);

GO
SELECT * FROM ARTICULOSBarato(50);
GO

CREATE FUNCTION AnalisisCliente (@numcli int)
	RETURNS @FichaCliente TABLE(etiqueta nchar(30), valor int)
AS
BEGIN
	INSERT INTO @FichaCliente
		VALUES ('Número de pedidos',dbo.numr_pdo(@numcli));
	INSERT INTO @FichaCliente
		SELECT 'Cantidad total', CONVERT(int,SUM(CNTD_PDO*PRECIOUNIT_ART))
		FROM PEDIDOS pdo  INNER JOIN LINEAS_PDO lin
		  ON pdo .NUMERO_PDO=lin.NUMERO_PDO
		  INNER JOIN ARTICULOS art
		  ON lin.REFERENCIA_ART=art.REFERENCIA_ART;
	RETURN;
END;
GO
SELECT * FROM AnalisisCliente(1);
GO
SELECT dbo.numr_pdo(1);
go
CREATE FUNCTION fprueba()
  RETURNS int
  WITH SCHEMABINDING
AS
BEGIN
	DECLARE @resultado int;
	SELECT @resultado=COUNT(*) FROM dbo.HISTO_FAC;
	RETURN @resultado;
END;
go
DROP TABLE HISTO_FAC;
