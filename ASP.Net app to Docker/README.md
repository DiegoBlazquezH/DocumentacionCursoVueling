# Deployar aplicación ASP.Net Core con docker

En el siguiente tutorial vamos a ver como deployar una aplicación ASP.Net Core en un contenedor Docker utilizando Docker Toolbox.

NOTA: A pesar de que normalmente es una mala práctica, en este caso se ha subido la versión compilada de de la aplicación a GitHub para el punto 2.2.

## Paso a paso

1. En primer lugar necesitamos tener nuestro **proyecto de ASP.Net Core**. Si no tenemos ninguna, podemos hacer una de prueba rápidamente. En Visual Studio seleccionamos _Nuevo proyecto_ -> _Aplicacion web ASP.Net Core_ y lo guardamos. 

2. A continuación tenemos que **crear un fichero Dockerfile** en el directorio donde se encuentra el fichero _.csproj_ de nuestra aplicación. Este fichero contendrá las órdenes que debe realizar docker para crear la imagen nueva. 

	2.1. Tendremos dos posibilidades, crear la imagen compilando el proyecto, usando el siguiente Dockerfile:

	```
	FROM microsoft/aspnetcore-build:2.0 AS build-env
	WORKDIR /app

	# Copy csproj and restore as distinct layers
	COPY *.csproj ./
	RUN dotnet restore

	# Copy everything else and build
	COPY . ./
	RUN dotnet publish -c Release -o out

	# Build runtime image
	FROM microsoft/aspnetcore:2.0
	WORKDIR /app
	COPY --from=build-env /app/out .
	ENTRYPOINT ["dotnet", "nombreapp.dll"]
	```

	2.2. O crear la imagen partiendo del proyecto ya compilado (en cuyo caso, el Dockerfile debe estar en la misma carpeta que el entregable):

	```
	FROM microsoft/aspnetcore:2.0
	WORKDIR /app
	COPY . .
	ENTRYPOINT ["dotnet", "nombreapp.dll"]
	```

	NOTA1: Sustituir _nombreapp_ en la última línea por el nombre de la solución en ambos casos.

	NOTA2: El fichero Dockerfile no debe tener extensión (nada de Dockerfile.txt o similar).

3. También deberíamos crear un fichero **.dockignore** y añadir el siguiente código. Esto lo hacemos para evitar copiar ficheros innecesarios a nuestra imagen docker:

	```
	bin\
	obj\
	```

4. A continuación debemos abrir Docker Toolbox y **movernos al directorio** donde tenemos el fichero Dockerfile. Para ello usamos el comando _cd_ seguido de la ruta (tambien podemos movernos carpeta por carpeta, aunque es más lento).

5. Ejecutamos el comando **build**, sustituyendo *nombreimagen* por el nombre que le queramos dar a la nueva imagen:

	```
	docker build -t nombreimagen .
	```

	Con ello, crearemos la imagen con nuestra app.

6. Por último, ejecutamos el comando **run**, el cual lanzará un contenedor con la imagen de nuestra aplicación en 

	```
	docker run -d -p 8000:80 nombreimagen
	```

7. Ya tendremos nuestra aplicación corriendo en Docker. Si accedemos a la dirección:puerto de Docker Toolbox y que le hemos indicado (**192.168.99.100:8000** en este caso) podremos ver la aplicación web funcionando.

## Indice de comandos útiles:

Ver imagenes creadas:
```
docker images -a
```

Ver contenedores creados:
```
docker ps -a
```

Arrancar un contenedor parado:
```
docker start IDCONTENEDOR
```

Parar un contenedor:
```
docker stop IDCONTENEDOR
```

Parar todos los contenedores:
```
docker stop $(docker ps -a -q)
```

Borrar un contenedor (debe pararse previamente):
```
docker rm IDCONTENEDOR
```

Borrar una imagen (deben pararse y borrarse todos sus contenedores previamente):
```
docker rmi IDIMAGEN
```

Borrar todos los contenedores (¡¡¡CUIDADO!!!):
```
docker rm $(docker ps -a -q)
```

Borrar todas las imagenes (¡¡¡CUIDADO!!!):
```
docker rmi $(docker ps -a -q)
```


NOTA: No es necesario introducir los ids del contenedor o la imagen completos. Por ejemplo, si un id es _1a2b3c4d5e6f7g8h9i_, podemos seleccionarlo con _1a2b_, siempre y cuando no haya dos contenedores/imagenes cuyos ids no empiecen con la misma cadena.

## Autor

Diego Blázquez Hernández

## Documentación y links útiles

https://docs.docker.com/engine/examples/dotnetcore/#build-and-run-the-docker-image

https://hub.docker.com/r/microsoft/aspnetcore/

https://andrewlock.net/exploring-the-net-core-docker-files-dotnet-vs-aspnetcore-vs-aspnetcore-build/

https://coderwall.com/p/ewk0mq/stop-remove-all-docker-containers





