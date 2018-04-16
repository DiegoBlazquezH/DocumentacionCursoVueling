USE TutorialDB
CREATE TABLE Tabla04
 (empno INT CONSTRAINT Itabla04 PRIMARY KEY,
  nombre NVARCHAR(15),
  profesion NVARCHAR(19),
  fechaalta DATE,
  salario DECIMAL(10,2),
  num_segsocial INT CONSTRAINT Itabla041 UNIQUE NONCLUSTERED
  );
