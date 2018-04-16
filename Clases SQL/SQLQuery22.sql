CREATE PROCEDURE supp_cli(@numerocli int) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM CLIENTES WHERE numero=@numerocli)
	BEGIN
		PRINT 'Este cliente no existe';
		RETURN;
	END;
	IF EXISTS(SELECT * FROM PEDIDOS WHERE numero_cli=@numerocli)
	BEGIN
		PRINT 'Este cliente tiene pedidos';
		RETURN;
	END;
	DELETE FROM CLIENTES WHERE numero=@numerocli;
END;
GO

exec supp_cli 24