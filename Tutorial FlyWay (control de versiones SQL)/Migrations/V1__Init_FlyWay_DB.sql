USE FlyWayDB  
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
DROP TABLE dbo.Customers
GO
-- Creamos la Tabla
CREATE TABLE dbo.Customers
(
   CustomerId   INT            NOT NULL   PRIMARY KEY,
   Nombre      [NVARCHAR](50)  NOT NULL,
   Lugar       [NVARCHAR](50)  NOT NULL,
   Email       [NVARCHAR](50)  NOT NULL
);
GO

IF OBJECT_ID('dbo.Tabla01', 'U') IS NOT NULL
DROP TABLE dbo.Tabla01
GO
-- Creamos la Tabla
CREATE TABLE dbo.Tabla01
(
   CustomerId        INT    NOT NULL   PRIMARY KEY, -- Clave Primaria
   Nombre      [NVARCHAR](50)  NOT NULL,
   Lugar       [NVARCHAR](50)  NOT NULL,
   Email       [NVARCHAR](50)  NOT NULL,
   Sueldo      [DECIMAL](10,2) NOT NULL
);
GO

CREATE TABLE TABLA02
  (coddepar INT NOT NULL,
  codiarea INT NOT NULL,
  nemplead INT NOT NULL,
  salarioe decimal(10,2) NOT NULL,
  CONSTRAINT pk_ekjemplo3 PRIMARY KEY (coddepar,codiarea)        
  );

CREATE TABLE Tabla03
 (empno INT CONSTRAINT Itabla03 PRIMARY KEY,
  nombre NVARCHAR(15),
  profesion NVARCHAR(19),
  fechaalta DATE,
  salario DECIMAL(10,2),
  num_segsocial INT CONSTRAINT Itabla031 UNIQUE
  );

CREATE TABLE Tabla04
 (empno INT CONSTRAINT Itabla04 PRIMARY KEY,
  nombre NVARCHAR(15),
  profesion NVARCHAR(19),
  fechaalta DATE,
  salario DECIMAL(10,2),
  num_segsocial INT CONSTRAINT Itabla041 UNIQUE NONCLUSTERED
  );

CREATE TABLE estados   
(codigo INT CONSTRAINT pk_estados PRIMARY KEY,
 Descripcion NVARCHAR(10) NOT NULL
 );
  CREATE TABLE empleados  
  (emplnum INT CONSTRAINT pk_ejemplo8 PRIMARY KEY,
   nombre NVARCHAR(10) NOT NULL,
   profesion NVARCHAR(9) CONSTRAINT nn_profe8 NOT NULL,
   fechaalta DATE CONSTRAINT df_fechaalta8 DEFAULT '01/01/2018',
   salario DECIMAL(10,2) CONSTRAINT ck_salario8  CHECK(salario>15000),
   num_segsocial INT CONSTRAINT uk_ejemplo8_ss UNIQUE,
   cod_estado INT NOT NULL,
   CONSTRAINT fejemplo7 FOREIGN KEY (cod_estado)
   REFERENCES estados(codigo) ON DELETE CASCADE
  );
