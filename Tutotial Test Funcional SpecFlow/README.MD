## SpecFlow

Ejemplo de specflow sencillo para inicialización:

1. Debemos instalar primero la extensión de visual studio que se llama SpecFlow.
2. Para poder implementar los test neesitamso isntalar el nuget de SpecFlow en neustro proyecto de tests.
3. Depende del framework de test que utilicemos tenemos que buscar, además, el SpecFlow adecuado que concuerde con el en el nuget.
    Specflow.MsTest
    Specflow.XUnit.
4. Despues crearemos el archivo con extensión .feature (Agregar > nuevo archivo > )
5. En este archivo rellenaremos con lenguaje Gherkin, las características de nuestro test a realizar.
6. Una vez cumplimentado, hacemos boton derecho en medio del código y seleccionaos "Generate Step Definitions"
7. A modo de mindundi, siguiente siguiente... nos generará un archivo class en el cual tendremos todos los pasos del test segun el gherkin realizado.
8. Cumoplimentaremos todos los métodos para tal de que realize los pasos a testear, y en el último realizaremos el Assert pertinente.
9. Ejecutaremos los test y veremos si se han completado. Con esto tendremos el Test Funcional!!!

El link del ejemplo es este: https://github.com/charliesr/SpecFlowExample

Los archivos en concreto son: 
* Calculator.feature (archivo gherkin)
* CalculatoSteps.cs (archivo generado despyes del "Generate Step Definitions")

La solución tiene dos proyectos:
* Example - Implementación de los métodos que testearemos.
* MyProject.Specs - Testeos funcionales.