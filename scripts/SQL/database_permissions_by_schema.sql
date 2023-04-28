/* 
Schema used to organize datasets stored in Epi Unit CCDPH SQL Server System databases
with protected health information (i.e., epi-covid; epi-discharge; epi-ems; epi-vitals)

dbo = default "database owner" schema for raw, uncleaned datasets. used exclusively by db owners (contains phi)
phi = "protected health information" schema used for cleaned datasets (contains phi)
epi = non-suppressed aggregated "epidemiology" data (does not contain phi) 
sup = aggregated and "suppressed" data that can be disseminated more broadly (does not contain phi)

*/

*/ Qusair, Zain <zain.qusair@cookcountyhealth.org>
*/ Gharib, Mennat <mennat.gharib@cookcountyhealth.org>
*/ Shosanya, Stephanie <stephanie.shosanya@cookcountyhealth.org>
*/ Nguyen, Nhan <ntnguyen@cookcountyhhs.org>


/* specify database to be transformed */ 
USE [epi-discharge];

/* create schema */ 
CREATE SCHEMA epi;
CREATE SCHEMA phi;
CREATE SCHEMA sup;

/* copy table */
SELECT * INTO dbo.[DD-21-002_InPat_CCDPH_2010-2020_test] FROM dbo.[DD-21-002_InPat_CCDPH_2010-2020];

/* transfer/change table to a different schema */
ALTER SCHEMA phi TRANSFER dbo.[DD-21-002_InPat_CCDPH_2010-2020];

/* grant/deny select permissions on tables in specific schema */
GRANT SELECT ON SCHEMA :: dbo TO "CCHHS\ntnguyen";
DENY SELECT ON SCHEMA :: dbo TO "CCHHS\ntnguyen";

/* grant/deny select permissions on particular tables */
GRANT SELECT ON phi.[DD-21-002_InPat_CCDPH_2010-2020] TO "CCHHS\zain.qusair";
DENY SELECT ON phi.[DD-21-002_InPat_CCDPH_2010-2020] TO "CCHHS\ntnguyen";

/* grant/deny select permissions on particular table, columns */
GRANT SELECT ON dbo.[births_scc_2003_raw](BCERT_NO,REC_CODE,SEX) TO "CCHHS\ntnguyen";
DENY SELECT ON dbo.[births_scc_2003_raw](BCERT_NO,REC_CODE,SEX) TO "CCHHS\ntnguyen";