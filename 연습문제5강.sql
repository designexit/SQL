-- 1)
select *
from emp 
where ename like ('%S');

select empno, ename, job, sal, deptno
from emp 
where deptno = 30 and job='SALESMAN';

select empno, ename, sal, deptno
from emp
where deptno in (20, 30)
and sal > 2000;

select *
from emp
where sal >= 2000 or sal <=3000;

select ename, empno, sal, deptno
from emp
where deptno = 30
and ename like ('%E%')
and sal not between 1000 and 2000;

select *
from emp
where comm is null;



select *
from emp;