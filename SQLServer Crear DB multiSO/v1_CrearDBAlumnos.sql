USE master;
GO

IF DB_ID(N'AlumnosDB') IS NOT NULL
	PRINT('La DB ya existe, borrándola')
	DROP DATABASE AlumnosDB 

PRINT('Creando DB')
DECLARE @os as nvarchar(200)
DECLARE @separator as nchar(1)
DECLARE @basedirectory as nvarchar(300)

-- Get current OS
SET @os = (SELECT @@VERSION)
--PRINT(@os)
IF CHARINDEX('Windows',@os) != 0
BEGIN
	SET @os = 'Windows'
	SET @separator = '\'
	-- Set Configurations to use xp_cmdshell
	EXEC sp_configure 'SHOW ADVANCED OPTIONS', 1
	RECONFIGURE
	EXEC sp_configure 'xp_cmdshell', 1
	RECONFIGURE
	EXEC sp_configure 'SHOW ADVANCED OPTIONS', 0
	RECONFIGURE
	-- Get value of SQLServerDB (the initial path for the DB files)
	CREATE TABLE #temptable (ruta nvarchar(100))
	INSERT #temptable EXEC xp_cmdshell 'echo %SQLServerDB%'
	SET @basedirectory = (SELECT TOP(1) ruta from #temptable)
	DROP TABLE #temptable
	-- Reset Configurations
	EXEC sp_configure 'SHOW ADVANCED OPTIONS', 1
	RECONFIGURE
	EXEC sp_configure 'xp_cmdshell', 0
	RECONFIGURE
	EXEC sp_configure 'SHOW ADVANCED OPTIONS', 0
	RECONFIGURE
END
IF CHARINDEX('LINUX',@os) != 0
BEGIN
	SET @os = 'Linux'
	SET @separator = '/'
	SET @basedirectory = '$(SQLServerDB)'
END

-- Declare the filenames
DECLARE @primaryfilename as nvarchar(50)
SET @primaryfilename = N'AlumnosDB_Prm.mdf'
DECLARE @fg1dat1filename as nvarchar(50)
SET @fg1dat1filename = N'AlumnosDB_FG1_1.ndf'
DECLARE @fg1dat2filename as nvarchar(50)
SET @fg1dat2filename = N'AlumnosDB_FG1_2.ndf'
DECLARE @logfilename as nvarchar(50)
SET @logfilename = N'AlumnosDBLogs.ldf'

-- Declare the SQL sentence
DECLARE @sql as nvarchar(1000)
SET @sql = 'CREATE DATABASE AlumnosDB
		  ON PRIMARY
			( NAME='''+@primaryfilename+''',
			  FILENAME='''+@basedirectory+@separator+@primaryfilename+''',
			  SIZE=4MB,
			  MAXSIZE=10MB,
			  FILEGROWTH=1MB),
		  FILEGROUP AlumnosDB_FG1
			( NAME='''+@fg1dat1filename+''',
			  FILENAME='''+@basedirectory+@separator+@fg1dat1filename+''',
			  SIZE=1MB,
			  MAXSIZE=10MB,
			  FILEGROWTH=1MB),
			( NAME='''+@fg1dat2filename+''',
			  FILENAME='''+@basedirectory+@separator+@fg1dat2filename+''',
			  SIZE=1MB,
			  MAXSIZE=10MB,
			  FILEGROWTH=1MB)
		  LOG ON
			( NAME='''+@logfilename+''',
			  FILENAME='''+@basedirectory+@separator+@logfilename+''',
			  SIZE=1MB,
			  MAXSIZE=10MB,
			  FILEGROWTH=1MB);
			  '
-- Print for debugging and execution
--PRINT(@sql)
EXEC(@sql)