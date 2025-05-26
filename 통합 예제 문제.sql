use study_sql;

#1. 부서 테이블의 모든 데이터를 출력하라.
SELECT * from tDepartment;
#2. 직원 테이블에서 각 직원의 직원코드, 직급코드, 이름, 입사일을 출력하라.
SELECT ENumber, RNumber, EName, StartDate from tEmployee;
#3. 직원 테이블에서 직급코드를 출력하되, 각 항목이 중복되지 않게 출력하라.
SELECT DISTINCT RNumber from tEmployee;
#4. 생산량이 500 이상인 생산의 직원코드와 제품코드를 출력하라.
SELECT ENumber, INumber FROM tProduction WHERE PCount >= 500;
#5. 부서코드가 ‘D4001’인 부서의 부서명을 출력하라.
SELECT DName FROM tDepartment WHERE DNumber = 'D4001';
#6. 단가가 500이상 1000이하의 범위에 속하지 않는 모든 제품의 제품명과 단가를 출력하라.
SELECT IName, Price FROM tItem WHERE NOT (Price >= 500 AND Price <= 1000);
#7. 2010-05-01 이전에 입사한 직원의 직급코드, 이름, 주소, 입사일 출력하되, 입사일을 기준으로 오름차순으로 정렬하라. - to_date(’2010-05-01’)
SELECT RNumber, EName, EAddr, StartDate FROM tEmployee WHERE StartDate < STR_TO_DATE('2010-05-01','%Y-%m-%d') ORDER BY StartDate;
#8. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원의 이름과 부서 코드를 출력하되, 이름을 기준으로 내림차순으로 정렬하라.(desc)
SELECT EName, DNumber FROM tEmployee WHERE DNumber = 'D2001' OR DNumber = 'D4001' ORDER BY EName desc;
#9. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원 중 입사일이 ‘2010-05-01’ 이전에 입사한 직원의 이름과 부서 코드, 입사일을 출력하라.
SELECT EName, DNumber, StartDate FROM tEmployee WHERE StartDate < STR_TO_DATE('2010-05-01','%Y-%m-%d') AND (DNumber = 'D2001' OR DNumber = 'D4001');
#10. 부서 코드가 없는 직원의 이름과 직급코드를 출력하라.
SELECT EName, RNumber FROM tEmployee WHERE DNumber IS NULL;
#11. ERRN의 첫 번째 문자가 ‘9’인 모든 사원의 이름과 ERRN을 출력하라.
SELECT EName, ERRN FROM tEmployee WHERE ERRN like "9%";
#12. ERRN의 두 번째 문자가 ‘3’인 모든 사원의 이름과 ERRN을 출력하라.
SELECT EName, ERRN FROM tEmployee WHERE ERRN like "_3%";
#13. 테이블에서 부서코드가 'D4001'이고, 직급코드가 'R0001'인 직원들의 이름과 주소를 출력하라.
SELECT EName, EAddr FROM tEmployee WHERE DNumber = 'D4001' AND RNumber = 'R0001';
#14. 이블에서 단가가 500 이상이고 1500 이하인 제품 중에서, 제품코드가 'I1001', 'I1002', 'I1003' 중 하나인 제품의 이름과 단가를 출력하라.
SELECT IName, Price FROM tItem WHERE (Price >= 500 AND Price <= 1500) AND (INumber = 'I1001' OR INumber = 'I1002' OR INumber = 'I1003');
#15. 테이블에서 반품 수량이 100 이상이고, 반품 사유 코드(RRNumber)가 'RR0001' 또는 'RR0002'인 반품의 반품번호와 반품일자를 출력하라.
SELECT RNumber, RDate FROM tReturn WHERE RCount >= 100 and (RRNumber = 'RR0001' OR RRNumber = 'RR0002');
#16. 직급코드가 R0001, R0002, R0003 이고, 부서코드가 D1001이 아닌 직원의 이름, 직급코드, 주소를 출력하라.
SELECT EName, RNumber, EAddr FROM tEmployee WHERE (RNumber = 'R0001' OR RNumber = 'R0002' OR RNumber = 'R0003') AND NOT DNumber = 'D1001';