use employee;


select INumber, PCount from tProduction where PCount = (select max(PCount) from tProduction);
select INumber, PCount from tProduction where PCount > (select avg(PCount) from tProduction);
select EName from tEmployee where StartDate>='2020-01-01' and DNumber in (select DNumber from tDepartment where DName='전자기기생산부');
select IName, Price from tItem where Price = (select min(Price) from tItem);
select RDate from tReturn where RCount>=500;
select IName from tItem where not exists(select * from tProduction where tProduction.INumber=tItem.INumber);



select tEmployee.EName, tDepartment.DName from tEmployee left join tDepartment on tEmployee.DNumber = tDepartment.DNumber;
select tProduction.PDate, tItem.IName, tProduction.PCount from  tProduction join tItem on tProduction.INumber = tItem.INumber;
select tCustomer.CName, tOrder.ODate from tCustomer join tOrder on tCustomer.CNumber = tOrder.CNumber;
select tReturn.RRNumber, tReturn.RDate, tReturnReason.RReason from tReturn join tReturnReason on tReturn.RRNumber = tReturnReason.RRNumber;
select tEmployee.EName, tProduction.PCount from tEmployee join tProduction on tEmployee.ENumber = tProduction.ENumber;
select tDepartment.DName, tEmployee.EName, tProduction.INumber from tProduction join tEmployee on tProduction.ENumber = tEmployee.ENumber join tDepartment  on tEmployee.DNumber = tDepartment.DNumber;
select tItem.IName, tCustomer.CName from tItem join tProduction on tItem.INumber = tProduction.INumber join tOrder on tProduction.PNumber = tOrder.PNumber join tCustomer on tOrder.CNumber = tCustomer.CNumber;
select tCustomer.CName, tItem.IName, tReturn.RCount from tCustomer join tOrder on tCustomer.CNumber = tOrder.CNumber join tProduction on tOrder.PNumber = tProduction.PNumber join tItem on tProduction.INumber = tItem.INumber join tReturn on tOrder.ONumber = tReturn.ONumber;
select tDepartment.DName, tRank.RName, tEmployee.EName from tDepartment join tEmployee on tDepartment.DNumber = tEmployee.DNumber join tRank on tEmployee.RNumber = tRank.RNumber;
select tCustomer.CName, count(*) from tCustomer left join tOrder on tCustomer.CNumber = tOrder.CNumber group by tCustomer.CName;


