-- Sub Query
-- popp직원의 고용일보다 이후에 고용된 직원들
-- 단일행 sub query는 sub query의 결과가 한줄만 나와야 한다.
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( select hire_date --where 뒤의 데이터와 일치해야 함
                    from employees
                    where last_name = 'Popp');
                    
--SELECT last_name 이름, hire_date 고용일자
--FROM employees
--WHERE hire_date;

-- 집계함수 Sub Query
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = (SELECT min(salary)
                FROM employees);

-- 예제1)
select last_name 이름, salary 급여
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

-- 예제2)
select employee_id, last_name, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Bull')
and salary > (select salary 
              from employees
              where last_name = 'Bull');

-- 예제3)
select last_name, salary, manager_id
from employees
where manager_id = (select employee_id
                  from employees
                  where last_name = 'Russell');

-- 예제4)
select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Stock Manager');

-- 다중행 Sub Query
select min(salary)
from employees
group by department_id;
-- 부서별 최소급여와 같은 급여를 받는 직원들
select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
-- ANY 연산자 : 서브쿼리 결과가 하나만 참이여도 검색됨
SELECT *
FROM employees
WHERE salary < ANY
                (select salary
                from employees
                WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG0'
ORDER BY salary DESC;

-- ALL :  서브쿼리 결과가 모두 참이여야 검색됨
SELECT *
FROM employees
WHERE salary < ALL
                (select salary
                from employees
                WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG0'
ORDER BY salary DESC;
-- 예제1)
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id IN (select manager_id
                        from employees
                        where department_id = 20)
and department_id <> 20;
-- 예제2)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < any (SELECT salary
                  FROM employees
                  where job_id = 'ST_MAN');

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary
                  FROM employees
                  where job_id = 'IT_PROG');

-- Sub Query 다중열
-- 브루스와 같은 직종 및 같은 상사를 가진 직원들
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) in (select manager_id, job_id
                                FROM employees
                                where first_name = 'Bruce')
AND first_name != 'Bruce';

-- 예제)


-- 집합 연산자 (UNION, INTERSECT, MINUS)
-- UNION : 중복제거 된 합의 값 (107행+10행)=117행 -> 2개중복으로 115행
SELECT employee_id, job_id
FROM employees
union
SELECT employee_id, job_id
FROM job_history;

-- INTERSECT : 중복되는 값(교집합)
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS : A-B의 값(차집합)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

-- 예제1)
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

-- 예제2)
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

-- 예제3)
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- 예제4)
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;




