USE [epi-discharge];  
GO
ALTER DATABASE [epi-discharge]
SET RECOVERY SIMPLE;  
GO  
-- Shrink the truncated log file to 1 MB.  
DBCC SHRINKFILE (hospdis_log, 1);  
GO  


/*GO  
-- Truncate the log by changing the database recovery model to SIMPLE.  
ALTER DATABASE [epi-discharge]
SET RECOVERY SIMPLE;  
GO  
-- Shrink the truncated log file to 1 MB.  
DBCC SHRINKFILE (hospdis_log, 1);  
GO  
-- Reset the database recovery model.  
ALTER DATABASE [epi-discharge]
SET RECOVERY FULL;  
GO 

ALTER DATABASE [epi-discharge]
REMOVE FILE hospdis_log;
GO
*/