-- 1
SELECT *
FROM emp;

DESC emp;

-- 2
SELECT ename
FROM emp
where upper(ename) = 'SMITH';

-- 3
SELECT ename
FROM emp
where ename like ('____');

-- 4
SELECT job, COUNT(*)
FROM emp
union
SELECT job
FROM emp;

-- 5
SELECT empno, ename
FROM emp
where sal < all (select sal from emp
                where ename = 'MARTIN');
                
                

-- 6
SELECT empno, ename, sal
FROM emp
where sal > (select max(sal) from emp
            where deptno = 30);


-- 7
select *
from emp e join salgrade s 
on sal between losal and hisal
where deptno = 30 and grade = 3;

-- 8
ROLLBACK;

-- 9
select empno �����ȣ, ename ����̸�, sal ����, nvl(comm, 0) �߰�����, nvl2(comm, sal*12+comm, sal )
from emp
order by ename;

-- 10
select ename ����̸�, job �μ��̸�
from emp
where sal >= 3000;

select ename ����̸�, job �μ��̸�
from emp e join dept d
on e.deptno = d.deptno
where sal >= 3000;

