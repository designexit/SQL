-- ���� ����Ʈ : https://urakasumi.tistory.com/60 --


desc employees;

-- 1. SQL �⺻ ��ɾ�
-- ### select ### --

-- ex1)
select employee_id, last_name, salary
from employees;

-- ex2)
select employee_id �����ȣ, last_name �̸�, salary �޿�
from employees;

-- ex3)
select employee_id �����ȣ, last_name �̸�, salary*12 ����
from employees;

-- ex4)
select first_name|| ' ' ||last_name �̸�
from employees;

-- ### distinct : �ߺ����� ### --

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

-- #��������
select last_name �����, to_char(salary, '$999,999,999') as "�� ��", department_id �μ��ڵ�
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

-- ### Like : ���ڸ� ���� ### --

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

-- #��������
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'AD_PRES') and salary > 10000;

-- #��������
select distinct job_id
from employees;

-- #��������
select employee_id, last_name, hire_date
from employees
where hire_date between '2005/01/01' and '2005/12/31';

-- 2. ������

-- ex1)
select last_name, department_id, hire_date
from employees
-- order by department_id desc;
order by 2 desc; -- 2�� �÷� �������� ����

-- ex2)
select last_name, department_id, hire_date
from employees
order by department_id desc, hire_date;
-- order by 2 desc, 3 asc; 2�� �÷� 3�� �÷� �������� ����

-- #��������
select last_name, salary*12 ���� 
from employees
order by salary desc;

-- ### ������ �Լ� / ��ȯ�Լ� ### --

-- ex1)
select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

-- ex2)
-- ������ �� ������
select mod (10, 3) from dual;

-- ex3)
-- �Ҽ��� �� ���� �ݿø�
select round(35765.357, 2) from dual;
select round(35765.357, 3) from dual;
select round(35765.357, 1) from dual;
select round(35765.357, 0) from dual;
select round(35765.357) from dual; -- ���� ����
select round(35765.357, -3) from dual; -- �Ҽ��� ���� n��° �ڸ� �ݿø�

-- ex4)
-- �Ҽ��� �� ���� ����
select trunc(35765.357, 2) from dual;
select trunc(35765.357, 3) from dual;
select trunc(35765.357, 1) from dual;
select trunc(35765.357, 0) from dual;
select trunc(35765.357) from dual; -- ���� ����
select trunc(35765.357, -3) from dual; -- �Ҽ��� ���� n��° �ڸ� ����:0�� ��

-- �Ҽ����� 0�� �ƴϸ� ������ �ø�
select ceil(35765.9) from dual;
select ceil(35765.1) from dual;

-- ex5)
select concat ('Good', ' Morning') from dual; -- �ܾ���� ��ﶧ �� ���ڿ� ��ĭ ����
select concat ('Hello', 'World') from dual;
select concat ('Hello', 'World'), substr('HelloWorld',2,4) from dual;
select length('HelloWorld')from dual; 
select length('Hello World')from dual; -- ���ڼ��� ���� ���� ��

SELECT CONCAT('��ο�','����!'), SUBSTR('��ο����',2,2), LENGTH('��ο�'),
    INSTR('��ο�','��'), TRIM('  ����  '),'  ����  '
FROM dual;

-- # ��������
select employee_id, last_name
from employees
where mod(employee_id, 2) = 0
order by employee_id desc;

-- length








