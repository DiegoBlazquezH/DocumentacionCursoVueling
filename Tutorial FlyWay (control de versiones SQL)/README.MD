# Tutorial para control de versiones en FlyWay para SQLServer.

### Introducción:
La idea de este tutorial és tener un howto de como mantener un control de versiones de nuestra base de dato SQL mediante el uso de las migrations.

### Prerequisitos:
* FlyWay usa el protocolo tcp/ip para poder conectar con la base de datos por lo que el primer requisito es Activar el protocolo de TCP/IP desde:
SQL Server Configuration Manager > Configuración de red de SQL Server > Protocolos de MSSQLSERVER > TCP/IP (botón derecho y activar)
* Después deberíamos mirar que las IP's estan activas y habilitadas para SQL Server:
SQL Server Configuration Manager > Configuración de red de SQL Server > Protocolos de MSSQLSERVER > TCP/IP (botón derecho Propiedades) > Pestaña Direcciones IP > Aquí escogeriamos que ip queremos utilizar (ya hay un lsitado predeterminado), en mi caso he escogido la 127.0.0.1 (loopback)

### Instalación:
En el siguiente enlace podeis encontrar la descaqrga de flyway command cli: [Flyway Command Client Download](https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.0.7/flyway-commandline-5.0.7-windows-x64.zip)
Una vez descargado descomprimimos el rar y nmos añadiriamos la carpeta descomprimida a nuestra variable path del sistema. (Para los linuxeros, aqui tambien está el .sh)

### Dos maneras diferentes de config:
1. Flyway tiene un archivo .config dentro de la carpeta config que esta dentro de la carpeta descargada de flyway, la idea es rellenar ese config para poder utilizarlo.
2. Flyway tambien puede funcionar pasando opciones al comando.

## Ejecutando flyway (.config).
Abrimos el archivo config y podemos var las diferentes opciones, las mas importantes serían:
* flyway.url : Aquí debemos introducir la "Cadena de conexión" para neustra base de datos: OJO esto usa jdbc, por lo que en nuestro caso será: flyway.url=jdbc:sqlserver://127.0.0.1:1433;databasename=FlyWayDB
* flyway.user y flyway.password : como habreis supuesto, usuario y password de la base de datos: OJO autenticación SQL Server y que tenga permisos de escritura en esa DB.
* flyway.locations: aqui vendrian, separados por comas, los path donde figuran los scripts sql a importar (Migration scripts).

Tened en cuenta que la base de datos ya ha de existir (es normal porque si no la cadena no tendria sentido).
En un CMD, terminal de ubuntu, PowerShell.... Debemos ejecutar flyway migrate

## Ejecutando flyway (por comandos sin tener en cuenta el .config)
En este caso no tocaremos el config y indicaremos por argumentos del comando todas las opciones comentadas anteriormente:

En un CMD, terminal..... Ejecutamos flyway migrate con las siguietnes opciones:
* -url: Aquí debemos introducir la "Cadena de conexión" para neustra base de datos: OJO esto usa jdbc, por lo que en nuestro caso será: -url=jdbc:sqlserver://127.0.0.1:1433;databasename=FlyWayDB. 
* -user y -password: Como habreis supuesto, usuario y password de la base de datos: OJO autenticación SQL Server-
* -locations: aqui vendrian, separados por comas, los path donde figuran los scripts sql a importar (Migration scripts).

La sentencia entera debería ser algo como:
> flyway migrate -url=jdbc:sqlserver://127.0.0.1:1433;databasename=FlyWayDB -user=pepito -password=pepito -locations=C:/DataBase/Migrations/
