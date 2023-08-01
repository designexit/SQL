-- ������ �Լ�
SELECT lower('ABCD'), upper('abcd'), initcap('abcd')
FROM dual;
-- CONCAT, SUBSTR : ���ڿ�, ������ġ, ���ڿ� ����
SELECT CONCAT('��ο�','����!'), SUBSTR('��ο����',2,2), LENGTH('��ο�'),
    INSTR('��ο�','��'), TRIM('  ����  '),'  ����  '
FROM dual;

-- ������ �Լ� ����
SELECT department_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins'; -- lower�� �����ϸ� �ҹ��ڷθ� ����

SELECT department_id, last_name, email
FROM employees
WHERE INITCAP(email) = 'Sking'; -- initcap���� �����ϸ� �ҹ��� �빮�� ��� ����

SELECT last_name, CONCAT('�������� ', job_id) as ������
FROM employees
WHERE SUBSTR(job_id,4,3) = 'REP';

-- ���ڿ� ġȯ �Լ� replace
SELECT replace ('��ο����','����','����') from dual;

-- ����1)
SELECT last_name, lower(last_name), upper(last_name), email, initcap(email)
from employees;

-- ����2)
SELECT job_id ������, substr(job_id,1,2) ����2��
FROM employees;

-- ������ �Լ� : ROUND�� �ݿø�, TRUNC�� ����
SELECT ROUND(15.193,1) �Ҽ�ù°, ROUND(15.193) ����, ROUND(15.193,2) �Ҽ���°
FROM dual;
SELECT TRUNC(15.193,1) �Ҽ�ù°, TRUNC(15.193) ����, TRUNC(15.193,2) �Ҽ���°
FROM dual;
-- MOD�� ������ �� ������
-- ¦����° ��ȣ�� ���� �������� ���
SELECT employee_id ¦����ȣ, last_name �̸�
FROM employees
WHERE MOD(employee_id, 2) = 0 -- ���̵��ȣ�� 2�� �������� �� �������� 0�� ��
ORDER BY 1; -- ù��° ���� ����
-- ����)
SELECT salary, ROUND(salary/30) ����, ROUND(salary/30,1) �Ҽ�1, ROUND(salary/30,-1) "10���ڸ�"
FROM employees;

-- ��¥�� �Լ� sysdate:���糯¥
SELECT ROUND(sysdate, 'DD') ��,
    ROUND(sysdate, 'MM') ��,
    ROUND(sysdate, 'YYYY') �⵵,
    MONTHS_BETWEEN('2023/10/26','2023/7/26') ������,
    ADD_MONTHS('2023/7/26',2) �ֵ�վ�
FROM DUAL;
-- ��¥ ����
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ����, SYSDATE+7 "������ ��"
FROM DUAL;
-- 90�� �μ� �������� �ٹ����� (���ñ���)
SELECT last_name, FLOOR(SYSDATE - hire_date) �ٹ��ϼ�
FROM employees
WHERE department_id = 90;
-- ����)
--SELECT SYSDATE, hire_date, floor(months_between(sysdate, hire_date))
SELECT SYSDATE, hire_date, department_id, trunc(months_between(sysdate, hire_date), 1)
FROM employees
WHERE department_id = 100;
-- ����2)
SELECT hire_date, add_months(hire_date,3)���ϱ�, add_months(hire_date,-3) ����
FROM employees
WHERE employee_id between 100 AND 106;

-- ��ȯ �Լ�
-- TO_CHAR : ���ڸ� ���Ŀ� �°� ���ڿ��� ǥ��
SELECT TO_CHAR(12345678,'999,999,999') �޸�,
    TO_CHAR(123.45678,'999,999,999.99') �Ҽ���,
    TO_CHAR(123.45678,'$999,999,999.99') �޷�,
    TO_CHAR(12345678,'L999,999,999') ��ȭ,
    TO_CHAR(123,'0999') "0",
    TO_CHAR(123,'XXXX') "16����"
FROM DUAL;
-- ��¥�� ���ڿ��� ǥ��
SELECT TO_CHAR(SYSDATE,'YYYY/MM-DD HH24:MI:SS') ���糯¥�ð�
FROM DUAL;
-- ����1)
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY')�Ի��
FROM employees
WHERE department_id = 100;
-- ����2)
SELECT first_name || ' ' || last_name �̸�, TO_CHAR(salary, '$999,999,999.99') ����
FROM employees
WHERE salary > 10000
ORDER BY ���� DESC;

-- ���ڿ��� DATE Ÿ������ ��ȯ�ϴ� ����
SELECT TO_DATE('2023-01-01','YYYY-MM-DD')
FROM DUAL;
-- ���ڸ� ���ڷ� ��ȯ�ϴ� ����
SELECT TO_NUMBER('012') + 10
FROM DUAL;
SELECT TO_NUMBER('035002525')
FROM DUAL;

-- NULL�� ���� �Լ�
-- NVL �Լ��� null�� ��ſ� ���� �ٲپ��ش�.
SELECT last_name, NVL(manager_id, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';
-- NVL2:�ش翭�� NULL���� �ƴ� ���� NULL���� ��� ��� ���� �ٲپ� �ش�.
SELECT last_name, NVL2(manager_id, 1, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';
-- ����)
SELECT last_name �̸�, salary ����, NVL(commission_pct,0) Ŀ�̼�, salary*12 + salary*12*NVL(commission_pct,0) ����
FROM employees
ORDER BY ���� DESC;
-- ����2)
SELECT last_name �̸�, salary ����, NVL2(commission_pct,1,0) Ŀ�̼�, salary*12 + salary*12*NVL(commission_pct,0) ����,
    NVL2(commission_pct, 'SAL+COMM', 'SAL')
FROM employees
ORDER BY ���� DESC;

SELECT employee_id, last_name, commission_pct,
    NVL2(commission_pct, 'O', 'X') "Ŀ�̼� ����",
    NVL2(commission_pct, salary*12+commission_pct, salary*12) Ŀ�̼��ջ�
FROM employees;

-- DECODE �Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary*1.10,
                   'ST_CLERK', salary*1.15,
                   'SA_REP', salary*1.20,
                   salary) ��������
FROM employees;
-- ����)
SELECT last_name �̸�, job_id ����, salary ����,
    DECODE(TRUNC(salary/2000), 0, 0,
                            1, 0.09,
                            2, 0.2,
                            3, 0.3,
                            4, 0.4,
                            5, 0.42,
                            6, 0.44,
                             0.45) ����
FROM employees;

-- CASE �Լ�
SELECT last_name �̸�, job_id, salary,
    CASE WHEN salary < 5000 THEN 'LOW'
         WHEN salary < 10000 THEN 'MEDIUM'
         WHEN salary < 20000 THEN 'GOOD'
         ELSE 'EXCELLENT'
    END �޿�����
FROM employees;
-- ����
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary >= 9000 THEN '�����޿�'
         WHEN salary >= 6000 THEN '�����޿�'
         -- WHEN salary between 6000 and 8999 THEN '�����޿�'
         ELSE '�����޿�'
    END �޿����
FROM employees
WHERE job_id = 'IT_PROG';






