USE TutorialDB
CREATE TABLE Tabla03
 (empno INT CONSTRAINT Itabla03 PRIMARY KEY,
  nombre NVARCHAR(15),
  profesion NVARCHAR(19),
  fechaalta DATE,
  salario DECIMAL(10,2),
  num_segsocial INT CONSTRAINT Itabla031 UNIQUE
  );
