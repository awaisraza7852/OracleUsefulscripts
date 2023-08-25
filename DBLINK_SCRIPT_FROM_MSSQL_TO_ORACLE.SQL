/*** this requires OraOLEDB.Oracle o be installed on server hosting SQL database.
/*** MSSQL server and Oracle server should be on same nework.
/*** You can restrict access from Oracle database for that user.
USE [master]
GO

/*** Object:  LinkedServer [<SCHEMA_NAME>]    Script Date: 7/19/2023 7:12:30 PM ***/
EXEC master.dbo.sp_addlinkedserver @server = N'<SCHEMA_NAME>', @srvproduct=N'Oracle', @provider=N'OraOLEDB.Oracle', @datasrc=N'10.228.111.13:1521/<SCHEMA_NAME>'
 / For security reasons the linked server remote logins password is changed with ######## /
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'<SCHEMA_NAME>',@useself=N'False',@locallogin=NULL,@rmtuser=N'<USERNAME>',@rmtpassword='<PASSWORD>'

GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'collation compatible', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'<SCHEMA_NAME>', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
