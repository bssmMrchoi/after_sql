use employee;


--1. 생산량이 가장 많은 제품의 제품코드와 생산량을 출력하라.(*단일행 서브쿼리*)
select distinct INumber,PCount
from tProduction
where PCount = (
    select max(PCount)
    from tProduction
);

--2. 평균 생산량보다 많은 생산 수량을 기록한 생산기록의 제품코드, 수량을 출력하라.(*스칼라 서브쿼리*)
select distinct INumber,PCount from tProduction
where PCount > (
    select avg(PCount)
    from tProduction
);

--3. 2020년 이후 입사한 직원 중 부서명이 ‘전자기기생산부’인 직원의 이름을 출력하라.(*IN + 서브쿼리*)
select distinct EName
from tEmployee
where StartDate like 2020 =(
    select EName
    from tDepartment
    where DName like '전자기기생산부'
);

--4. 최소 단가를 가진 제품의 이름과 단가를 출력하라.(*서브쿼리 활용*)
select distinct IName,Price
from tItem where price = (
    select min(Price)
    from tItem
);

--5. 반품 수량이 500 이상인 반품 건에 대해 해당 반품 건의 주문일자를 출력하라.(*반품 → 주문 → 날짜)*
select distinct RDate
from tReturn where RCount >= 500;

--6. 생산기록이 없는 제품의 이름을 출력하라.(*NOT EXISTS 또는 `IN` + 서브쿼리*)
select distinct IName
from tItem
where INumber in (
    select IName
    from tProduction
    where  not exists INumber
);

--1. 직원 이름과 부서명을 함께 출력하되, 부서가 지정되지 않은 직원도 모두 포함하라. (*외부조인, NULL 포함*)
select distinct EName,DName from tEmployee e left join tDepartment t on  e.DNumber = t.`DNumber`

--2. 생산 테이블과 제품 테이블을 조인하여 생산일자와 함께 생산된 제품의 이름과 수량을 출력하라.
select distinct PDate,IName,PCount from tProduction t join tItem i on t.INumber = i.INumber

--3. 주문 테이블과 고객 테이블을 조인하여 고객의 이름과 각 주문일자를 출력하라.
select distinct CName,ODate from tCustomer o join tOrder c on o.CNumber = c.CNumber

--4. 반품 테이블과 반품사유 테이블을 조인하여 반품번호, 반품일자, 반품사유를 출력하라.
select distinct RNumber,RDate,RReason from tReturnReason r join tReturn t on r.RRNumber = t.RRNumber

--5. 생산 테이블과 직원 테이블을 조인하여, 각 생산기록에 대해 직원명과 생산수량을 함께 출력하라.
select EName,PCount from tProduction t join tEmployee e on t.ENumber = e.ENumber

--6. 생산 테이블, 직원 테이블, 부서 테이블을 조인하여 각 생산기록에 대해 부서명, 직원명, 제품코드를 출력하라.
select DName,EName,INumber from tEmployee e join tDepartment d on e.DNumber=d.DNumber
join tProduction p on e.ENumber=p.ENumber

--7. 고객이 주문한 제품명과 고객명을 출력하되, 제품명은 `tItem`에서, 고객명은 `tCustomer`에서 조회되도록 조인하라.
select IName,CName from tItem i join tProduction p on i.INumber=p.INumber
join tOrder o on o.PNumber = p.PNumber join tCustomer c on c.CNumber = o.CNumber

--8. 반품이 발생한 주문 건에 대해 고객명, 제품명, 반품수량을 출력하라.
select CName,IName,RCount from tItem i join tProduction p on i.INumber = p.INumber
join tOrder o on o.PNumber = p.PNumber join tCustomer c on c.CNumber = o.CNumber
join tReturn r on r.ONumber = o.ONumber

--9. 직원이 소속된 부서명과 직급명을 각각 조인하여, 직원명과 함께 출력하라.(*2개의 테이블 조인*)
select DName,RName,EName from tEmployee e join tDepartment d on e.DNumber = d.DNumber
join tRank r on r.RNumber = e.RNumber

--10. 주문이 한 번도 없는 고객도 포함하여 고객명과 주문건수를 출력하라.(*LEFT JOIN + GROUP BY + COUNT*)
select CName,count(ONumber)  from tCustomer c left join tOrder o on c.CNumber = o.CNumber
group by CName