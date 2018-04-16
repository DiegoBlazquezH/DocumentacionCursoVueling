USE TutorialDB
-- UTILIZAR TABLA01
/* select renombrando la vista, si no ponemos el igual y intercambiamos el orden el titulo se convierte en un alias 
 de la columna */
SELECT 'Nombre Completo'=nombre,Sueldo=sueldo,'Sueldo Anual'=sueldo*14 FROM dbo.Tabla01;

-- Extraer Parte de la Fecha, mes de enero durante los 3 últimos años.
SELECT 'Número de Pedido'=n_pedido,'Número Cliente'=n_cliente FROM dbo.Pedidos01
WHERE DATEPART(mm,fecha_pedido)=1 AND DATEDIFF(year,GETDATE(),fecha_pedido)<3;

SELECT RTRIM(nombre)+' '+RTRIM(apellidos) AS NombreCompleto, SUBSTRING(codigopostal,1,2) AS Area FROM dbo.Pedidos01;

SELECT DISTINCT lugar FROM dbo.Tabla01 ORDER BY lugar;

SELECT provincia,codigopostal FROM dbo.Pedidos01 GROUP BY provincia,codigopostal;

-- Listas de áreas que tienen al menos 2 clientes Cálculos agregados con HAVING
SELECT Area=SUBSTRING(codigopostal,1,2) FROM dbo.Pedidos01 GROUP BY SUBSTRING(codigopostal,1,2) HAVING COUNT(*)>=2;
-- ///////
SELECT precioMinimo=MIN(precioUnitario),PrecioMedio=AVG(precioUnitario),PrecioMaximo=MAX(precioUnitario)
FROM dbo.Articulos;

SELECT codigo_art,SUM(entradas) AS EntradasMaterial FROM DBO.Articulos GROUP BY codigo_art;

SELECT cat.codigo_cat,cat.etiqueta_cat,art.descripcion FROM Categorias cat,Articulos art
WHERE art.codigo_cat=cat.codigo_cat;

 --Operador union permiter obtener un conjunto de registros que provienen de varias consultas
 SELECT origen='stock',CONVERT(char(6),almacen) AS 'Pedidos/Almacen' referencia_art,stock_actual
 FORM dbo.Stocks
 UNION
 SELECT 'pedido',CONVERT(char(6),pdo.numero_pedido),
 referencia_art,dato_pedido
 FROM LineasPedidos lineas INNER JOIN Pedidos02 pdo
 ON lineas.numero_pedido=pdo.numero_pdo
 ORDER BY referencia_art,origen;

--- Esta Consulta recupera las plazas libres que hay en cada vuelo MADRID-LONDRES del día 20-02-1992.
SELECT plazas_libres FROM reservas WHERE fecha_salida=’20-FEB-92’ AND num_vuelo IN 
(SELECT num_vuelo FROM vuelos WHERE origen=’MADRID’  AND destino=’LONDRES’);

/* Recupera las plazas libres del tipo de Aviones que salen el 20-02-92 y que sean idénticos
 del que sale de MADRID el 01/01/2002 y llega a LONDRES. */
SELECT plazas_libres FROM reservas WHERE fecha_salida=’20-FEB-92’ AND tipo_avion
(SELECT tipo_avion FROM vuelos WHERE origen=’MADRID’  AND destino=’LONDRES’
AND fecha_salida=TO_DATE(‘01012002’,’DDMMYYYY’));




  