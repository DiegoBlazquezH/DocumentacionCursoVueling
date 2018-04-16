# Tutorial Vagrant

1.- Crear en una carpeta nueva un fichero Vagrantfile con el siguiente contenido:

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
end

2.- Abrir un cmd en dicha carpeta y ejecutar "vagrant up".
Esto creara una maquina virtual nueva en la carpeta con las caracteristicas que le hemos indicado en el Vagrantfile.

3.- Para acceder a la consola ssh de la maquina arrancada, "vagrant ssh".

4.- Para poder acceder a la interfaz grafica, abrimos VirtualBox y seleccionamos la MV creada.

5.- Para parar Vagrant, "vagrant halt".