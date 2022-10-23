select regiondescription, firstname, lastname, max(birthdate)
from employee as E, employeeterritory, territory as T, region as R
where R.id = regionid and T.id = territoryid and employeeid = E.id
group by regiondescription
order by R.id