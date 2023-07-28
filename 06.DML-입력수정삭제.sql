-- �Է� INSERT

-- ���̺� ���� ������ Ÿ�� ������ ����
DESC departments; -- Ȯ�� �� not null�̸� ������ �Է��ؾ� ��

INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES(300, '����', 100, 1700);

-- ���̸� ������ �� (��� ��(VALUES ��)�� �� �Է��ؾ� ��)
INSERT INTO departments
VALUES(290, '����', 100, 1700);

-- null���� �Էµ� �� (�Է��� ���� ������ null)
INSERT INTO departments(department_id,department_name)
VALUES(280, '����');

-- ���� ���̺� �Է�
DESC employees;
INSERT INTO employees
VALUES (207, '�浿', 'ȫ', 'hong@gmail.com', '010.1234.1234', sysdate, 'IT_PROG', 9999, NULL, 205, 300);

-- ����1)
DESC departments;
INSERT INTO departments VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments VALUES (273, 'Sample Dept 3', 200, 1700);

-- ���� UPDATE (���� : where���� ������ ��� ���� ������Ʈ �ȴ�)
UPDATE departments
SET manager_id = 200, location_id = 1700
WHERE department_id = 280;

-- ����)
UPDATE departments
SET manager_id = 200
WHERE department_id between 150 and 200;

-- ���� DELETE
DELETE FROM departments
WHERE department_name = '����';

-- ���࿡ �����ϴ� �����͸� �����ϴ� ���̺�� �����Ͱ� ���� ��� �����ϴ� �����͸� ���� �����ؾ� ��������
DELETE FROM departments
WHERE department_name = '����'; -- �����Ұ� : employees���� ȫ�浿 ������ ����

DELETE FROM employees
WHERE first_name = '�浿'; 

-- ���� �� where���� �� ������? : ��ü�� ����ǹǷ� ����
UPDATE employees
SET phone_number = '010-1234-1234';

-- ROLLBACK : �� �����·� ���� (������ commit �������� ����)
ROLLBACK;

-- �Է� ���� ���� ���� (SCOTT����)
delete from salgrade;
rollback;

DESC DEPT;
INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES (50, 'IT_PROG', 'BARCELLONA');

DESC EMP;
INSERT INTO EMP(EMPNO)
VALUES (7936);

INSERT INTO EMP(EMPNO, ENAME, JOB)
VALUES (7938, 'ORACLE', 'DT_MNG');

UPDATE EMP
SET JOB = 'IT_PROG', SAL = 1800, DEPTNO = 20
WHERE EMPNO = 7936;

INSERT INTO EMP(EMPNO)
VALUES (1111);

DELETE FROM EMP
WHERE EMPNO = 1111;

INSERT INTO EMP
VALUES (5000, '���', 'CREATOR', 5555, SYSDATE, 5000, NULL, 10);

INSERT INTO DEPT()








