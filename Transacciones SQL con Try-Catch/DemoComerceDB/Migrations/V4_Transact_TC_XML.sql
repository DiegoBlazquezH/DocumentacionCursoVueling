-- Configuramos el cmd para poder utilizar si existe el fichero
USE master;  
GO  
EXEC sp_configure 'show advanced option', '1';  
RECONFIGURE WITH OVERRIDE;

EXEC sp_configure 'xp_cmdshell', 1;  
GO  
RECONFIGURE;

USE ComerceDB
GO

CREATE PROCEDURE Insert_Facturas1 AS
BEGIN

	DECLARE @TranName VARCHAR(20);  
	SELECT @TranName = 'tranFactura1'; 

	BEGIN TRY  
		BEGIN TRANSACTION @TranName

		DECLARE @fileFactura INT
		EXEC @fileFactura = XP_CMDSHELL 'DIR "C:\DataBase\Data\facturas.xml" /B', NO_OUTPUT
		IF @fileFactura = 1
			  PRINT 'File Donot exists'
		ELSE
			-- Insertamos los nodos XML dentro de la tabla factura
			INSERT INTO dbo.Facturas ([Id_Cliente],[FechaFactura],[Total])
				SELECT x.Factura.query('Id_Cliente').value('.','INT'),
					   x.Factura.query('FechaFactura').value('.','DATETIME'),
					   x.Factura.query('Total').value('.','DECIMAL(10,2)')
				FROM (SELECT CAST(x AS XML)
					FROM OPENROWSET(BULK 'C:\DataBase\Data\facturas.xml',SINGLE_BLOB) AS T(x))
					AS T(x)
				CROSS APPLY x.nodes('Facturas/Factura') AS X(Factura);

		DECLARE @fileLineFactura INT
		EXEC @fileLineFactura = XP_CMDSHELL 'DIR "C:\DataBase\Data\lineasfacturas.xml" /B', NO_OUTPUT
		IF @fileLineFactura = 1
			  PRINT 'File Donot exists'
		ELSE
			-- Insertamos los nodos XML dentro de la tabla linea factura
			INSERT INTO dbo.LineasFacturas ([Id_Factura],[FechaVencimiento],[Impuesto],[Subtotal],[Descuento],[CodArticulo],[Cantidad])
				SELECT x.LineaFactura.query('Id_Factura').value('.','INT'),
					   x.LineaFactura.query('FechaVencimiento').value('.','DATETIME'),
					   x.LineaFactura.query('Impuesto').value('.','DECIMAL(5,2)'),
					   x.LineaFactura.query('Subtotal').value('.','DECIMAL(10,2)'),
					   x.LineaFactura.query('Descuento').value('.','DECIMAL(5,2)'),
					   x.LineaFactura.query('CodArticulo').value('.','NVARCHAR(20)'),
					   x.LineaFactura.query('Cantidad').value('.','INT')
				FROM (SELECT CAST(x AS XML)
					FROM OPENROWSET(BULK 'C:\DataBase\Data\lineasfacturas.xml',SINGLE_BLOB) AS T(x))
					AS T(x)
				CROSS APPLY x.nodes('LineasFacturas/LineaFactura') AS X(LineaFactura);
		COMMIT TRANSACTION @TranName; 
		PRINT 'Transaction commited'
	END TRY  
	BEGIN CATCH  
		ROLLBACK
		PRINT 'Transaction rolled back'
	END CATCH 

SELECT * FROM dbo.Facturas;
SELECT * FROM dbo.LineasFacturas;
END
GO