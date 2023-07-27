-- �׷��Լ�(�����Լ�)
SELECT ROUND(AVG(salary)) ��տ���, MAX(salary), MIN(salary), SUM(salary) ���޵�������,
    COUNT(salary) �Ѱ���
FROM employees
WHERE job_id = 'IT_PROG';
-- �׷��� GROUP BY �׷캰 �����Լ�
SELECT department_id �μ���, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY department_id;
-- ����1) COUNT(*)�� NULL�� ���� ī����
SELECT department_id �μ���, COUNT(*) �����, MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�, 
    SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;
-- ����2)
SELECT department_id �μ���ȣ, job_id ����, SUM(salary), COUNT(job_id)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
-- ����3)
SELECT ROUND(AVG(MAX(salary))) �μ����ְ�������, ROUND(AVG(MIN(salary))) �μ��������������
FROM employees
GROUP BY department_id;

-- �׷� �Լ� Having ������
SELECT department_id �μ���ȣ, count(*) �����
FROM employees
-- where count(*) > 5 : where������ �̷�(�׷��Լ�) ������ �� �� �����Ƿ� having(�׷��Լ�)����..
GROUP by department_id
HAVING count(*) > 5; -- �׷��������� ���� ��(�����)�� 5�� �Ѵ� �׷�
-- ����)
SELECT job_id �μ���ȣ, SUM(salary) �޿��հ�
FROM employees
WHERE job_id != 'AC_MGR'
GROUP by job_id
HAVING ROUND(AVG(salary)) > 10000
ORDER BY �޿��հ� DESC;
-- ����2)
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�
FROM employees
WHERE department_id !=40
GROUP by department_id
HAVING AVG(salary) <=7000;
-- ����3)
SELECT job_id, SUM(salary) �޿��հ�
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP by job_id
HAVING SUM(salary) >= 13000
ORDER BY �޿��հ� DESC;



