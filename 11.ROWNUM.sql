-- ROWNUM �������� �Ϸù�ȣ
SELECT rownum, emp.*
FROM emp where ROWNUM <= 5 ;

-- 6�� ���� 10������ : rownum�� 1�� ���� �ӽ÷� ��ȣ�� �ű�°Ŷ� �ٸ� �������δ� �˻��� �ȵȴ�
SELECT rownum, emp.*
FROM emp where ROWNUM between 6 and 10 ; -- �˻� �� ��.

-- Table�� ���������� �Է� �� ��ȣ ROWNUM�� �ִ� ���̺��� ��µǾ� ���� �˻��� �ȵ�.
SELECT * from (SELECT rownum, emp.*FROM emp)
where ROWNUM between 6 and 10;

-- ROWNUM�� RN��Ī���� ���� �Ŀ�...
SELECT * from (SELECT rownum AS RN, emp.*FROM emp)
where RN between 6 and 10;

-- ���� (ORDER BY)������ ROWNUM ��ȣ�� �ű�� ������ �ѹ����� ���׹����̴�.
select rownum, emp.*
from emp
where rownum <=5 order by ename;
-- ������ ���̺��� ���������� ���� ������ rownum���� ��ȣ�� �ű�
select rownum, A.* from (select * from emp
               order by ename) A
where rownum <=5;

select rownum, A.* from (select empno, ename from emp
                        order by ename) A
WHERE ROWNUM <= 5;


