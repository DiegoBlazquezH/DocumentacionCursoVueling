# CLR Stored Procedure Demo Vueling
---

Se realiza una pequeña demo para crear un Stored Procedure en lenguaje .NET (C#, VB, F#) para que se ejecute en el CLR integrado en el SqlServer, 
se codifica una clase en lenguaje C# para realizar una Select de una tabla de SqlServer y mostrar el resultado.

## Introduccion
> Stored procedure el cual podemos definir como una rutina o procedimiento  almacenado directamente en una base de datos. 
Las ventajas que tenemos con este tipo de rutinas es que son mas rapidos que las consultas que realizamos  de forma tradicional ya que se ejecutan directamente en la base de datos a y en consecuencia reducimos el trafico en la red.
Son utilizadas para transacciones distribuidas, toda transaccion se realiza en diferentes DataBase, realizarlo a traves del CLR Stored procedure.
Tambien son utilizadas para realizar funcionalidades que no se pueden realizar con Transac-SQL.


## Pasos a realizar para la creacion de la Demo CLR Stored Procedure C#:

1. Crear proyecto sql server desde VisualStudio.
2. Importar Database que tenemos en SQLServer, se puede crear via Script desde el proyecto o previamente ya creada, 
en nuestro caso la hemos creado via script desde SQLServer,insertando algunos registros.
3. Añadir nuevo elemento al proyecto que sera un Stored Procedure C#.
4. Importar los scripts que realiza la creacion del PROCEDURE y ASSEMBLIE.
5. Compilar solucion
6. Deployar solucion, generando el script y ejecutandolo desde VisualStudio.

---

### Cosas a tener en cuenta:
> * Prestar atencion a los permisos que necesita el servicio SQLServer.
> * Cambiar la ruta donde se encuentra el assembli que se ha generado.