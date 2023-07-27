-- 연습문제
SELECT *
FROM emp;

-- 문제1)
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

-- 문제2)
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

-- 문제3)
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- 문제4)
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';

-- 문제5)
SELECT *
FROM emp
WHERE job != 'MANAGER';
-- 같음 : WHERE job <> 'MANAGER';

-- 문제6)
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

-- 문제7)
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

-- 문제8)
SELECT *
FROM emp
WHERE deptno >= 20;

-- 문제9) !!!
SELECT *
FROM emp
-- 틀림 : WHERE ename > 'K%' AND ename != 'K%';
WHERE ename >= 'L'; -- 쌤풀이

-- 문제10)
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

-- 문제11)
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

-- 문제12)
SELECT ename, sal, deptno
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/09';

-- 문제13)
SELECT ename, job, sal
FROM emp
WHERE sal > 1600 and sal < 3000;

-- 문제14)CHECK
SELECT *
FROM emp
-- WHERE NOT(empno between 7654 and 7782);
WHERE empno < 7654 OR empno > 7782; -- 쌤풀이

-- 문제15)CHECK
SELECT *
FROM emp
WHERE ename between 'B' AND 'J';

SELECT *
FROM emp
WHERE ename >= 'B' AND ename <= 'J'; -- 쌤풀이

-- 문제16) CHECK
SELECT *
FROM emp
WHERE NOT(hiredate Like '81%');
-- 쌤풀이
SELECT *
FROM emp
WHERE NOT(hiredate >= '81/01/01' AND hiredate <='81/12/31');

-- 문제17)
SELECT *
FROM emp
-- WHERE job = 'MANAGER' or job = 'SALESMAN';
WHERE job IN('MANAGER','SALESMAN');

-- 문제18)
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);

-- 문제19)
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

-- 문제20)CHECK
SELECT *
FROM emp
-- WHERE hiredate Like '81%';
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31'; -- 쌤풀이

-- 문제21)
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- 문제22)
SELECT *
FROM emp
-- WHERE ename LIKE '%M_____' AND ename LIKE '_____N';
WHERE ename LIKE 'M____N'; -- 쌤풀이

-- 문제23)
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- 문제24)
SELECT *
FROM emp
WHERE comm IS NULL;

-- 문제25)
SELECT *
FROM emp
WHERE comm IS NOT NULL;

-- 문제26)
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 and sal >= 1500;

-- 문제27)
SELECT empno, ename, deptno
FROM emp
WHERE ename = '%K' OR deptno = 30;

-- 문제28)
SELECT *
FROM emp
WHERE sal >=1500 and deptno = 30 and job = 'MANAGER';

-- 문제29)
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno;

-- 문제30)
SELECT *
FROM emp
ORDER BY sal DESC;

-- 문제31)
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 문제32)
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

-- 문제33)
SELECT ename, sal, 
    DECODE(deptno, '10', ROUND(sal*0.13)) BONUS, deptno
FROM emp
WHERE deptno = 10;  

SELECT ename, sal, ROUND(sal*0.13) BONUS, deptno -- 쌤풀이
FROM emp
WHERE deptno = 10;

-- 문제34)
SELECT ename, sal, NVL(comm, 0), NVL2(comm, comm+sal, sal) TOTAL
FROM emp
ORDER BY TOTAL DESC;
-- 쌤풀이
SELECT ename, sal, NVL(comm, 0), SAL+NVL(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

-- 문제35)!!!!!!!
SELECT ename, sal, ROUND(sal)
    DECODE()
FROM emp;
-- 쌤풀이
SELECT ename, sal, TO_CHAR(ROUND(SAL*0.15,1), '$999.0') 회비
FROM emp
WHERE SAL BETWEEN 1500 AND 3000;

-- 문제36)!!!!!!!
SELECT d.dname, COUNT(*)
FROM emp e JOIN dept d
    ON e.deptno = d.deptno
group by d.dname
having count(e.empno) > 5;
    
-- 문제37)   
SELECT job, SUM(sal)
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;   

-- 문제38)!!!!!!
SELECT empno, ename, sal, grade
FROM emp e
JOIN SALGRADE s
ON e.sal BETWEEN s.LOSAL AND s.HISAL ;  

-- 문제39) 
SELECT deptno, count(*), count(comm)
FROM emp
GROUP BY deptno;

-- 문제40) 
SELECT ename, deptno, 
    CASE WHEN deptno = 10 THEN '총무부'
         WHEN deptno = 20 THEN '개발부'
         WHEN deptno = 30 THEN '영업부'
    END 부서명
FROM emp;

SELECT ename, deptno, 
    DECODE(deptno, 10, '총무부',
                   20, '개발부',
                   30, '영업부'   
    ) 부서명
FROM emp;



