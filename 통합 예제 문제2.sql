use study_sql;
#group by, 집계함수 등 16개 문제
#1. 부서코드가 ‘D1001’과 ‘D2001’에 해당하는 직원들의 직원명과 입사일을 입사일이 빠른 순서대로 출력하라.(단, 입사일은 연,월,일까지만 출력되어야 한다.)- to_char()
SELECT EName, DATE_FORMAT(StartDate, '%Y/%m/%d') FROM tEmployee ORDER BY StartDate;
#2. 제품 별로 생산량 최저, 최고, 총, 평균을 구하라. (min(), max(), sum(), avg())
SELECT min(PCount), max(PCount), sum(PCount), avg(PCount) FROM tProduction group by INumber;
#3. 생산량 조정을 위해 2020년 2월의 총 생산량을 알려고 한다. 해당 월에 생산된 제품들의 코드와 해당 제품들의 총 생산량을 출력하시오. (총 생산량의 오름차순 출력) - sum()
SELECT INumber, sum(PCount) FROM tProduction WHERE DATE_FORMAT(PDate, '%Y/%m') = '2020/02' group by INumber ORDER BY sum(PCount);
#4. 가구류 제품들의 선호도 조사를 위하여 고객들이 가구류 제품들의 주문을 몇 번 했는지 고객코드별로 출력하시오. (가구류의 생산코드는 P2~로 시작한다)
SELECT CNumber, count(*) FROM tOrder WHERE PNumber LIKE 'P2%' group by CNumber;
#5. 제품별 최저 생산량이 1000 이상인 제품의 제품번호와 최저 생산량을 출력하시오.
SELECT INumber, min(PCount) FROM tProduction group by INumber having min(PCount) >= 1000;
#6. 2020년 1월의 성실직원을 뽑기 위해 성실직원의 기준인 생산량 500개 이상을 달성한 인원들의 직원코드와 총 생산량을 출력하시오.(총 생산량 내림차순)
SELECT ENumber, sum(PCount) FROM tProduction WHERE PCount >= 500 group by ENumber order by sum(PCount) desc;
#7. 고객별 거래 빈도를 파악하고자 한다. 주문을 2번 이상 한 고객들의 고객번호와 주문 횟수를 구하시오. (고객번호 오름차순 정렬)
SELECT CNumber, COUNT(*) FROM tOrder group by CNumber having COUNT(*) >= 2 order by CNumber;
#8. 직원별 업무 성과 분석을 위해 직원 코드별 총 생산량을 집계하려고 한다. 각 직원의 직원코드와 총 생산량을 출력하되, 총 생산량이 많은 순서대로 정렬하시오.
SELECT ENumber, sum(PCount) FROM tProduction group by ENumber order by sum(PCount) desc;
#9. 각 반품 사유별로 얼마나 많은 반품이 발생했는지 파악하고자 한다. 반품사유코드별 반품 건수와 총 반품 수량을 출력하시오.
SELECT RRNumber, count(*), sum(RCount) FROM tReturn group by RRNumber;
#10. 고가 제품 위주로 정리를 위해 단가가 1000원 이상인 제품들만 선별한 뒤, 제품군(제품번호 앞 2자리 기준)별 평균 단가를 출력하시오.
SELECT LEFT(INumber, 2), avg(Price) FROM tItem WHERE Price >= 1000 group by LEFT(INumber, 2);
#11. 제품별 생산 안정성을 평가하기 위해 각 제품의 최소 생산량을 조사하려고 한다. 최소 생산량이 100 이상인 제품의 제품번호와 최소 생산량을 출력하시오.
SELECT INumber, min(PCount) FROM tProduction group by INumber having min(PCount) >= 100;
#12. 2020년 5월 이후 생산된 제품 중 총 생산량이 500 이상인 제품을 선별하려고 한다. 제품번호와 총 생산량을 출력하되, 총 생산량이 높은 순으로 정렬하시오.
SELECT INumber, sum(PCount) FROM tProduction WHERE PCount >= 500 AND DATE_FORMAT(PDate, '%Y/%m') >= '2020/05' group by INumber order by sum(PCount) desc;
#13. 부서별 인사 현황을 파악하기 위해 각 부서의 인원수를 조사하려고 한다. 소속 부서가 있는 직원들을 대상으로 부서코드별 직원 수를 구하되, 직원 수가 5명 이상인 부서만 출력하시오.
SELECT DNumber, count(*) FROM tEmployee group by DNumber having count(*) >= 5;
#14. 2020년 3월 한 달 동안의 직원별 생산 활동을 분석하려고 한다. 직원 코드별 생산 건수와 평균 생산량을 출력하시오. 평균 생산량이 높은 순서대로 정렬하시오.
SELECT ENumber, avg(PCount) FROM tProduction WHERE DATE_FORMAT(PDate, '%Y/%m') = '2020/03' group by ENumber order by avg(PCount) desc;
#15. 주문별 반품 현황을 확인하고자 한다. 총 반품 수량이 500 이상인 주문에 대해 주문번호와 총 반품 수량을 출력하시오. 반품 수량이 많은 순으로 정렬하시오.
SELECT ONumber, sum(RCount) FROM tReturn group by ONumber having sum(RCount) >= 500 order by sum(RCount) desc;
#16. 생산 건수가 많은 제품을 선별하고자 한다. 제품번호별 생산 건수를 구하되, 생산 건수가 3건 이상인 제품만 출력하시오. (제품번호 오름차순 정렬)
SELECT INumber, COUNT(*) FROM tProduction group by INumber having COUNT(*) >= 3 order by INumber;