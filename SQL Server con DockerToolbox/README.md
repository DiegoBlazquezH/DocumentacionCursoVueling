# 
https://github.com/crops/docker-win-mac-docs/wiki/Windows-Instructions-(Docker-Toolbox)

Solo ejecuto los comandos para borrar la máquina virtual y crear una máquina virtual con más memoria ram y dos núcleos de cpu:

1. docker-machine rm default

2. docker-machine create -d virtualbox --virtualbox-cpu-count=2 --virtualbox-memory=4096 --virtualbox-disk-size=50000 default

3. docker-machine stop

4. exit

5. Then start open a new Docker Quickstart Terminal.

6. Hago un pull de la imagen de sql server
docker pull microsoft/mssql-server-linux

7. Hago un run de la imagen poniéndole el password del usuario sa y teniendo en cuenta que se va a ejecutar en la ip: 192.168.99.100

docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 -d microsoft/mssql-server-linux:2017-CU3

8. Miro que la imagen esta Up
docker ps -a

9. Abro el sql server management studio 2017 y pongo
server name: 192.168.99.100
authentication: sql server authentication
login: sa
password: yourStrong(!)Password

10. FUNCIONA A LA PERFECCIÓN!!

