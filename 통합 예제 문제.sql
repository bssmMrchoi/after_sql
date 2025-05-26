use employee;

select * from tdepartment

select ENumber, RNumber, EName, StartDate from temployee

SELECT DISTINCT RNumber FROM temployee;

SELECT ENumber, INumber FROM tproduction WHERE PCount >= 500;

SELECT DName FROM tdepartment WHERE DNumber = 'D4001';

SELECT IName, Price FROM titem WHERE Price < 500 OR Price > 1000;

SELECT ENumber, EName, EAddr, StartDate
FROM temployee
WHERE StartDate < ResignationDate
ORDER BY StartDate ASC;

SELECT EName, DNumber
FROM temployee
WHERE DNumber = 'D2001' or DNumber = 'D4001'
ORDER BY EName DESC;

SELECT EName, DNumber, StartDate
FROM temployee
WHERE DNumber IN ('D2001', 'D4001')
  AND StartDate < ResignationDate('2010-05-01', 'YYYY-MM-DD');

SELECT EName, RNumber
FROM temployee
WHERE DNumber IS NULL;

SELECT EName, ERRN
FROM temployee
WHERE SUBSTR(ERRN, 1, 1) = '9';

SELECT EName, ERRN
FROM temployee
WHERE SUBSTR(ERRN, 2, 1) = '3';

SELECT EName, EAddr
FROM temployee
WHERE DNumber = 'D4001' AND RNumber = 'R0001';

SELECT IName, Price
FROM titem
WHERE Price BETWEEN 500 AND 1500
  AND INumber IN ('I1001', 'I1002', 'I1003');

SELECT RNumber, RDate
FROM treturn
WHERE RCount >= 100
  AND RRNumber = 'RR0001' or RRNumber = 'RR0002';

SELECT EName, RNumber, EAddr
FROM temployee
WHERE RNumber IN ('R0001', 'R0002', 'R0003')
  AND (RNumber IS NULL OR DNumber <> 'D1001');
