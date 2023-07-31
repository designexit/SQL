-- Index Ȯ���ϱ�
select
    table_name ���̺��,
    index_name �ε����̸�,
    column_name �÷��̸�
from all_ind_columns
where table_name='employees';
-- �⺻Ű, ����ũ ���� �ڵ����� �ε����� ������. ���� �⺻Ű�� �����ϴ� �ܷ�Ű�� �ε����� ����.

create table members (
    member_id number,
    first_name varchar2(100) not null,
    last_name VARCHAR2(100) not null,
    gender CHAR(1) not null,
    dob date not null,
    email VARCHAR2(255) not null,
    PRIMARY KEY(member_id) -- ���������� �Ʒ��� �࿡ ���� ���� �� ��ȣ�ȿ� ���� �̸��� �Է��Ѵ�
);

select
    table_name ���̺��,
    index_name �ε����̸�,
    column_name �÷��̸�
from all_ind_columns
where table_name='MEMBERS'; -- ���̺� ���� �빮��

select * from members;

select * from members
WHERE last_name = 'Harse';

EXPLAIN plan for
select * from members
WHERE last_name = 'Harse';

-- ���� Ȯ��
SELECT 
    plan_table_output
from
    table(dbms_xplan.display());

-- Index ����� : members table�� last_name��, �̸��� members_last_name_i
CREATE INDEX members_last_name_i
ON members(last_name);

-- Index ���� : index�� table ���� �� �ڵ����� ��.
drop index members_last_name_i;
