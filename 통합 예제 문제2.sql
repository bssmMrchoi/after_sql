use employee;

# 1. 부서코드가 ‘D1001’과 ‘D2001’에 해당하는 직원들의 직원명과 입사일을 입사일이 빠른 순서대로 출력하라.(단, 입사일은 연,월,일까지만 출력되어야 한다.)- to_char()
select EName, StartDate from tEmployee where DNumber in ('D1001', 'D2001') order by StartDate;
# 2. 제품 별로 생산량 최저, 최고, 총, 평균을 구하라. (min(), max(), sum(), avg())
select min(PCount), max(PCount), sum(PCount), avg(PCount) from tProduction group by INumber;
# 3. 생산량 조정을 위해 2020년 2월의 총 생산량을 알려고 한다. 해당 월에 생산된 제품들의 코드와 해당 제품들의 총 생산량을 출력하시오. (총 생산량의 오름차순 출력) - sum()
select PNumber, PCount from tProduction where Pdate > '2020-02-01' and Pdate < '2020-03-01' group by  PNumber;
# 4. 가구류 제품들의 선호도 조사를 위하여 고객들이 가구류 제품들의 주문을 몇 번 했는지 고객코드별로 출력하시오. (가구류의 생산코드는 P2~로 시작한다)
select count(*) from tOrder where PNumber like ('P2%') group by CNumber;
# 5. 제품별 최저 생산량이 1000 이상인 제품의 제품번호와 최저 생산량을 출력하시오.
select INumber, min(PCount) from tProduction group by INumber having min(PCount) >= 1000;
# 6. 2020년 1월의 성실직원을 뽑기 위해 성실직원의 기준인 생산량 500개 이상을 달성한 인원들의 직원코드와 총 생산량을 출력하시오.(총 생산량 내림차순)
select ENumber, sum(PCount) from tProduction where PCount >= 500 and pDate like '2020-01%' group by eNumber order by sum(PCount) desc;
# 7. 고객별 거래 빈도를 파악하고자 한다. 주문을 2번 이상 한 고객들의 고객번호와 주문 횟수를 구하시오. (고객번호 오름차순 정렬)
select CNumber, count(PNumber) from tOrder group by CNumber having count(PNumber) >= 2 order by CNumber;
# 8. 직원별 업무 성과 분석을 위해 직원 코드별 총 생산량을 집계하려고 한다. 각 직원의 직원코드와 총 생산량을 출력하되, 총 생산량이 많은 순서대로 정렬하시오.
select eNumber, sum(PCount) from tProduction group by eNumber order by sum(PCount) desc;
# 9. 각 반품 사유별로 얼마나 많은 반품이 발생했는지 파악하고자 한다. 반품사유코드별 반품 건수와 총 반품 수량을 출력하시오.
select RRNumber, count(*), sum(RCount) from tReturn group by RRNumber;
# 10. 고가 제품 위주로 정리를 위해 단가가 1000원 이상인 제품들만 선별한 뒤, 제품군(제품번호 앞 2자리 기준)별 평균 단가를 출력하시오.
select substr(INumber, 1, 2), avg(Price) from tItem where Price>=1000 group by substr(INumber, 1 2);
# 11. 제품별 생산 안정성을 평가하기 위해 각 제품의 최소 생산량을 조사하려고 한다. 최소 생산량이 100 이상인 제품의 제품번호와 최소 생산량을 출력하시오.
select INumber, min(PCount) from tProduction group by INumber having min(PCount) >= 100;
# 12. 2020년 5월 이후 생산된 제품 중 총 생산량이 500 이상인 제품을 선별하려고 한다. 제품번호와 총 생산량을 출력하되, 총 생산량이 높은 순으로 정렬하시오.
select INumber, sum(PCount) from tProduction where PDate>=500 group by INumber having sum(PCount) >= 500 order by sum(PCount) desc;
# 13. 부서별 인사 현황을 파악하기 위해 각 부서의 인원수를 조사하려고 한다. 소속 부서가 있는 직원들을 대상으로 부서코드별 직원 수를 구하되, 직원 수가 5명 이상인 부서만 출력하시오.
select DNumber, count(*) from tEmployee group by DNumber having count(*)>=5;
# 14. 2020년 3월 한 달 동안의 직원별 생산 활동을 분석하려고 한다. 직원 코드별 생산 건수와 평균 생산량을 출력하시오. 평균 생산량이 높은 순서대로 정렬하시오.
select ENumber, count(*), avg(PCount) from tProduction where Pdate like '2020-03%' group by ENumber order by avg(PCount) desc;
# 15. 주문별 반품 현황을 확인하고자 한다. 총 반품 수량이 500 이상인 주문에 대해 주문번호와 총 반품 수량을 출력하시오. 반품 수량이 많은 순으로 정렬하시오.
select ONumber, sum(RCount) from tReturn group by ONumber having sum(RCount) >= 500 order by sum(RCount) desc;
# 16. 생산 건수가 많은 제품을 선별하고자 한다. 제품번호별 생산 건수를 구하되, 생산 건수가 3건 이상인 제품만 출력하시오. (제품번호 오름차순 정렬)
select INumber, sum(PCount) from tProduction group by INumber having sum(PCount)>=3 order by INumber desc;

## 서브쿼리

# 1. 생산량이 가장 많은 제품의 제품코드와 생산량을 출력하라.(*단일행 서브쿼리*)
select PNumber, PCount from tProduction where PCount = (select max(PCount) from tProduction);
# 2. 평균 생산량보다 많은 생산 수량을 기록한 생산기록의 제품코드, 수량을 출력하라.(*스칼라 서브쿼리*)
select INumber, PCount from tProduction where PCount > (select avg(PCount) from tProduction);
# 3. 2020년 이후 입사한 직원 중 부서명이 ‘전자기기생산부’인 직원의 이름을 출력하라.(*IN + 서브쿼리*)
select EName from tEmployee where StartDate >= '2020-01-01' and DNumber in (select DNumber from tDepartment where DName = '전자기기생산부');
# 4. 최소 단가를 가진 제품의 이름과 단가를 출력하라.(*서브쿼리 활용*)
select INumber, Price from tItem where Price = (select min(Price) from tItem);
# 5. 반품 수량이 500 이상인 반품 건에 대해 해당 반품 건의 주문일자를 출력하라.(*반품 → 주문 → 날짜)*
select RDate from tReturn where RCount >= 500;
# 6. 생산기록이 없는 제품의 이름을 출력하라.(*NOT EXISTS 또는 `IN` + 서브쿼리*)
select IName from tItem where not exists(select * from tProduction where tProduction.INumber = tItem.INumber);


## join
# 1. 직원 이름과 부서명을 함께 출력하되, 부서가 지정되지 않은 직원도 모두 포함하라. (*외부조인, NULL 포함*)
select tEmployee.ENumber, tDepartment.DName from tEmployee left join tDepartment on tEmployee.DNumber = tDepartment.DNumber;
# 2. 생산 테이블과 제품 테이블을 조인하여 생산일자와 함께 생산된 제품의 이름과 수량을 출력하라.
select tProduction.PDate,tItem.IName, tProduction.PCount from tItem join tProduction on tItem.INumber = tProduction.INumber;
# 3. 주문 테이블과 고객 테이블을 조인하여 고객의 이름과 각 주문일자를 출력하라.
select tCustomer.CName, tOrder.ODate from tOrder join tCustomer on tOrder.CNumber = tCustomer.CNumber;
# 4. 반품 테이블과 반품사유 테이블을 조인하여 반품번호, 반품일자, 반품사유를 출력하라.
select tReturn.RNumber, tReturn.RDate, tReturnReason.RReason from tReturn join tReturnReason on tReturn.RRNumber = tReturn.RRNumber;
# 5. 생산 테이블과 직원 테이블을 조인하여, 각 생산기록에 대해 직원명과 생산수량을 함께 출력하라.
select tProduction.PNumber, tEmployee.ENumber, tProduction.PCount from tProduction join tEmployee on tProduction.ENumber = tEmployee.ENumber;
# 6. 생산 테이블, 직원 테이블, 부서 테이블을 조인하여 각 생산기록에 대해 부서명, 직원명, 제품코드를 출력하라.
select tDepartment.DName, tEmployee.EName, tProduction.INumber from tProduction join tEmployee on tProduction.ENumber = tEmployee.ENumber join tDepartment  on tEmployee.DNumber = tDepartment.DNumber;
# 7. 고객이 주문한 제품명과 고객명을 출력하되, 제품명은 `tItem`에서, 고객명은 `tCustomer`에서 조회되도록 조인하라.
select tItem.IName, tCustomer.CName from tItem join tProduction on tItem.INumber = tProduction.INumber join tOrder on tProduction.PNumber = tOrder.PNumber join tCustomer on tOrder.CNumber = tCustomer.CNumber;
# 8. 반품이 발생한 주문 건에 대해 고객명, 제품명, 반품수량을 출력하라.
select tCustomer.CName, tItem.IName, tReturn.RCount from tCustomer join tOrder on tCustomer.CNumber = tOrder.CNumber join tProduction on tOrder.PNumber = tProduction.PNumber join tItem on tProduction.INumber = tItem.INumber join tReturn on tOrder.ONumber = tReturn.ONumber;
# 9. 직원이 소속된 부서명과 직급명을 각각 조인하여, 직원명과 함께 출력하라.(*2개의 테이블 조인*)
select tDepartment.DName, tRank.RName, tEmployee.EName from tDepartment join tEmployee on tDepartment.DNumber = tEmployee.DNumber join tRank on tEmployee.RNumber = tRank.RNumber;
# 10. 주문이 한 번도 없는 고객도 포함하여 고객명과 주문건수를 출력하라.(*LEFT JOIN + GROUP BY + COUNT*)
select tCustomer.CName, count(*) from tCustomer left join tOrder on tCustomer.CNumber = tOrder.CNumber group by tCustomer.CName;
