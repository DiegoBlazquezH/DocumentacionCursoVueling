-- ejemplo de uso de variables
declare @X char(30);
declare @numero int;
select @X='EJEMPLO USO DE VARIABLES';
select LOWER(@X);
select @numero=COUNT(*) from dbo.Tabla01;
select 'Número de Registros '=@numero;
