-- View : ������ ���̺�
create view emp_v2
as
select employee_id ������ȣ, first_name �̸�, last_name ��, email, hire_date, job_id
from employees;

select * from emp_v2;
INSERT into emp_v2 VALUES(207, '�浿', 'ȫ', 'Hong', '2023-07-31', 'IT_PROG');
-- ��� ���� �������� ���̺��� �ƴѵ� �Է��� ���� => ������ �並 ���� ���̺� �Էµ�.
DELETE FROM EMP_V2 where ������ȣ = 207; -- employee_id ������ȣ ��Ī���� ����
SELECT * from employees;

-- �б⸸ ������ ��� ����� (read with only)
create view emp_read(������ȣ, �̸�, ��, �̸���, �������, ����)
as
select employee_id, first_name, last_name, email, hire_date, job_id
from employees with read only;

select * from emp_read;
delete from emp_read where ������ȣ = 100; -- �����Ұ�
-- �б⸸ ������ ��� DML(�Է�, ����, ����)�� �ȵ�.











