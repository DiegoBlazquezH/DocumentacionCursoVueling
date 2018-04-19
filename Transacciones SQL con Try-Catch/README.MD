# DEMO TRANSACCIONES con TRANSAC-SQL Y BLOQUE TRY/CATCH control excepciones

Se realiza un pequeño proyecto SQLSERVER con Visual Studio 2017, para realizar una demo donde se muestran las transacciones y los bloques TRY/CATCH.

### Transacciones

Una transacción es un conjunto de operaciones que van a ser tratadas como una única unidad. Estas transacciones deben cumplir 4 propiedades fundamentales comúnmente conocidas como ACID (atomicidad, coherencia, asilamiento y durabilidad).
Cuando enviamos esta sentencia al SQL Server se escribe en el fichero de transacciones lo que va a ocurrir y a continuación realiza los cambios necesarios en la base de datos. Si hay algún tipo de problema al hacer esta operación el SQL Server puede leer en el fichero de transacciones lo que se estaba haciendo y si es necesario puede devolver la base de datos al estado en el que se encontraba antes de recibir la sentencia.
* BEGIN (Donde empieza el bloque de la transaccion).
* ROLLBACK TRAN (Vuelve al estado inicial de la base de datos si se ha producido un error).
* COMMIT TRAN (Persiste la base de datos con las operaciones que forman la transaccion si todo ha ido correctamente).

Cuando trabajamos con procedimientos almacenados debemos recordar que cada procedimiento almacenado es una unidad. Cuando se ejecuta lo hace de manera independiente de quien lo llama. Sin embargo si tenemos un ROLLBACK TRAN dentro de un procedimiento almacenado cancelaremos la transacción en curso, pero si hay una transacción externa al procedimiento en el que estamos trabajando se cancelará esa transacción externa.

### Bloque TRY/CATCH

Implementa un mecanismo de control de errores para Transact-SQL que es similar al control de excepciones en los lenguajes Microsoft Visual C# y Microsoft Visual C++. Se puede incluir un grupo de instrucciones Transact-SQL en un bloque TRY. Si se produce un error en el bloque TRY, el control se transfiere a otro grupo de instrucciones que está incluido en un bloque CATCH.

#### Sintaxis
```
	BEGIN TRY  
		 { sql_statement | statement_block }  
	END TRY  
	BEGIN CATCH  
		 [ { sql_statement | statement_block } ]  
	END CATCH  
	[ ; ]  
```

## Getting Started

La solucion consta de las siguiente estructura de scripts para poder realizar la demo:
* \Migrations
	* V1_Init_Comerce_DB (script que crea las tablas).
	* V2_Inserts_Initial_Values (script inserta datos iniciales de las tablas).
	* V3_Transact_TC (Stored Procedured demo simple).
	* V4_Transact_TC_XML (Stored Procedure demo leer datos archivo XML).
* \scripts
	* create_DBA_Comerce (script que crea la base de datos).
	* Execute_SP (script para ejectura de los SP).
	* Drop_Sp (script para eliminar los SP).
	* Drop_Table_DBA_Comerce (script para eliminar Tablas).
* \ Data
	* lineasfacturas
	* facturas

Carpeta Migrations consta de los scripts que se ejecutan en la base datos que tienen un control de version
pueden ser ejecutados via FlyWayDB.

Carpeta scripts, consta de los scripts de utilidades.

Carpeta Data, consta de los archivos xml que tiene datos para ser insertados en la base de datos.

El proyecto consta de dos tablas:
* Tabla Facturas
* Tabla LineasFacturas

La relacion de las tablas es de 1:N, una factura consta de N lineasfacturas.

Para comprobar que se realizan los rollbacks de los dos stored procedured:
* V3_Transact_TC , ultimo insert a la tabla LINEASFACTURAS, no insertamos el campo "CANTIDAD", como lo hemos indicado NOT NULL, se producira un error y lanzara el rollback.
* V4_Transact_TC_XML, en el ultimo regitro del fichero xml, indicar un valor en el campo "Id_Factura" que no exista en la tabla FACTURA, como es foreing key dara un error.


### Prerequisitos

Se ha realizado la demo con el siguiente software

```
Visual Studio 2017 Comunity Edition.
Sql Server 2017.
```

## Autores
 
 Pere Zamora.

## Recursos utilizados

Se han realizado busquedas en la red para realizar la dema, de los cuales indico algunos links.

* [https://programacion.net/articulo/transacciones_en_sql_server_299]
* [https://docs.microsoft.com/es-es/sql/t-sql/language-elements/transactions-transact-sql]
* [https://docs.microsoft.com/es-es/sql/t-sql/language-elements/try-catch-transact-sql]
