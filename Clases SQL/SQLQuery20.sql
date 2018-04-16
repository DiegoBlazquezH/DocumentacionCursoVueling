USE TutorialDB
go
--Declaración del cursor y las variables
DECLARE c_ART CURSOR FOR SELECT codigo_art, CODIGO_CAT, precioUnitario
FROM ARTICULOS ORDER BY CODIGO_CAT, precioUnitario DESC
DECLARE @cpt int;
DECLARE @ref nchar(16);
DECLARE @cate int;
DECLARE @precio numeric(10,2);
DECLARE @catref int;
OPEN c_ART;	-- se abre el cursor
FETCH c_ART INTO @ref, @cate, @precio;	-- recorremos el primer registro
WHILE (@@FETCH_STATUS=0) BEGIN -- El último Fetch, ¿ha recorrido algún registro?
	INSERT INTO tempoArt VALUES(@ref, @cate, @precio);
	SELECT @catref=@cate;	-- memorizar la categoría
	SELECT @cpt=1;
	FETCH c_ART INTO @ref, @cate, @precio;	-- registro siguiente
	WHILE (@@FETCH_STATUS=0 AND @catref=@cate) BEGIN
		IF (@cpt<3) BEGIN
			INSERT INTO tempoArt VALUES(@ref, @cate, @precio);
			SELECT @cpt=@cpt+1;	
		END;
		FETCH c_ART INTO @ref, @cate, @precio;	-- registro siguiente
	END;
END;
CLOSE c_ART; -- cerramos Cursos.
DEALLOCATE c_ART; -- Liberá la estructura de datos que compone el cursos.
go
