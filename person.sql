SELECT 
Person.PersonID as P_PersonID,
Person.name AS P_PersonName,
Person.town AS P_PersonTown,
Person.county AS P_PersonCounty,
Person.country AS P_PersonCountry,
Person.postcode AS P_PersonPostcode,
Person.PayrollNumber as P_PersonPayrollNumber,
Person.Forenames as P_PersonForenames,
Person.Surname as P_PersonSurname,
Person.Appnumber as P_PersonRegistrationNumber,
Person.registrationdate as P_PersonRegistrationDate,
(SELECT name FROM pears.status WHERE status = person.status AND status.type = 'P' ) AS P_PersonStatus,
(select userid from pears.staff where staffid=person.staffid) as P_PersonConsultant
FROM pears.person
WHERE person.status <> 'L'
