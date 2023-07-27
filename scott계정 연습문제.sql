-- ��������
SELECT *
FROM emp;

-- ����1)
SELECT empno, ename, sal
FROM emp
WHERE deptno = 10;

-- ����2)
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

-- ����3)
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- ����4)
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';

-- ����5)
SELECT *
FROM emp
WHERE job != 'MANAGER';
-- ���� : WHERE job <> 'MANAGER';

-- ����6)
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

-- ����7)
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

-- ����8)
SELECT *
FROM emp
WHERE deptno >= 20;

-- ����9) !!!
SELECT *
FROM emp
-- Ʋ�� : WHERE ename > 'K%' AND ename != 'K%';
WHERE ename >= 'L'; -- ��Ǯ��

-- ����10)
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

-- ����11)
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

-- ����12)
SELECT ename, sal, deptno
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/09';

-- ����13)
SELECT ename, job, sal
FROM emp
WHERE sal > 1600 and sal < 3000;

-- ����14)CHECK
SELECT *
FROM emp
-- WHERE NOT(empno between 7654 and 7782);
WHERE empno < 7654 OR empno > 7782; -- ��Ǯ��

-- ����15)CHECK
SELECT *
FROM emp
WHERE ename between 'B' AND 'J';

SELECT *
FROM emp
WHERE ename >= 'B' AND ename <= 'J'; -- ��Ǯ��

-- ����16) CHECK
SELECT *
FROM emp
WHERE NOT(hiredate Like '81%');
-- ��Ǯ��
SELECT *
FROM emp
WHERE NOT(hiredate >= '81/01/01' AND hiredate <='81/12/31');

-- ����17)
SELECT *
FROM emp
-- WHERE job = 'MANAGER' or job = 'SALESMAN';
WHERE job IN('MANAGER','SALESMAN');

-- ����18)
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);

-- ����19)
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

-- ����20)CHECK
SELECT *
FROM emp
-- WHERE hiredate Like '81%';
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31'; -- ��Ǯ��

-- ����21)
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- ����22)
SELECT *
FROM emp
-- WHERE ename LIKE '%M_____' AND ename LIKE '_____N';
WHERE ename LIKE 'M____N'; -- ��Ǯ��

-- ����23)
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- ����24)
SELECT *
FROM emp
WHERE comm IS NULL;

-- ����25)
SELECT *
FROM emp
WHERE comm IS NOT NULL;

-- ����26)
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 and sal >= 1500;

-- ����27)
SELECT empno, ename, deptno
FROM emp
WHERE ename = '%K' OR deptno = 30;

-- ����28)
SELECT *
FROM emp
WHERE sal >=1500 and deptno = 30 and job = 'MANAGER';

-- ����29)
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno;

-- ����30)
SELECT *
FROM emp
ORDER BY sal DESC;

-- ����31)
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- ����32)
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

-- ����33)
SELECT ename, sal, 
    DECODE(deptno, '10', ROUND(sal*0.13)) BONUS, deptno
FROM emp
WHERE deptno = 10;  

SELECT ename, sal, ROUND(sal*0.13) BONUS, deptno -- ��Ǯ��
FROM emp
WHERE deptno = 10;

-- ����34)
SELECT ename, sal, NVL(comm, 0), NVL2(comm, comm+sal, sal) TOTAL
FROM emp
ORDER BY TOTAL DESC;
-- ��Ǯ��
SELECT ename, sal, NVL(comm, 0), SAL+NVL(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

-- ����35)!!!!!!!
SELECT ename, sal, ROUND(sal)
    DECODE()
FROM emp;
-- ��Ǯ��
SELECT ename, sal, TO_CHAR(ROUND(SAL*0.15,1), '$999.0') ȸ��
FROM emp
WHERE SAL BETWEEN 1500 AND 3000;

-- ����36)!!!!!!!
SELECT d.dname, COUNT(*)
FROM emp e JOIN dept d
    ON e.deptno = d.deptno
group by d.dname
having count(e.empno) > 5;
    
-- ����37)   
SELECT job, SUM(sal)
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;   

-- ����38)!!!!!!
SELECT empno, ename, sal, grade
FROM emp e
JOIN SALGRADE s
ON e.sal BETWEEN s.LOSAL AND s.HISAL ;  

-- ����39) 
SELECT deptno, count(*), count(comm)
FROM emp
GROUP BY deptno;

-- ����40) 
SELECT ename, deptno, 
    CASE WHEN deptno = 10 THEN '�ѹ���'
         WHEN deptno = 20 THEN '���ߺ�'
         WHEN deptno = 30 THEN '������'
    END �μ���
FROM emp;

SELECT ename, deptno, 
    DECODE(deptno, 10, '�ѹ���',
                   20, '���ߺ�',
                   30, '������'   
    ) �μ���
FROM emp;



