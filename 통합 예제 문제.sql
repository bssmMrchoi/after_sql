use employee;

select * from tDepartment;
select ENumber, RNumber, EName, StartDate from tEmployee;
select distinct RNumber from tEmployee;
select ENumber, INumber from tProduction where PCount >= 500;
select DName from tDepartment where DNumber = "D4001";
select IName, Price from tItem where not (price >= 500 and price <=1000);
select RNumber, EName, EAddr, StartDate from tEmployee where StartDate<'2010-05-01' order by (StartDate);
select EName, DNumber from tEmployee where DNumber in('D2001','D4001') order by (EName) desc;
select EName, DNumber, StartDate from tEmployee where DNumber in('D2001','D4001') and StartDate<'2010-05-01';
select EName, RNumber from tEmployee where DNumber is null;
select EName, ERRN from tEmployee where ERRN like '9%';
select EName, ERRN from tEmployee where ERRN like '_3%';
select EName, EAddr from tEmployee where DNumber='D4001' and RNUmber='R0001';
select IName, Price from tItem where Price between 500 and 1500 and INumber in ('I1001', 'I1002', 'I1003');
select RNumber, RDate from tReturn where RCount >= 100 and RRNumber in ('RR0001','RR0002');
select EName, RNumber, EAddr from tEmployee where RNumber in ('R0001', 'R0002', 'R0003') and DNumber not in ('D1001');