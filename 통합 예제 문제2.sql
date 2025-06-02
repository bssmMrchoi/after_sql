use employee;

select * from tProduction

SELECT EName, TO_CHAR(StartDate, 'YYYY-MM-DD') AS StartDate
FROM tEmployee
WHERE DNumber IN ('D1001', 'D2001')
ORDER BY StartDate;

SELECT INumber,
       MIN(PCount),
       MAX(PCount),
       SUM(PCount),
       AVG(PCount)
FROM tProduction
GROUP BY INumber;

SELECT INumber, SUM(PCount)
FROM tProduction
WHERE TO_CHAR(PDate, 'YYYY-MM') = '2020-02'
GROUP BY INumber
ORDER BY SUM(PCount);

SELECT CNumber, COUNT(*)
FROM tOrder
WHERE PNumber LIKE 'P2%'
GROUP BY CNumber;

SELECT INumber, MIN(PCount)
FROM tProduction
GROUP BY INumber
HAVING MIN(PCount) >= 1000;

SELECT ENumber, SUM(PCount)
FROM tProduction
WHERE TO_CHAR(PDate, 'YYYY-MM') = '2020-01'
GROUP BY ENumber
HAVING SUM(PCount) >= 500
ORDER BY SUM(PCount) DESC;

SELECT CNumber, COUNT(*)
FROM tOrder
GROUP BY CNumber
HAVING COUNT(*) >= 2
ORDER BY CNumber;

SELECT ENumber, SUM(PCount)
FROM tProduction
GROUP BY ENumber
ORDER BY  SUM(PCount) DESC;

SELECT RRNumber, COUNT(*), SUM(RCount)
FROM tReturn
GROUP BY RRNumber

SELECT SUBSTR(INumber, 1, 2), AVG(Price)
FROM tItem
WHERE Price >= 1000
GROUP BY SUBSTR(INumber, 1, 2);

SELECT INumber, MIN(PCount)
FROM tProduction
GROUP BY INumber
HAVING MIN(PCount) >= 100;

SELECT INumber, SUM(PCount)
FROM tProduction
WHERE PDate >= TO_CHAR('2020-05-01', 'YYYY-MM-DD')
GROUP BY INumber
HAVING SUM(PCount) >= 500
ORDER BY SUM(PCount) DESC;

SELECT DNumber, COUNT(*)
FROM tEmployee
WHERE DNumber IS NOT NULL
GROUP BY DNumber
HAVING COUNT(*) >= 5;

SELECT ENumber,
       COUNT(*),
       AVG(PCount)
FROM tProduction
WHERE TO_CHAR(PDate, 'YYYY-MM') = '2020-03'
GROUP BY ENumber
ORDER BY AVG(PCount) DESC;

SELECT ONumber, SUM(RCount)
FROM tReturn
GROUP BY ONumber
HAVING SUM(RCount) >= 500
ORDER BY SUM(RCount) DESC;

SELECT INumber, COUNT(*)
FROM tProduction
GROUP BY INumber
HAVING COUNT(*) >= 3
ORDER BY INumber;
