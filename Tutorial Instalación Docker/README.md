# Instalar Docker

Requisitos:
* Windows 10 version 1709 (Falls Creator update)
* Hyper-V habilitado
* Virtualizacion habilitada

1.- Si está instalado Docker (y no funciona), desinstalar antes de actualizar a 1709.

2.- Actualizar Windows 10 a la versión 1709, tarda bastante. Si da error 0x8, solución:

https://answers.microsoft.com/es-es/windows/forum/windows_10-update-winpc/windows-10-error-0x80070652-al-instalar/b11ca401-c74e-405e-8cf8-3a0a8dde9074

3.- Habilitar Vitualización:

* En HP, pulsar Esc al arrancar el portatil para acceder a la Bios, en opciones avanzadas habilitar la virtualización. Guardar y Reiniciar.

* En Lenovo, pulsar F1/F2 (depende del modelo creo) al arrancar el portatil para acceder a la Bios, habilitar virtualización en la opción indicada para ello.

4.- Habilitar Hyper-V (la opción manual del link es la más sencilla de aplicar) y reiniciar:

https://docs.microsoft.com/es-es/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v

5.- Instalar Docker: https://www.docker.com/community-edition 

Abrir un Powershell (en el escritorio, por ejemplo) con Shift+BotónDerecho -> Abrir Powershell aquí. Ejecutar "Docker pull hello-world" para bajar el helloworld de prueba y "Docker run hello-world" para arrancar el contenedor. Si arranca bien, Docker estñá funcional.