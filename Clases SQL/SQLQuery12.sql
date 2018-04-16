/*
Condicionantes.
Conversiones de int a Varchar.
Utilizar la Sentencia Print para realizar Vistas.
 */
USE TutorialDB
DECLARE @TTC decimal(10,2);
DECLARE @X int;
DECLARE @PrintMensaje nvarchar(50); 
Declare @Co varchar(20);

SELECT @TTC=(precioUnitario*(1+(tipo_iva/100)))
FROM dbo.Articulos WHERE codigo_art=N'1'AND entradas>0;

SELECT @X=COUNT(*) FROM DBO.Articulos;

IF (@X%2)=0 PRINT 'X es PAR'
ELSE PRINT 'X es impar';

SELECT 'Valor de TTC'=@TTC;

SELECT @Co=CAST(@X AS VARCHAR); 
SET @PrintMensaje = N'El Valor de la Variable N es:'+ @Co;  
PRINT @PrintMensaje;  





