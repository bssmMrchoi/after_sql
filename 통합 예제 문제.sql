#1번
select * from tdepartment;
#2번
select ENumber,RNumber,EName,StatDate from temployee;
#3번
select distinct RNumber from temployee;
#4번
select ENumber,INumber from tproduction where PCount>=500;
#5번
select DName from tdepartment where DNumber='D4001';
#6번
select IName,Price from titem where !(500<=Price and Price<=1000);
#7번
select RNumber,EName,EAddr,StatDate from temployee where StatDate <= '2010-05-01' order by (StatDate);
#8번
select EName,DNumber from temployee where DNumber='D2001' or DNumber='D4001' order by EName desc;
#9번
select EName,DNumber,StatDate from temployee where DNumber='D2001' and StatDate <= '2010-05-01' or DNumber='D4001' and StatDate <= '2010-05-01';
#10번
select EName,RNumber from temployee where DNumber is NULL;
#11번
select EName,ERRN from temployee where ERRN like '9%';
#12번
select EName,ERRN from temployee where ERRN like '_3%';
#13번
select EName,ERRN from temployee where DNumber='D4001' and RNumber='R0001';
#14번
select IName,Price from titem where 500<=Price and Price<=1500 and (INumber='I1001' or INumber='I1002' or INumber='I1003');
#15번
select RNumber,RDate from treturn where RCount >=100 and (RRNumber='RR0001' or RRNumber='RR0002');
#16번 문제 끝
select EName,RNumber,EAddr from temployee where (RNumber = 'R0001' or RNumber = 'R0002' or RNumber = 'R0003') and DNumber!='D1001';


