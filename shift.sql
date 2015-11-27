SELECT 
company.CompanyID as S_CompanyID,
Company.name AS S_CompanyName,
Company.clientcode AS S_CompanyClientCode,
Company.town AS S_CompanyTown,
Company.county AS S_CompanyCounty,
Company.country AS S_CompanyCountry,
Company.postcode AS S_CompanyPostcode,
(SELECT name FROM pears.companystatus WHERE companystatusid = company.status ) AS S_CompanyStatus,
(SELECT descrip FROM pears.vacancyclass WHERE classcode = company.source ) AS S_CompanySource,
(SELECT name FROM pears.division WHERE divisionid = company.divisionid ) AS S_CompanyDivision,
CPerson.name AS S_CompanyPersonName,
person.PersonID as S_PersonID,
Person.name AS S_PersonName,
Person.town AS S_PersonTown,
Person.county AS S_PersonCounty,
Person.country AS S_PersonCountry,
Person.postcode AS S_PersonPostcode,
Person.PayrollNumber as S_PersonPayrollNumber,
Person.Forenames as S_PersonForenames,
Person.Surname as S_PersonSurname,
Person.Appnumber as S_PersonRegistrationNumber,
Person.registrationdate as S_PersonRegistrationDate,
(SELECT name FROM pears.status WHERE status = person.status AND status.type = 'P' ) AS S_PersonStatus,
(select userid from pears.staff where staffid=person.staffid) as S_PersonConsultant,
vacancy.VacancyID as S_VacancyID,
vacancy.StartDate as S_VacancyStartDate,
vacancy.FinishDate as S_VacancyEndDate,
Vacancy.Position as S_VacancyPosition,
Vacancy.TheirRef as S_VacancyTheirRef,
(select userid from pears.staff where staffid=Vacancy.staffid) as S_VacancyConsultant,
(SELECT name FROM pears.status WHERE status = vacancy.status AND status.type = 'V' ) AS S_VacancyStatus,
tempshift.tempshiftID as S_ShiftID,
(case tempshift.state 
  when 'P' then 'Provisional'
  when 'B' then 'Booked'
  when 'W' then 'Worked'
  when 'C' then 'Cancelled'
  end) as S_ShiftState,
(SELECT description FROM pears.tempshiftplan WHERE tempshiftplanid = tempshift.tempshiftplanid) AS S_ShiftDescription,
(SELECT description FROM pears.tempshifttype WHERE tempshifttypeid = tempshift.tempshifttypeid) AS S_ShiftType,
(SELECT name FROM pears.tempshiftcancelreason WHERE tempshiftcancelreasonid = tempshift.cancelreason) AS S_ShiftCancelReason,
tempshift.shiftdate as S_ShiftDate,
tempshift.timefrom as S_ShiftTimeFrom,
tempshift.timeto as S_ShiftTimeTo,
tempshift.analysiscode as S_ShiftAnalysisCode,
getshiftlength(tempshift.timefrom,tempshift.timeto,tempshift.breakminutes) as S_ShiftLengthHours,
tempshift.breakminutes as S_ShiftBreakMinutes
FROM pears.tempshift KEY JOIN (pears.person,(pears.vacancy key join pears.employment KEY JOIN ( pears.Company , pears.Person as CPerson )))