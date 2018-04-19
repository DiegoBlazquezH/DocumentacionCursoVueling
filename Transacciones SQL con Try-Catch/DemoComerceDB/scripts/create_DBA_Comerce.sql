USE master
EXEC sp_configure filestream_access_level, 2  
GO
RECONFIGURE  
GO
USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'ComerceDB'
)
CREATE DATABASE ComerceDB
ON PRIMARY(
    name='ComerceDB_Primary',
	filename='C:\DataBase\ComerceDB\MDF\ComerceDB.mdf',
	size=4MB,
	maxsize=10MB,
	filegrowth=1MB),
FILEGROUP ComerceDB_FG1
  ( NAME = 'ComerceDB_FG1_Dat1',
    FILENAME ='C:\DataBase\ComerceDB\NDF\ComerceDB_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'ComerceDB_FG1_Dat2',
    FILENAME ='C:\DataBase\ComerceDB\NDF\ComerceDB_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
LOG ON(
	name=ComerceDB_log,
	filename='C:\DataBase\ComerceDB\LDF\ComerceDB_log.ldf',
	size=2MB, 
	maxsize=2MB,
	filegrowth=0MB
	)
	COLLATE modern_spanish_ci_as
GO