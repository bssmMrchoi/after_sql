use employee;

# 1. 부서 테이블의 모든 데이터를 출력하라.
select * from employee.tDepartment;
# 2. 직원 테이블에서 각 직원의 직원코드, 직급코드, 이름, 입사일을 출력하라.
select tEmployee.ENumber, tEmployee.RNumber, tEmployee.EName ,tEmployee.StartDate from employee.tEmployee;
# 3. 직원 테이블에서 직급코드를 출력하되, 각 항목이 중복되지 않게 출력하라.
select distinct(tEmployee.RNumber) from employee.tEmployee;
# 4. 생산량이 500 이상인 생산의 직원코드와 제품코드를 출력하라.
select tEmployee.ENumber, PNumber from employee.tProduction join employee.tEmployee on tProduction.ENumber = tEmployee.ENumber where PCount >= 500;
# 5. 부서코드가 ‘D4001’인 부서의 부서명을 출력하라.
select tDepartment.DName from employee.tDepartment where DNumber = 'D4001';
# 6. 단가가 500이상 1000이하의 범위에 속하지 않는 모든 제품의 제품명과 단가를 출력하라.
select tItem.IName, tItem.Price from employee.tItem where 500 > Price or Price > 1000;
# 7. 2010-05-01 이전에 입사한 직원의 직급코드, 이름, 주소, 입사일 출력하되, 입사일을 기준으로 오름차순으로 정렬하라. - to_date(’2010-05-01’)
select RNumber, EName, EAddr, StartDate from employee.tEmployee where StartDate < DATE('2010-05-01') order by StartDate asc ;
# 8. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원의 이름과 부서 코드를 출력하되, 이름을 기준으로 내림차순으로 정렬하라.(desc)
select tEmployee.EName, tEmployee.DNumber from employee.tEmployee where DNumber = 'D2001' or DNumber = 'D4001' order by EName desc ;
# 9. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원 중 입사일이 ‘2010-05-01’ 이전에 입사한 직원의 이름과 부서 코드, 입사일을 출력하라.
select tEmployee.EName, tEmployee.DNumber, StartDate from employee.tEmployee where (DNumber = 'D2001' or DNumber = 'D4001') and StartDate < DATE('2010-05-01');
# 10. 부서 코드가 없는 직원의 이름과 직급코드를 출력하라.
select tEmployee.EName, tEmployee.RNumber from employee.tEmployee where DNumber is NULL;
# 11. ERRN의 첫 번째 문자가 ‘9’인 모든 사원의 이름과 ERRN을 출력하라.
select tEmployee.EName from employee.tEmployee where ERRN like "9%";
# 12. ERRN의 두 번째 문자가 ‘3’인 모든 사원의 이름과 ERRN을 출력하라.
select tEmployee.EName from employee.tEmployee where ERRN like "_3%";
# 13. 테이블에서 부서코드가 'D4001'이고, 직급코드가 'R0001'인 직원들의 이름과 주소를 출력하라.
select tEmployee.EName, tEmployee.EAddr from employee.tEmployee where DNumber like 'D4001' and RNumber like 'R1001';
# 14. 이블에서 단가가 500 이상이고 1500 이하인 제품 중에서, 제품코드가 'I1001', 'I1002', 'I1003' 중 하나인 제품의 이름과 단가를 출력하라.
select tItem.IName, tItem.Price from employee.tItem where (INumber = 'I1001' or INumber = 'I1002' or INumber = 'I1003') and Price >= 500;
# 15. 테이블에서 반품 수량이 100 이상이고, 반품 사유 코드(RRNumber)가 'RR0001' 또는 'RR0002'인 반품의 반품번호와 반품일자를 출력하라.
select tReturn.RNumber, tReturn.RDate from employee.tReturn where (RRNumber = 'RR0001' or RRNumber = 'RR0002') and RCount >= 100;
# 16. 직급코드가 R0001, R0002, R0003 이고, 부서코드가 D1001이 아닌 직원의 이름, 직급코드, 주소를 출력하라.
select tEmployee.ENumber, tEmployee.RNumber, tEmployee.EAddr from employee.tEmployee where (RNumber = 'R0001' or RNumber = 'R0002' or RNumber = 'R0003') and DNumber not like 'D1001';

# 1. 부서코드가 ‘D1001’과 ‘D2001’에 해당하는 직원들의 직원명과 입사일을 입사일이 빠른 순서대로 출력하라.(단, 입사일은 연,월,일까지만 출력되어야 한다.)- to_char()
select EName, DATE_FORMAT(StartDate, '%Y-%m-%d') from employee.tEmployee where DNumber = 'D1001' or DNumber = 'D2001' order by StartDate;
# 2. 제품 별로 생산량 최저, 최고, 총, 평균을 구하라. (min(), max(), sum(), avg())
select min(PCount) as "최저", max(PCount) as "최고", sum(PCount) as "총", avg(PCount) as "평균" from employee.tProduction;
# 3. 생산량 조정을 위해 2020년 2월의 총 생산량을 알려고 한다. 해당 월에 생산된 제품들의 코드와 해당 제품들의 총 생산량을 출력하시오. (총 생산량의 오름차순 출력) - sum()
select * from employee.tProduction where date(PDate);
# 4. 가구류 제품들의 선호도 조사를 위하여 고객들이 가구류 제품들의 주문을 몇 번 했는지 고객코드별로 출력하시오. (가구류의 생산코드는 P2~로 시작한다)
# 5. 제품별 최저 생산량이 1000 이상인 제품의 제품번호와 최저 생산량을 출력하시오.
# 6. 2020년 1월의 성실직원을 뽑기 위해 성실직원의 기준인 생산량 500개 이상을 달성한 인원들의 직원코드와 총 생산량을 출력하시오.(총 생산량 내림차순)
# 7. 고객별 거래 빈도를 파악하고자 한다. 주문을 2번 이상 한 고객들의 고객번호와 주문 횟수를 구하시오. (고객번호 오름차순 정렬)
# 8. 직원별 업무 성과 분석을 위해 직원 코드별 총 생산량을 집계하려고 한다. 각 직원의 직원코드와 총 생산량을 출력하되, 총 생산량이 많은 순서대로 정렬하시오.
# 9. 각 반품 사유별로 얼마나 많은 반품이 발생했는지 파악하고자 한다. 반품사유코드별 반품 건수와 총 반품 수량을 출력하시오.
# 10. 고가 제품 위주로 정리를 위해 단가가 1000원 이상인 제품들만 선별한 뒤, 제품군(제품번호 앞 2자리 기준)별 평균 단가를 출력하시오.
# 11. 제품별 생산 안정성을 평가하기 위해 각 제품의 최소 생산량을 조사하려고 한다. 최소 생산량이 100 이상인 제품의 제품번호와 최소 생산량을 출력하시오.
# 12. 2020년 5월 이후 생산된 제품 중 총 생산량이 500 이상인 제품을 선별하려고 한다. 제품번호와 총 생산량을 출력하되, 총 생산량이 높은 순으로 정렬하시오.
# 13. 부서별 인사 현황을 파악하기 위해 각 부서의 인원수를 조사하려고 한다. 소속 부서가 있는 직원들을 대상으로 부서코드별 직원 수를 구하되, 직원 수가 5명 이상인 부서만 출력하시오.
# 14. 2020년 3월 한 달 동안의 직원별 생산 활동을 분석하려고 한다. 직원 코드별 생산 건수와 평균 생산량을 출력하시오. 평균 생산량이 높은 순서대로 정렬하시오.
# 15. 주문별 반품 현황을 확인하고자 한다. 총 반품 수량이 500 이상인 주문에 대해 주문번호와 총 반품 수량을 출력하시오. 반품 수량이 많은 순으로 정렬하시오.
# 16. 생산 건수가 많은 제품을 선별하고자 한다. 제품번호별 생산 건수를 구하되, 생산 건수가 3건 이상인 제품만 출력하시오. (제품번호 오름차순 정렬)

