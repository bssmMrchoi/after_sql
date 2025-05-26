use employee;

select * from tDepartment;

select Enumber, Rnumber, Ename, startDate from tEmployee;

select distinct Rnumber from tEmployee;

select Enumber, INumber from tProduction where PCount>=500;

select DName from tDepartment where DNumber like 'D4001';

select IName, Price from tItem where price not between 500 and 1000;

select RNumber, Ename, Eaddr, StartDate from tEmployee where StartDate<'2010-05-01' order by StartDate;

select EName, DNumber from tEmployee where DNumber in ('D2001','D4001') order by Ename desc;

select EName, DNumber, StartDate from tEmployee where DNumber in ('D2001','D4001') and StartDate<'2010-05-01';

select Ename, RNumber from tEmployee where Dnumber is null;

select Ename,ERRN from tEmployee where ERRN like '9%';

select Ename,ERRN from tEmployee where ERRN like '_3%';

select EName,EAddr from tEmployee where DNumber like 'D4001' and RNumber like 'R0001';

select IName,Price from tItem where Price between 500 and 1500 and  INumber in ('I1001','I1002','I1003');

select RRNumber, RDate from tReturn where RCount>=100 and RRNumber in ('RR0001','RR0002');

select EName, RNumber, EAddr from tEmployee where RNumber in ('R0001','R0002','R0003') and DNumber not like 'D1001';