USE TutorialDB
-- Tabla Padre
CREATE TABLE estados   
(codigo INT CONSTRAINT pk_estados PRIMARY KEY,
 Descripción NVARCHAR(10) NOT NULL
 );
 -- Tabla Hija
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
   
