# Obtener contenedor Docker con un sistema debian ALPINE y Redis

https://hub.docker.com/_/redis/

Tened en cuenta que redis de por si no se isntala en un windows así que esto sera la mejor opción. Obtendremos una imagen de redis (latest) y la desplegaremos en nuestra ballena.

1. Hacemos un pull de un Linux docker con Redis ()
	```
	docker pull redis
	```

2. Hacemos un run de la imagen EXPONIENDO EL PUESTO POR DEFECTO DE REDIS 6379 y teniendo en cuenta que se va a ejecutar en la ip: 192.168.99.100
	```
	docker run -p 6379:6379 -d redis
	```

3. Miramos que la imagen esta Up
	```
	docker ps (deberiamos ver el contenedor redis running)
	```

4. Descargamos en redis desktop (https://redisdesktop.com/download)
	```
    Creamos nueva conexión:
    Nombre: el que queramos
    IP: 192.168.99.100 PUERTO:6379
    authentication : no hay
	```

