USE [epi-discharge];

CREATE SCHEMA ref;

ALTER SCHEMA raw TRANSFER [dbo].[DD-21-002_InPat_CCDPH_2010-2020];
ALTER SCHEMA raw TRANSFER [dbo].[DD-21-002_OutPat_CCDPH_2010-2020];

ALTER SCHEMA ref TRANSFER [epi].[dxccsr_codes_latest];
ALTER SCHEMA ref TRANSFER [epi].[icd10cm_groups_latest];
ALTER SCHEMA ref TRANSFER [epi].[mdc_drg_groups_latest];

--ALTER SCHEMA dbo TRANSFER [phi].[DD-21-002_OutPat_CCDPH_2010-2020];

--ALTER SCHEMA epi TRANSFER [dbo].[dxccsr_codes_latest];
--ALTER SCHEMA epi TRANSFER [dbo].[icd10cm_groups_latest];
--ALTER SCHEMA epi TRANSFER [dbo].[mdc_drg_groups_latest];

SELECT * FROM [epi].[icd10cm_groups_latest];


