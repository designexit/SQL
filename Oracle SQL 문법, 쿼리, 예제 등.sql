-- 참고 사이트 : https://urakasumi.tistory.com/60 --


desc employees;

-- 1. SQL 기본 명령어
-- ### select ### --

-- ex1)
select employee_id, last_name, salary
from employees;

-- ex2)
select employee_id 사원번호, last_name 이름, salary 급여
from employees;

-- ex3)
select employee_id 사원번호, last_name 이름, salary*12 연봉
from employees;

-- ex4)
select first_name|| ' ' ||last_name 이름
from employees;

-- ### distinct : 중복제거 ### --

-- ex5)
select distinct department_id
from employees;

select distinct job_id
from employees;

-- ex6)
select last_name, hire_date, department_id
from employees
where department_id = 10 or department_id = 90;

-- ex7)
select last_name, hire_date, salary
from employees
where salary >=2500 and salary <=3500;

-- #연습문제
select last_name 사원명, to_char(salary, '$999,999,999') as "월 급", department_id 부서코드
from employees
-- where salary <= 2500 or salary > 3000
-- and department_id = 90;
where department_id = 90 and (salary <= 2500 or salary > 3000);

-- ex8)
select *
from employees
where upper(last_name) = 'KING';

select *
from employees
where low(last_name)= 'king';

select *
from employees
where initcap(last_name) = 'King';

-- ### Like : 문자를 포함 ### --

-- ex9)
select last_name, job_id, department_id
from employees
where job_id like '%MAN%';

-- ex10)
select last_name, job_id, department_id
from employees
where job_id like 'IT%';

-- ex11)
select last_name, salary, commission_pct
from employees
where commission_pct is not null;

select last_name, salary, commission_pct
from employees
where commission_pct is null;

-- ex12)
select employee_id, last_name, job_id
from employees
where job_id in ('FI_MGR', 'FI_ACCOUNT');

-- ex13)
select employee_id, last_name, salary
from employees
where salary between 10000 and 20000;

-- #연습문제
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'AD_PRES') and salary > 10000;

-- #연습문제
select distinct job_id
from employees;

-- #연습문제
select employee_id, last_name, hire_date
from employees
where hire_date between '2005/01/01' and '2005/12/31';

-- 2. 연산자

-- ex1)
select last_name, department_id, hire_date
from employees
-- order by department_id desc;
order by 2 desc; -- 2번 컬럼 기준으로 정렬

-- ex2)
select last_name, department_id, hire_date
from employees
order by department_id desc, hire_date;
-- order by 2 desc, 3 asc; 2번 컬럼 3번 컬럼 기준으로 정렬

-- #연습문제
select last_name, salary*12 연봉 
from employees
order by salary desc;

-- ### 단일행 함수 / 변환함수 ### --

-- ex1)
select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

-- ex2)
-- 나누기 후 나머지
select mod (10, 3) from dual;

-- ex3)
-- 소숫점 및 정수 반올림
select round(35765.357, 2) from dual;
select round(35765.357, 3) from dual;
select round(35765.357, 1) from dual;
select round(35765.357, 0) from dual;
select round(35765.357) from dual; -- 위와 같음
select round(35765.357, -3) from dual; -- 소수점 위로 n번째 자리 반올림

-- ex4)
-- 소숫점 및 정수 버림
select trunc(35765.357, 2) from dual;
select trunc(35765.357, 3) from dual;
select trunc(35765.357, 1) from dual;
select trunc(35765.357, 0) from dual;
select trunc(35765.357) from dual; -- 위와 같음
select trunc(35765.357, -3) from dual; -- 소수점 위로 n번째 자리 버림:0이 됨

-- 소숫점이 0이 아니면 무조건 올림
select ceil(35765.9) from dual;
select ceil(35765.1) from dual;

-- ex5)
select concat ('Good', ' Morning') from dual; -- 단어사이 띄울때 뒷 문자열 한칸 띄우기
select concat ('Hello', 'World') from dual;
select concat ('Hello', 'World'), substr('HelloWorld',2,4) from dual;
select length('HelloWorld')from dual; 
select length('Hello World')from dual; -- 글자수에 띄어쓰기 포함 됨

SELECT CONCAT('헬로우','월드!'), SUBSTR('헬로우월드',2,2), LENGTH('헬로우'),
    INSTR('헬로우','로'), TRIM('  공백  '),'  공백  '
FROM dual;

-- # 연습문제
select employee_id, last_name
from employees
where mod(employee_id, 2) = 0
order by employee_id desc;

-- length








