USE TutorialDB
CREATE TABLE TABLA02
       (coddepar INT NOT NULL,
        codiarea INT NOT NULL,
        nemplead INT NOT NULL,
        salarioe decimal(10,2) NOT NULL,
        CONSTRAINT pk_ekjemplo3 PRIMARY KEY (coddepar,codiarea)        
       );
