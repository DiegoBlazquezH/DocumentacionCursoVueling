/*
 Plantilla de script anterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se ejecutarán antes del script de compilación	
 Use la sintaxis de SQLCMD para incluir un archivo en el script anterior a la implementación			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script anterior a la implementación		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE VuelingDB
GO

-- Activo la ejecucion de procedimientos almacenados
sp_configure 'clr_enabled',1;
GO

RECONFIGURE;
GO

-- establezco el contenido de la base de datos de confianza
ALTER DATABASE VuelingDB SET TRUSTWORTHY ON;
GO