SELECT 
company.CompanyID as C_CompanyID,
Company.name AS C_CompanyName,
Company.clientcode AS C_CompanyClientCode,
Company.town AS C_CompanyTown,
Company.county AS C_CompanyCounty,
Company.country AS C_CompanyCountry,
Company.postcode AS C_CompanyPostcode,
(SELECT name FROM pears.companystatus WHERE companystatusid = company.status ) AS C_CompanyStatus,
(SELECT descrip FROM pears.vacancyclass WHERE classcode = company.source ) AS C_CompanySource,
(SELECT name FROM pears.division WHERE divisionid = company.divisionid ) AS C_CompanyDivision
FROM pears.company
