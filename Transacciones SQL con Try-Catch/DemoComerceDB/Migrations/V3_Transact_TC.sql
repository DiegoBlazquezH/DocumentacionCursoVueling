USE ComerceDB  
GO

CREATE PROCEDURE Insert_Facturas AS
BEGIN

	DECLARE @TranName VARCHAR(20);  
	SELECT @TranName = 'tranFactura';  

	BEGIN TRY  
		BEGIN TRANSACTION @TranName; 
		INSERT INTO dbo.Facturas ([Id_Cliente],[FechaFactura],[Total]) VALUES ( 3, convert(datetime,'18-06-12 10:34:09 PM'), 2000.56)
		INSERT INTO dbo.LineasFacturas
	   ([Id_Factura],[FechaVencimiento],[Impuesto],[Subtotal],[Descuento],[CodArticulo],[Cantidad])
		VALUES
	   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 20, 100, 50, N'1110-11', 1),
	   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 30, 300, 25, N'8888-11', 2),
	   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 20, 600, 50, N'1234-11', 1)

	   /* Registro que provoca error y genera el rollback*/
   		INSERT INTO dbo.LineasFacturas
	   ([Id_Factura],[FechaVencimiento],[Impuesto],[Subtotal],[Descuento],[CodArticulo])
		VALUES
	   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 20, 100, 50, N'1110-11')
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

