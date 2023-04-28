SELECT TOP(30) 
PriDx AS primarydx, 
CONVERT(date, DOA, 101) AS doa,  
CONVERT(date, DOD, 101) AS dod,
CONVERT(date, DOB, 101) AS dob,
PStatus AS patient_status,
PatAge AS patient_age,
PatSex AS patient_sex,
Race AS patient_race,
Ethnicity AS patient_ethnicity,
YEAR(dod) as discharge_year, 
patZIP AS patient_zip,
HCUP_PDx_CCS AS hcup_pdx_ccs_code,
DRG_code AS drg_code,
MDC_code AS mdc_code,
CAST(LStay AS int) AS patient_length_stay,
CAST(totchrgs AS numeric) AS total_charges
FROM phi.[DD-21-002_InPat_CCDPH_2010-2020]
WHERE YEAR(dod) >= 2016;

/*
SELECT
COUNT(PriDx) AS n_primarydx
FROM phi.[DD-21-002_InPat_CCDPH_2010-2020]
ORDER BY primarydx;
*/