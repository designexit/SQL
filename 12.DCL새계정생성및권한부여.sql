-- �� ������ �����Ϸ��� �Ϲ� �������� �۾� X, ������ �������� ����
CREATE USER john IDENTIFIED BY 1234; -- ��� 1234 john���� ����
-- ���� ���� �� �����ѵ��� ��Ƽ� �Ѳ����� connect, resource���� �ο�
GRANT connect, RESOURCE TO john;

-- ���� ����
REVOKE RESOURCE FROM john; -- ���ҽ� ���� �ȵ�
REVOKE CONNECT FROM john; -- ���� ���� �Ұ�

-- ���� ���� : ������ ����� ��� ������ ���� (CASCADE)
DROP USER john CASCADE;