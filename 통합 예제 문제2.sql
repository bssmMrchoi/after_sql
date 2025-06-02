use study_sql;

-- 1. 부서코드가 ‘D1001’과 ‘D2001’인 직원들의 이름과 입사일을 입사일 빠른 순서대로 출력
SELECT EName, DATE_FORMAT(StartDate, '%Y-%m-%d') AS StartDate
FROM tEmployee
WHERE DNumber IN ('D1001', 'D2001')
ORDER BY StartDate ASC;


-- 2. 제품 별로 생산량의 최저, 최고, 총, 평균 출력
SELECT INumber, MIN(PCount), MAX(PCount), SUM(PCount), AVG(PCount)
FROM tProduction
GROUP BY INumber;


-- 3. 2020년 2월의 제품 코드와 총 생산량을 출력 (총 생산량 오름차순)
SELECT INumber, SUM(PCount)
FROM tProduction
WHERE PDate >= '2020-02-01' AND PDate < '2020-03-01'
GROUP BY INumber
ORDER BY SUM(PCount) ASC;


-- 4. 가구류 제품(P2~)에 대해 고객코드별 주문 횟수 출력
SELECT COUNT(*)
FROM `tOrder`
WHERE PNUMBER
LIKE 'P2%'
GROUP BY `CNumber`;

-- 5. 제품별 최저 생산량이 1000 이상인 제품의 제품번호와 최저 생산량 출력
SELECT INumber , MIN(PCount)
FROM tProduction
GROUP BY INumber
HAVING MIN(PCount) >= 1000;

-- 6. 2020년 1월에 생산량 500 이상인 직원의 코드와 총 생산량 출력 (내림차순)
SELECT ENumber , SUM(PCount)
FROM tProduction
WHERE PDate >= '2020-01-01' AND PDate < '2020-02-01'
GROUP BY ENumber
HAVING SUM(PCount) >= 500
ORDER BY SUM(PCount) DESC;

-- 7. 주문을 2번 이상 한 고객의 고객번호와 주문 횟수 출력 (오름차순 정렬)
SELECT CNumber, COUNT(*)
FROM tOrder
GROUP BY CNumber
HAVING COUNT(*) >= 2
ORDER BY `CNumber` ASC;

-- 8. 직원별 총 생산량 출력 (총 생산량 내림차순 정렬)
SELECT ENumber, SUM(PCount)
FROM tProduction
GROUP BY ENumber
ORDER BY SUM(`PCount`) DESC;

-- 9. 반품사유코드별 반품 건수 및 총 반품 수량 출력
SELECT RRNumber, COUNT(*), SUM(RCount)
FROM tReturn
GROUP BY RRNumber;

-- 10. 단가 1000원 이상인 제품 중 제품군(앞 2자리)별 평균 단가 출력
SELECT LEFT(INumber, 2), AVG(Price)
FROM tItem
WHERE Price >= 1000
GROUP BY LEFT(INumber, 2);

-- 11. 최소 생산량이 100 이상인 제품의 제품번호와 최소 생산량 출력
SELECT INumber, MIN(PCount)
FROM tProduction
GROUP BY INumber
HAVING MIN(`PCount`) >= 100;

-- 12. 2020년 5월 이후 생산된 제품 중 총 생산량이 500 이상인 제품 출력 (총 생산량 내림차순)
SELECT INumber , SUM(PCount)
FROM tProduction
WHERE PDate >= '2020-05-01'
GROUP BY INumber
HAVING SUM(`PCount`) >= 500
ORDER BY SUM(`PCount`) DESC;

-- 13. 부서코드별 직원 수 출력 (5명 이상 부서만 출력)
SELECT DNumber, COUNT(*)
FROM tEmployee
WHERE DNumber IS NOT NULL
GROUP BY DNumber
HAVING COUNT(*) >= 5;

-- 14. 2020년 3월 직원별 생산 건수와 평균 생산량 출력 (평균 생산량 내림차순)
SELECT ENumber, COUNT(*), AVG(PCount)
FROM tProduction
WHERE PDate >= '2020-03-01' AND PDate < '2020-04-01'
GROUP BY ENumber
ORDER BY AVG(PCOUNT) DESC;

-- 15. 총 반품 수량이 500 이상인 주문의 주문번호와 반품 수량 출력 (내림차순)
SELECT ONumber, SUM(RCount)
FROM tReturn
GROUP BY ONumber
HAVING SUM(RCOUNT) >= 500
ORDER BY SUM(RCOUNT) DESC;


-- 16. 생산 건수가 3건 이상인 제품의 제품번호와 건수 출력 (제품번호 오름차순)
SELECT INumber, COUNT(*)
FROM tProduction
GROUP BY INumber
HAVING COUNT(*) >= 3
ORDER BY INUMBER ASC;
