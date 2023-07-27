-- �⺻ JOIN ���
SELECT e.employee_id ������ȣ, e.last_name �̸�, e.department_id �μ���ȣ, d.department_name �μ���
-- = SELECT employee_id ������ȣ, last_name �̸�, d.department_id �μ���ȣ, department_name �μ��� : ������ ���̺��� ���̺� ��Ī�� �� ��� ��
FROM employees e JOIN departments d
ON e.department_id = d.department_id;
-- 3�� ���̺� ����
SELECT e.employee_id, l.city, d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
-- JOIN�� �Բ� WHERE �������� ���´ٰ� �ϸ�
SELECT e.employee_id ������ȣ, e.last_name �̸�, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id = 50;

-- ���� : ��Ǯ��
SELECT d.department_name �μ���, l.city ��Ƽ��, c.country_name ������
FROM departments d 
JOIN locations l
    ON l.location_id = d.location_id
JOIN countries c
    ON c.country_id = l.country_id
WHERE l.city IN('Seattle','London') AND c.country_name like 'United%';

-- ��ü���� : ���� ���̺� ������ �����ϰ� ���� ���
SELECT e.last_name ����, m.last_name �Ŵ���
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- �ܺ�����
-- ���� �ܺ�����
SELECT last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- ������ �ܺ�����
SELECT last_name ����, d.department_id �μ���ȣ, d.department_name �μ���
FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- full �ܺ�����
SELECT last_name ����, d.department_id �μ���ȣ, d.department_name �μ���
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- ����
SELECT c.country_name ����, c.country_id ������ȣ, l.location_id ������ȣ, l.city ���� 
FROM countries c LEFT OUTER JOIN locations l
    ON c.country_id = l.country_id
ORDER BY ������ȣ DESC;

-- �������� (Cross Join)
SELECT c.country_name ����, r.region_name �����̸�
FROM countries c CROSS JOIN regions r;










