/*
Coding notes:
Ctrl+K, Ctrl+C to comment
Ctrl+K, Ctrl+C to uncomment
*/

/* 
Schema used to organize datasets stored in Epi Unit CCDPH SQL Server System databases
with protected health information (e.g., epi-covid; epi-discharge; epi-ems; epi-vitals)

dbo = default "database owner" schema for raw, uncleaned datasets. used exclusively by db owners (contains phi)
phi = "protected health information" schema used for cleaned datasets (contains phi)
epi = non-suppressed aggregated "epidemiology" data (does not contain phi) 
sup = aggregated and "suppressed" data that can be disseminated more broadly (does not contain phi)
*/

--designate database
USE [epi-discharge];
USE [inter-spatial];

--Creating schemas
--view existing schemas
--SELECT * FROM sys.schemas;

--create (or drop) phi, epi, sup schema
--"CREATE SCHEMA" must be first line executed in query
--CREATE SCHEMA phi;

--Grant privileges on databases
--grant connect and select permissions on all tables in database
GRANT CONNECT, SELECT TO "CCHHS\ntnguyen";
GRANT CONNECT, SELECT TO "CCHHS\zain.qusair";
GRANT CONNECT, SELECT TO "CCHHS\mennat.gharib";
GRANT CONNECT, SELECT TO "CCHHS\stephanie.shosanya";

--grant select, insert, update, delete, references, (i.e., control), create table, alter table privileges on non-dbo schema
GRANT CREATE TABLE ON SCHEMA :: phi TO "CCHHS\ntnguyen";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: phi TO "CCHHS\zain.qusair";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: phi TO "CCHHS\mennat.gharib";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: phi TO "CCHHS\stephanie.shosanya";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: epi TO "CCHHS\ntnguyen";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: epi TO "CCHHS\zain.qusair";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: epi TO "CCHHS\mennat.gharib";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: epi TO "CCHHS\stephanie.shosanya";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: sup TO "CCHHS\ntnguyen";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: sup TO "CCHHS\zain.qusair";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: sup TO "CCHHS\mennat.gharib";
GRANT ALTER, UPDATE, INSERT, DELETE ON SCHEMA :: sup TO "CCHHS\stephanie.shosanya";

