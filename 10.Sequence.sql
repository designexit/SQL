-- Sequence
create sequence ������1; -- ����(�ɼǾ���)
create sequence ������2
start with 1000
increment by 10; -- 1000�� ���� �����ؼ� 10�� �����ϴ� ������2

select * from user_sequences
where sequence_name = '������1';

-- Table�� �Է� �� Sequence ��� ���
drop table �μ�;
CREATE TABLE �μ�(
    ��ȣ number primary key,
    �̸� VARCHAR2(100)
);
INSERT INTO �μ� VALUES(������2.NEXTVAL, '������');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '���ߺ�');
INSERT INTO �μ� VALUES(������2.NEXTVAL, 'ȸ���');
INSERT INTO �μ� VALUES(������2.NEXTVAL, '�濵��');

SELECT * FROM �μ�;

-- sequence�� ���簪 Ȯ�� currval
select ������1.currval from dual;
select ������2.currval from dual;

-- Sequence ����
drop sequence ������1;
drop sequence ������2;

update �μ�
set ��ȣ = ������1.NEXTVAL; --SET �ؿ� WHERE���� ������ ���� ������Ʈ ��
SELECT * FROM �μ�;


