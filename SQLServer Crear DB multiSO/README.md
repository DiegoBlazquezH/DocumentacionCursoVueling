## Scripts SQLServer para crear una misma base de datos en distinto Sistemas Operativos (Windows y Linux)

El script v1 permite crear una base de datos (en este caso, AlumnoDB) en un SQLServer hospedado tanto en Windows como en Linux. Para ello, lee una variable de entorno del sistema (en ejemplo se llama SQLServerDB) donde tenemos almacenada la ruta donde se va a crear la base de datos. 

## Prerequisitos

* Necesitamos tener SQL Server instalado en nuestra máquina servidor (ya sea [Linux](https://docs.microsoft.com/es-es/sql/linux/sql-server-linux-setup) o [Windows](https://docs.microsoft.com/es-es/sql/database-engine/install-windows/install-sql-server)). 

* Para conectarnos a SQLServer, necesitaremos [SQLServer Management Studio en Windows](https://docs.microsoft.com/es-es/sql/ssms/download-sql-server-management-studio-ssms) o [SQLCMD en Linux](https://docs.microsoft.com/es-es/sql/linux/sql-server-linux-setup)

## Pasos

1. En primer lugar, debemos tener creada una variable de entorno en nuestro servidor cuyo valor será la ruta donde queremos crear la base de datos.

	* En Windows, tendremos que ir al Panel de Control y buscar la opción "Propiedades del sistema" -> "Variables de entorno" y añadir la variable y su valor. 
	
		También se puede utilizar el script "crearEnvVarWindows.ps1" adjuntado en la documentación, modificandolo con nuestros propios parámetros. 

	* En Linux, tendremos que abrir una ventana de consola y ejecutar :
		```
		sudo nano /etc/environment
		```
		Esto nos abrirá el editor nano y tendremos que añadir una nueva linea con nuestra variable y su valor:
		```
		SQLServerDB=/var/SQLServer DB
		```
		También se puede utilizar el script "crearEnvVarLinux.sh" adjuntado en la documentación.

	<span style="color:red; font-weight: bold;">IMPORTANTE:</span>
	La ruta debe existir en el servidor. Si alguna de las carpetas es nueva, deberemos crearla manualmente o el script de creación de la base de datos fallará.

	NOTA: Los script crearEnvVar aún no han sido añadidos a la documentación.

2. Una vez creada la variable de entorno, es necesario reiniciar el SQLServer y antes de ejecutar el script de creacion de la base de datos v1. Además, en el caso de Linux, es necesario reiniciar la sesión de usuario para que la detecte.

3. A continuación, podremos ejecutar nuestros script de creación de base de datos:

	* En Windows, tendremos que abrir el script v1 con SQLServer y ejecutarlo.

	* En Linux, tendremos que ejecutarlo vía sqlcmd, con el comando. Parámetros:

		* localhost: sustituir por la IP del servidor, en nuestro caso estamos en la máquina del servidor.
		* sa: nombre del usuario de SQLServer con el cual nos conectamos, en nuestro caso, el usuario "sa".
		* Pa$$w0rd: la contraseña de nuestro usuario de SQLServer.
		* script.sql: nombre del script que queremos ejecutar.

		```
		sudo sqlcmd -S localhost -U sa -P 'Pa$$w0rd' -i script.sql
		```

4. Por último, ejecutaremos el script v2 para generar la tabla de alumnos.


## Extra: Conectarnos a SQLServer de Linux desde Management Studio en Windows

1. Ejecutar "ifconfig" en Linux para saber la dirección de nuestro servidor. En nuestro caso, 192.168.73.130 (en "inet addr", segunda línea):

```
ens33     Link encap:Ethernet  HWaddr 00:0c:29:04:3e:04  
          inet addr:192.168.73.130  Bcast:192.168.73.255  Mask:255.255.255.0
          inet6 addr: fe80::4694:9946:c1ae:84c0/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9831 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5653 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:3550631 (3.5 MB)  TX bytes:659064 (659.0 KB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:3873 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3873 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:10543656 (10.5 MB)  TX bytes:10543656 (10.5 MB)

```

2. A continuación, vamos a SQLServer Management Studio (Windows), "File"->"Connect Object Explorer". En ServerName le indicamos la IP de nuestro servidor, en Authentication ponemos "SQL Server Authentication" y añadimos las credenciales del usuario de Linux (en nuestro caso, sa y Pa$$w0rd).

3. Hecho esto, ya estaríamos conectados al SQLServer de nuestro Linux.