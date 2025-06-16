# use study_sql;
#
# --## 서브쿼리
# --
# --1. 생산량이 가장 많은 제품의 제품코드와 생산량을 출력하라.(*단일행 서브쿼리*)
SELECT inumber, pcount
FROM tProduction
WHERE pcount in (select pcount FROM tProduction);
#
# --2. 평균 생산량보다 많은 생산 수량을 기록한 생산기록의 제품코드, 수량을 출력하라.(*스칼라 서브쿼리*)
SELECT `INumber`, `PCount`
FROM `tProduction`
WHERE `PCount` > (SELECT AVG(`PCount`) FROM tProduction);

# --3. 2020년 이후 입사한 직원 중 부서명이 ‘전자기기생산부’인 직원의 이름을 출력하라.(*IN + 서브쿼리*)
SELECT Ename
FROM tEmployee
WHERE startdate >= '2020-01-01'
  AND dnumber IN (
      SELECT dnumber
      FROM tDepartment
      WHERE dname = '전자기기생산부'
  );

# --4. 최소 단가를 가진 제품의 이름과 단가를 출력하라.(*서브쿼리 활용*)
SELECT IName, Price
FROM tItem
WHERE Price = (SELECT MIN(Price) FROM tItem);

# --5. 반품 수량이 500 이상인 반품 건에 대해 해당 반품 건의 주문일자를 출력하라.(*반품 → 주문 → 날짜)*
SELECT odate
FROM tOrder o
WHERE EXISTS (
    SELECT 1
    FROM tReturn r
    WHERE r.onumber = o.onumber AND r.rcount >= 500
);


# --6. 생산기록이 없는 제품의 이름을 출력하라.(*NOT EXISTS 또는 `IN` + 서브쿼리*)
SELECT iname
FROM tItem i
WHERE NOT EXISTS (
    SELECT 1
    FROM tProduction p
    WHERE p.inumber = i.inumber
);

# --
# --## 조인
# --1. 직원 이름과 부서명을 함께 출력하되, 부서가 지정되지 않은 직원도 모두 포함하라. (*외부조인, NULL 포함*)
SELECT e.ename, d.dname
FROM tEmployee e
LEFT JOIN tDepartment d ON e.dnumber = d.dnumber;

# --2. 생산 테이블과 제품 테이블을 조인하여 생산일자와 함께 생산된 제품의 이름과 수량을 출력하라.
SELECT p.pdate, i.iname, p.pcount
FROM tProduction p
JOIN tItem i ON p.inumber = i.inumber;

# --3. 주문 테이블과 고객 테이블을 조인하여 고객의 이름과 각 주문일자를 출력하라.
SELECT c.cname, o.odate
FROM tOrder o
JOIN tCustomer c ON o.cnumber = c.cnumber;

# --4. 반품 테이블과 반품사유 테이블을 조인하여 반품번호, 반품일자, 반품사유를 출력하라.
SELECT r.rnumber, r.rdate, rr.rreason
FROM tReturn r
JOIN tReturnReason rr ON r.rrnumber = rr.rrnumber;

# --5. 생산 테이블과 직원 테이블을 조인하여, 각 생산기록에 대해 직원명과 생산수량을 함께 출력하라.
SELECT e.ename, p.pcount
FROM tProduction p
JOIN tEmployee e ON p.enumber = e.enumber;

# --6. 생산 테이블, 직원 테이블, 부서 테이블을 조인하여 각 생산기록에 대해 부서명, 직원명, 제품코드를 출력하라.
SELECT d.dname, e.ename, p.inumber
FROM tProduction p
JOIN tEmployee e ON p.enumber = e.enumber
JOIN tDepartment d ON e.dnumber = d.dnumber;

# --7. 고객이 주문한 제품명과 고객명을 출력하되, 제품명은 `tItem`에서, 고객명은 `tCustomer`에서 조회되도록 조인하라.
SELECT i.iname, c.cname
FROM tOrder o
JOIN tItem i ON o.inumber = i.inumber
JOIN tCustomer c ON o.cnumber = c.cnumber;

# --8. 반품이 발생한 주문 건에 대해 고객명, 제품명, 반품수량을 출력하라.
SELECT CName, IName, RCount
FROM tOrder o
JOIN tCustomer c ON o.CNumber = c.CNumber
JOIN tProduction p ON p.PNumber = o.PNumber
JOIN tReturn r ON r.ONumber = o.ONumber
JOIN tItem i ON i.INumber = p.INumber;

# --9. 직원이 소속된 부서명과 직급명을 각각 조인하여, 직원명과 함께 출력하라.(*2개의 테이블 조인*)
SELECT DName, RName, EName
FROM tEmployee e
JOIN tDepartment d on e.DNumber = d.DNumber
JOIN tRank r on e.RNumber = r.RNumber;
# --10. 주문이 한 번도 없는 고객도 포함하여 고객명과 주문건수를 출력하라.(*LEFT JOIN + GROUP BY + COUNT*)
SELECT CName, count(*)
FROM tCustomer c
LEFT JOIN tOrder o on o.CNumber = c.CNumber
GROUP BY CName;