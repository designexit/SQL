-- Sub Query
-- popp������ ����Ϻ��� ���Ŀ� ���� ������
-- ������ sub query�� sub query�� ����� ���ٸ� ���;� �Ѵ�.
SELECT last_name �̸�, hire_date �������
FROM employees
WHERE hire_date > ( select hire_date --where ���� �����Ϳ� ��ġ�ؾ� ��
                    from employees
                    where last_name = 'Popp');
                    
--SELECT last_name �̸�, hire_date �������
--FROM employees
--WHERE hire_date;

-- �����Լ� Sub Query
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary = (SELECT min(salary)
                FROM employees);

-- ����1)
select last_name �̸�, salary �޿�
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

-- ����2)
select employee_id, last_name, department_id, salary
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Bull')
and salary > (select salary 
              from employees
              where last_name = 'Bull');

-- ����3)
select last_name, salary, manager_id
from employees
where manager_id = (select employee_id
                  from employees
                  where last_name = 'Russell');

-- ����4)
select *
from employees
where job_id = (select job_id
                from jobs
                where job_title = 'Stock Manager');

-- ������ Sub Query
select min(salary)
from employees
group by department_id;
-- �μ��� �ּұ޿��� ���� �޿��� �޴� ������
select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
-- ANY ������ : �������� ����� �ϳ��� ���̿��� �˻���
SELECT *
FROM employees
WHERE salary < ANY
                (select salary
                from employees
                WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG0'
ORDER BY salary DESC;

-- ALL :  �������� ����� ��� ���̿��� �˻���
SELECT *
FROM employees
WHERE salary < ALL
                (select salary
                from employees
                WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG0'
ORDER BY salary DESC;
-- ����1)
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id IN (select manager_id
                        from employees
                        where department_id = 20)
and department_id <> 20;
-- ����2)
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

-- Sub Query ���߿�
-- ��罺�� ���� ���� �� ���� ��縦 ���� ������
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) in (select manager_id, job_id
                                FROM employees
                                where first_name = 'Bruce')
AND first_name != 'Bruce';

-- ����)


-- ���� ������ (UNION, INTERSECT, MINUS)
-- UNION : �ߺ����� �� ���� �� (107��+10��)=117�� -> 2���ߺ����� 115��
SELECT employee_id, job_id
FROM employees
union
SELECT employee_id, job_id
FROM job_history;

-- INTERSECT : �ߺ��Ǵ� ��(������)
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS : A-B�� ��(������)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

-- ����1)
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

-- ����2)
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

-- ����3)
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- ����4)
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;




