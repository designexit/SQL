-- ���� ��¥�� ǥ���Ѵ�
SELECT sysdate FROM dual;
-- HR������ UNLOCK �ϰ� ��й�ȣ�� 1234�� ����
alter user hr account unlock identified by 1234;
-- scott.sql�� ����(������ scott������ ����ϱ� ����)
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
-- scott������ ��й�ȣ�� 1234�� ����
alter user scott identified by 1234;

