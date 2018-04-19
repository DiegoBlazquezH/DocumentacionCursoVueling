USE ComerceDB  
INSERT INTO dbo.Facturas
   ([Id_Cliente],[FechaFactura],[Total])
VALUES
   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 2000.56),
   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 2000.56),
   ( 2, convert(datetime,'18-06-12 10:34:09 PM'), 2000.56)
GO

IF OBJECT_ID('dbo.LineasFacturas', 'U') IS NOT NULL
INSERT INTO dbo.LineasFacturas
   ([Id_Factura],[FechaVencimiento],[Impuesto],[Subtotal],[Descuento],[CodArticulo],[Cantidad])
VALUES
   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 20, 100, 50, N'1110-11', 1),
   ( 1, convert(datetime,'18-06-12 10:34:09 PM'), 30, 300, 25, N'8888-11', 2),
   ( 2, convert(datetime,'18-06-12 10:34:09 PM'), 20, 600, 50, N'1234-11', 1)
GO
