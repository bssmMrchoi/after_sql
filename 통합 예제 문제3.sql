use employee

select EName, DName
from tEmployee E
left join tDepartment D Oon E.DNumber = D.DNumber;


select PDate, IName, PCount
from tProduction P
join tItem I on P.INumber = I.INumber;

select CName, ODate
from tOrder O
join tCustomer C on O.CNumber = C.CNumber;

select RNumber, RDate, RReason
from tReturn R
join tReturnReason RR on R.RRNumber = RR.RRNumber;

select DName, EName, INumber
from tProduction P
join tEmployee E on P.ENumber = E.ENumber
join tDepartment D on E.DNumber = D.DNumber;

select DName, EName, INumber
from tProduction p
join tEmployee e on p.ENumber = e.ENumber
join tDepartment d on e.DNumber = d.DNumber;

select CName, IName
from tOrder o
join tCustomer c on o.CNumber=c.CNumber
join tProduction p on o.PNumber=p.PNumber
join tItem i on p.INumber=i.INumber

select CName, IName, RCount
 from tReturn r
 join

select EName, DName, RName
from tEmployee e
join tDepartment d on e.DNumber = d.DNumber
join tRank r on e.RNumber = r.RNumber;

select CName, COUNT(ONumber)
from tCustomer c
left join tOrder o on c.CNumber = o.CNumber
group by c.CName;
