USE ComerceDB 
GO
IF OBJECT_ID('dbo.Facturas', 'U') IS NOT NULL
DROP TABLE dbo.Facturas
GO
-- Creamos la Tabla Facturas
CREATE TABLE dbo.Facturas
(
   Id_Factura  	INT NOT NULL  IDENTITY(1,1) PRIMARY KEY, -- Clave Primaria
   Id_Cliente  	INT NOT NULL,
   FechaFactura DATETIME NOT NULL,
   Total        DECIMAL(10,2) NOT NULL
);
GO

IF OBJECT_ID('dbo.LineasFacturas', 'U') IS NOT NULL
DROP TABLE dbo.LineasFacturas
GO

-- Creamos la Tabla LineaFacturas
CREATE TABLE dbo.LineasFacturas
(
   Id_LinFactura  	INT NOT NULL  IDENTITY(1,1) PRIMARY KEY, -- Clave Primaria
   Id_Factura 		INT FOREIGN KEY REFERENCES Facturas(Id_Factura),
   FechaVencimiento DATETIME NOT NULL,
   Impuesto			DECIMAL(5,2),
   Subtotal			DECIMAL(10,2),
   Descuento		DECIMAL(5,2),
   CodArticulo		NVARCHAR(20),
   Cantidad			INT NOT NULL
);
GO
