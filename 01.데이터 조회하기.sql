-- DATA ��ȸ�ϱ�
-- select * : ��� �� / from�ڴ� ���̺� �̸�
-- �� �̸� �ٲܶ� select department_id as �μ���ȣ (as���� ����)
select department_id �μ���ȣ, department_name �μ��̸�
from departments;

-- ������� (+-*/) : ����� ���� �����ͷ�...
select last_name �̸�, job_id ����, salary ����, salary+100 ���ʽ�����, salary - salary*0.1 ����
from employees;
-- DISTINCT �ߺ� �� ���� (�Ȱ��� ���� ���� ��� �ϳ��� ǥ�õ�)
select distinct job_id ����
from employees;

SELECT distinct employee_id, job_id
from employees;
SELECT * from employees;
SELECT all job_id from employees;

-- ����1)
select employee_id, first_name, last_name
from employees;
-- ����2)
select first_name, salary, salary*1.1 ��������
from employees;
-- ����3)
select employee_id �����ȣ, first_name �̸�, last_name ��
from employees;

-- ���� ������ || ���ڿ��� �����Ѵ� (as �ڿ� �ܾ ���Ⱑ ������ ""�� ����)
select last_name || ' is a ' || job_id as "���� ����"
from employees;
-- ����4)
select employee_id, first_name || ' ' || last_name name, email || '@company.com' email
from employees;

-- where ������
select *
from employees
where last_name = 'King'; -- ���� ��� = / �����ʹ� ��ҹ��ڸ� �����Ѵ�.(���ڿ��� �Ѱ� ����ǥ''��)

select *
from employees
where hire_date < '2002-06-10'; -- ��¥�� �񱳰� �ȴ�. �񱳽� ���ڿ��� ��¥ ���·� ������ �ڵ� ��ȯ��


-- ����1)
select *
from employees
where employee_id = 100;
-- ����2)
select *
from employees
where first_name = 'David';
-- ����3)
select *
from employees
where employee_id <= 105;
-- ����4)
select *
from job_history
where start_date >= '2006-03-03';
-- ����5)
select *
from departments
where location_id != 1700;

-- AND OR NOT ������
select last_name, department_id, salary
from employees
where department_id = 60
or department_id = 80 
and salary > 10000; 
-- ����
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

-- ����1)
select *
from employees
where salary > 4000 and job_id = 'IT_PROG';

-- ����2)
select *
from employees
where salary > 4000 and (job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT');

-- IN ������
select * from employees
where salary = 4000 or salary = 3000 or salary = 2700;

select * from employees
where salary IN (4000, 3000, 2700);

-- ����1)
select * from employees
where salary IN (10000, 17000, 24000);
--����2)
select * from employees
where department_id not in (30, 50, 80, 100, 110);

-- BETWEEN
-- ����1)
select * from employees
where salary between 10000 and 20000;
-- ����2)
select * from employees
where hire_date between '2004-01-01' and '2004-12-30';
-- ����3)
select * from employees
where salary not between 7000 and 17000;

-- LIKE ������
select * from employees
where last_name LIKE 'B%'; -- B�� �����ϴ� ��� ���ڿ� �˻�
select * from employees
where last_name LIKE '%b%'; -- �߰��� b�� ���� ��� ���ڿ�
select * from employees
where last_name LIKE '%y'; -- y�� ������ ��� ���ڿ� �˻�
select * FROM employees
WHERE last_name LIKE '____y'; -- ����ٴ� �� �� ���ڸ� �ǹ�
-- ����1)
SELECT * FROM employees
WHERE job_id LIKE '%AD%';
-- ����2)
SELECT * FROM employees
WHERE job_id LIKE '%AD___';
-- ����3)
SELECT * FROM employees
WHERE phone_number LIKE '%1234';
-- ����4)
SELECT * FROM employees
WHERE phone_number NOT LIKE 3 AND phone_number LIKE '%9';
-- ����5)
SELECT * FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

-- NULL���� �˻��� �� IS NULL
SELECT * FROM employees
WHERE commission_pct IS NULL;
-- NULL�� �ƴ� ��� IS NOT NULL
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;
-- ����)
SELECT * FROM employees
WHERE manager_id IS NULL;

-- ORDER BY ���� ������ ����
SELECT * FROM employees
ORDER BY salary DESC; -- ASC(������:������ Ŀ��, ����Ʈ�� ��������) DESC(��������:������ �۾���)
-- 2�� �̻� ���� ���� ��
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; --ó���� �μ���ȣ ���̰� ������ ������ȣ ����
-- ��Ī���� ���� : order�� ���
SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC; -- ������ ū������ ����


-- ����1)
SELECT employee_id, first_name, last_name
From employees
ORDER BY employee_id DESC;
-- ����2)
SELECT * FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;
-- ����3)
SELECT * FROM employees
WHERE employee_id between 120 and 150
ORDER BY department_id DESC, salary DESC ;


