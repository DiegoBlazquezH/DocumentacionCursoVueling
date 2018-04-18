# Crear contenedor Docker con Sistema Operativo Linux y MSQ Server

https://github.com/crops/docker-win-mac-docs/wiki/Windows-Instructions-(Docker-Toolbox)

Vamos a crear un contenedor Docker con SQL Server y Linux como Sistema Operativo de fondo. Para que SQL Server funcione correctamente, primero tenemos que hacer que la máquina de Docker utilice más memoria Ram, memoria en disco y núcleos.

1. Eliminamos la máquina de docker predeterminada:
	```
	docker-machine rm default
	```
	Si da un error "Cannot unregister the machine 'default' while it is locked", ejecutar:
	```
	docker-machine stop
	```

2.  Creamos una nueva máquina predeterminada con los nuevos parámetros deseados (2 núcleos, 4gb de ram, 50gb de memoria)
	```
	docker-machine create -d virtualbox --virtualbox-cpu-count=2 --virtualbox-memory=4096 --virtualbox-disk-size=50000 default
	```

3. Detenemos la máquina y cerramos docker
	```
	docker-machine stop
	exit
	```

4. Reabrimos Docker Toolbox

5. Hacemos un pull de un Linux docker con SQL Server 
	```
	docker pull microsoft/mssql-server-linux
	```

6. Hacemos un run de la imagen poniéndole el password del usuario sa y teniendo en cuenta que se va a ejecutar en la ip: 192.168.99.100
	```
	docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 -d microsoft/mssql-server-linux
	```

7. Miramos que la imagen esta Up
	```
	docker ps -a
	docker ps
	```

8. Abrimos el SQLServer Management Studio 2017 y ponemos
	```
	server name: 192.168.99.100
	authentication: sql server authentication
	login: sa
	password: yourStrong(!)Password
	```

9. FUNCIONA A LA PERFECCIÓN!!

