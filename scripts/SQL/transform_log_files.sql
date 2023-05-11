USE [epi-discharge];  
GO  
-- Truncate the log by changing the database recovery model to SIMPLE.  
ALTER DATABASE [epi-discharge]
SET RECOVERY SIMPLE;  
GO  
-- Shrink the truncated log file to 50 MB.  
DBCC SHRINKFILE (hospdis_log, 50);  
GO  
-- Reset the database recovery model.  
ALTER DATABASE [epi-discharge]
SET RECOVERY FULL;  
GO 

-- TRUNCATE TRANSACTION LOG --
DBCC SHRINKFILE(hospdis_log, 1)
BACKUP LOG [epi-discharge] WITH TRUNCATE_ONLY
DBCC SHRINKFILE(hospdis_log, 1)
GO


USE [epi-discharge]
GO
ALTER DATABASE [epi-discharge] ADD LOG FILE ( NAME = N'hospdis_log', FILENAME = N'hospdis_log.ldf')
GO