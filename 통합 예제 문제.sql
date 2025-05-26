USE example;


CREATE TABLE tEmployee (
    ENumber VARCHAR(255) PRIMARY KEY,
    DNumber VARCHAR(255),
    RNumber VARCHAR(255),

    EName VARCHAR(255),
    ERRN VARCHAR(255),
    EAddr VARCHAR(255),
    StartDate DATETIME,
    ResignationDate DATETIME,
    FOREIGN KEY (DNumber) REFERENCES tDepartment(DNumber),
    FOREIGN KEY (RNumber) REFERENCES tRank(RNumber)
);



CREATE TABLE tProduction (
    PNumber VARCHAR(255) PRIMARY KEY ,
    ENumber VARCHAR(255),
    INumber VARCHAR(255),
    PCount INT,
    PDate DATETIME,
    FOREIGN KEY (ENumber) REFERENCES tEmployee(ENumber),
    FOREIGN KEY (INumber) REFERENCES tItem(INumber)
);



CREATE TABLE tOrder (
    ONumber VARCHAR(255) PRIMARY KEY,
    CNumber VARCHAR(255),
    PNumber VARCHAR(255),
    ODate DATETIME,
    FOREIGN KEY (PNumber) REFERENCES tProduction(PNumber),
    FOREIGN KEY (CNumber) REFERENCES tCustomer(CNumber)
);

CREATE TABLE tReturn (
    RNumber VARCHAR(255) PRIMARY KEY,
    ONumber VARCHAR(255),
    RCount INT,
    RRNumber VARCHAR(255),
    RDate DATETIME,
    FOREIGN KEY (RRNumber) REFERENCES tReturnReason(RRNumber),
    FOREIGN KEY (ONumber) REFERENCES tOrder(ONumber)
);



CREATE TABLE tCustomer (
    CNumber VARCHAR(255) PRIMARY KEY,
    CName VARCHAR(255),
    CAddr VARCHAR(255),
    ContractDate DATETIME
);



CREATE TABLE tItem (
    INumber VARCHAR(255) PRIMARY KEY,
    IName VARCHAR(255),
    Price INT,
    RegisterDate DATETIME
);



CREATE TABLE tReturnReason (
    RRNumber VARCHAR(255) PRIMARY KEY,
    RReason VARCHAR(255)
);



CREATE TABLE tRank (
    RNumber VARCHAR(255) PRIMARY KEY,
    RName VARCHAR(255)
);



CREATE TABLE tDepartment (
    DNumber VARCHAR(255) PRIMARY KEY,
    DName VARCHAR(255)
);


# 1. 부서 테이블의 모든 데이터를 출력하라.
select * from tDepartment;
# 2. 직원 테이블에서 각 직원의 직원코드, 직급코드, 이름, 입사일을 출력하라.
select ENumber, RNumber, EName, StartDate from tEmployee;
# 3. 직원 테이블에서 직급코드를 출력하되, 각 항목이 중복되지 않게 출력하라.
select RNumber from tEmployee group by RNumber;
# 4. 생산량이 500 이상인 생산의 직원코드와 제품코드를 출력하라.
select ENumber, INumber from tProduction where PCount>=500;
#5. 부서코드가 ‘D4001’인 부서의 부서명을 출력하라.
select DName from tDepartment where DNumber like 'D4001';
#6. 단가가 500이상 1000이하의 범위에 속하지 않는 모든 제품의 제품명과 단가를 출력하라.
select IName, Price from tItem where Price<500 or Price>1000;
#7. 2010-05-01 이전에 입사한 직원의 직급코드, 이름, 주소, 입사일 출력하되, 입사일을 기준으로 오름차순으로 정렬하라. - to_date(’2010-05-01’)
select RNumber, EName, eAddr, StartDate from tEmployee where StartDate<'2010-05-01' order by StartDate;
#8. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원의 이름과 부서 코드를 출력하되, 이름을 기준으로 내림차순으로 정렬하라.(desc)
select EName, DNumber from tEmployee where DNumber like 'D2001' or DNumber like 'D4001' order by EName desc;
#9. 부서 코드가 ‘D2001’, ‘D4001’ 에 속하는 모든 직원 중 입사일이 ‘2010-05-01’ 이전에 입사한 직원의 이름과 부서 코드, 입사일을 출력하라.
select EName, DNumber, StartDate from tEmployee where (DNumber like 'D2001' or DNumber like 'D4001') and '2010-05-01'>StartDate;
#10. 부서 코드가 없는 직원의 이름과 직급코드를 출력하라.
select EName, RNumber from tEmployee where DNumber is null;
#11. ERRN의 첫 번째 문자가 ‘9’인 모든 사원의 이름과 ERRN을 출력하라.
select EName, ERRN from tEmployee where ERRn like '9%';
#12. ERRN의 두 번째 문자가 ‘3’인 모든 사원의 이름과 ERRN을 출력하라.
select EName, ERRN from tEmployee where ERRN like '_3%';
#13. 테이블에서 부서코드가 'D4001'이고, 직급코드가 'R0001'인 직원들의 이름과 주소를 출력하라.
select EName, EAddr from tEmployee where DNumber like 'D4001' and RNumber like 'R0001';
#14. 이블에서 단가가 500 이상이고 1500 이하인 제품 중에서, 제품코드가 'I1001', 'I1002', 'I1003' 중 하나인 제품의 이름과 단가를 출력하라.
select IName, Price from tItem where Price>=500 and INumber like 'I1001' or INumber like 'I1002' or INumber like 'I1003';
#15. 테이블에서 반품 수량이 100 이상이고, 반품 사유 코드(RRNumber)가 'RR0001' 또는 'RR0002'인 반품의 반품번호와 반품일자를 출력하라.
select RNumber, RDate from tReturn where RCount>=100 and RRNumber like 'RR0001' or RRNumber like 'RR0002';
#16. 직급코드가 R0001, R0002, R0003 이고, 부서코드가 D1001이 아닌 직원의 이름, 직급코드, 주소를 출력하라.
select EName, RNumber, EAddr from tEmployee where DNumber !='D1001' and RNumber like 'R0001' or RNumber like 'R0002' or RNumber like 'R0003';