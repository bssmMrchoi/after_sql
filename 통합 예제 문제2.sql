use employee;


select Ename,StartDate from tEmployee where DNumber in ('D1001','D2001') order by StartDate;
select min(PCount),max(PCount),sum(PCount),avg(PCount) from tProduction group by INumber;
select INumber,sum(PCount) from tProduction where PDate>='2020-02-01' and  PDate<'2020-03-01' group by INumber;
select CNumber,count(*) from tOrder group by CNumber;
select INumber,min(PCount) from tProduction group by INumber having min(PCount)>=1000;
select ENumber,sum(PCount) from tProduction where PDate>='2020-01-01' and  PDate<'2020-02-01'group by ENumber having sum(PCount)>=500 order by sum(PCount) desc;
select CNumber,count(*) from tOrder group by CNumber having count(*)>=2 order by CNumber;
select ENumber,sum(PCount) from tProduction group by ENumber order by sum(PCount) desc;
select RRNumber,count(*),sum(Rcount) from tReturn group by RRNumber;
select avg(Price) from tItem where Price >=1000 group by LEFT(INumber, 2);
select INumber,min(PCount) from tProduction group by INumber having min(PCount)>=100;
select INumber,sum(PCount) from tProduction where PDate>='2020-05-01' group by INumber having sum(PCount)>=500 order by sum(Pcount) desc;
select DNumber,count(*) from tEmployee where DNumber is not null group by DNumber having count(*)>=5;
select ENumber,count(*),avg(PCount) from tProduction where PDate>='2020-03-01' and  PDate<'2020-04-01' order by avg(PCount) desc;
select ONumber,sum(RCount) from tReturn group by ONumber having sum(RCount)>=500 order by sum(RCount) desc;
select INumber,count(*) from tProduction group by INumber having count(*)>=3 order by INumber;  
