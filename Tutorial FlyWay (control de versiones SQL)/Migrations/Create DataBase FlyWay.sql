EXEC sp_configure filestream_access_level, 2  
RECONFIGURE  
USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'FlyWayDB'
)
CREATE DATABASE FlyWayDB
ON PRIMARY(
    name='FlyWayDB_Primary',
	filename='C:\DataBase\FLyWayTraining\MDF\FlyWayDB.mdf',
	size=4MB,
	maxsize=10MB,
	filegrowth=1MB),
FILEGROUP FLyWayDB_FG1
  ( NAME = 'FLyWayDB_FG1_Dat1',
    FILENAME =
       'C:\DataBase\FLyWayTraining\NDF\MyDB_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'FLyWayDB_FG1_Dat2',
    FILENAME =
       'C:\DataBase\FLyWayTraining\NDF\MyDB_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM
  ( NAME = 'FlyWayDB_FS',
    FILENAME = 'c:\DataBase\filestream1')
LOG ON(
	name=FlyWayDB_log,
	filename='C:\DataBase\FlyWayTraining\LDF\FlyWayDB_log.ldf',
	size=2MB, 
	maxsize=2MB,
	filegrowth=0MB
	)
	COLLATE modern_spanish_ci_as
GO