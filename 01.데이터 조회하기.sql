-- DATA 조회하기
-- select * : 모든 열 / from뒤는 테이블 이름
-- 열 이름 바꿀때 select department_id as 부서번호 (as생략 가능)
select department_id 부서번호, department_name 부서이름
from departments;

-- 산술연산 (+-*/) : 계산은 숫자 데이터로...
select last_name 이름, job_id 직종, salary 월급, salary+100 보너스월급, salary - salary*0.1 감봉
from employees;
-- DISTINCT 중복 값 제거 (똑같은 값이 있을 경우 하나만 표시됨)
select distinct job_id 직종
from employees;

SELECT distinct employee_id, job_id
from employees;
SELECT * from employees;
SELECT all job_id from employees;

-- 예제1)
select employee_id, first_name, last_name
from employees;
-- 예제2)
select first_name, salary, salary*1.1 뉴셀러리
from employees;
-- 예제3)
select employee_id 사원번호, first_name 이름, last_name 성
from employees;

-- 연결 연산자 || 문자열을 연결한다 (as 뒤에 단어에 띄어쓰기가 있으면 ""을 쓴다)
select last_name || ' is a ' || job_id as "직업 정보"
from employees;
-- 예제4)
select employee_id, first_name || ' ' || last_name name, email || '@company.com' email
from employees;

-- where 조건절
select *
from employees
where last_name = 'King'; -- 같을 경우 = / 데이터는 대소문자를 구별한다.(문자열은 한개 따옴표''로)

select *
from employees
where hire_date < '2002-06-10'; -- 날짜도 비교가 된다. 비교시 문자열을 날짜 형태로 적으면 자동 변환됨


-- 예제1)
select *
from employees
where employee_id = 100;
-- 예제2)
select *
from employees
where first_name = 'David';
-- 예제3)
select *
from employees
where employee_id <= 105;
-- 예제4)
select *
from job_history
where start_date >= '2006-03-03';
-- 예제5)
select *
from departments
where location_id != 1700;

-- AND OR NOT 연산자
select last_name, department_id, salary
from employees
where department_id = 60
or department_id = 80 
and salary > 10000; 
-- 같음
-- where department_id = 60
-- or department_id = 80 and salary > 10000;
-- where department_id = 60
-- or (department_id = 80 
-- and salary) > 10000;

-- NOT
select *
from employees
where not(hire_date > '2004-01-01' or salary > 5000);
-- where (hire_date <='2004-01-01' and salary <= 5000)

-- 예제1)
select *
from employees
where salary > 4000 and job_id = 'IT_PROG';

-- 예제2)
select *
from employees
where salary > 4000 and (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- IN 연산자
select * from employees
where salary = 4000 or salary = 3000 or salary = 2700;

select * from employees
where salary IN (4000, 3000, 2700);

-- 예제1)
select * from employees
where salary IN (10000, 17000, 24000);
--예제2)
select * from employees
where department_id not in (30, 50, 80, 100, 110);

-- BETWEEN
-- 예제1)
select * from employees
where salary between 10000 and 20000;
-- 예제2)
select * from employees
where hire_date between '2004-01-01' and '2004-12-30';
-- 예제3)
select * from employees
where salary not between 7000 and 17000;

-- LIKE 연산자
select * from employees
where last_name LIKE 'B%'; -- B로 시작하는 모든 문자열 검색
select * from employees
where last_name LIKE '%b%'; -- 중간에 b가 들어가는 모든 문자열
select * from employees
where last_name LIKE '%y'; -- y로 끝나는 모든 문자열 검색
select * FROM employees
WHERE last_name LIKE '____y'; -- 언더바는 딱 한 문자를 의미
-- 예제1)
SELECT * FROM employees
WHERE job_id LIKE '%AD%';
-- 예제2)
SELECT * FROM employees
WHERE job_id LIKE '%AD___';
-- 예제3)
SELECT * FROM employees
WHERE phone_number LIKE '%1234';
-- 예제4)
SELECT * FROM employees
WHERE phone_number NOT LIKE 3 AND phone_number LIKE '%9';
-- 예제5)
SELECT * FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

-- NULL값을 검색할 때 IS NULL
SELECT * FROM employees
WHERE commission_pct IS NULL;
-- NULL이 아닌 경우 IS NOT NULL
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;
-- 예제)
SELECT * FROM employees
WHERE manager_id IS NULL;

-- ORDER BY 정렬 순서를 정함
SELECT * FROM employees
ORDER BY salary DESC; -- ASC(순차적:갈수록 커짐, 디폴트라 생략가능) DESC(내림차순:갈수록 작아짐)
-- 2개 이상 열로 정렬 시
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; --처음에 부서번호 순이고 같으면 직원번호 순서
-- 별칭별로 정렬 : order만 사용
SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC; -- 연봉이 큰순으로 정렬


-- 예제1)
SELECT employee_id, first_name, last_name
From employees
ORDER BY employee_id DESC;
-- 예제2)
SELECT * FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;
-- 예제3)
SELECT * FROM employees
WHERE employee_id between 120 and 150
ORDER BY department_id DESC, salary DESC ;


