-- Table �����
DROP TABLE COMP; -- TABLE ����
CREATE TABLE comp (
    ������ CHAR(10),
    ������ VARCHAR2(10)
);
DESC comp;
INSERT INTO comp VALUES ('1','�ϳ�');
INSERT INTO comp VALUES ('2','��');
INSERT INTO comp VALUES ('3','��');
SELECT * FROM comp;

-- ���ڿ� ��¥ ���̺�
CREATE TABLE ex_date (
    id NUMBER(2),
    start_date DATE DEFAULT SYSDATE
);
DESC ex_date;
-- ����Ʈ ���� �ش翭�� ���� �Է����� �ʾ��� �� 
INSERT INTO ex_date(id) VALUES (10);
INSERT INTO ex_date(id) VALUES (11);
INSERT INTO ex_date(id) VALUES (12);
SELECT * FROM ex_date;

-- ����!!! ������ �ٷ� Ŀ���� �Ǿ �ѹ��� �ȵ�
DROP TABLE COMP; 
DROP TABLE ex_date;

-- ����)
CREATE TABLE sample_product (
    product_id number(2),
    product_name VARCHAR2(20),
    menu_date DATE DEFAULT SYSDATE
);
DESC sample_product;
INSERT INTO sample_product(product_id) VALUES (10);
INSERT INTO sample_product(product_id) VALUES (20);
INSERT INTO sample_product(product_id) VALUES (30);
INSERT INTO sample_product(product_id) VALUES (40);
INSERT INTO sample_product(product_name) VALUES ('PIANO');

delete from sample_product;

INSERT INTO sample_product VALUES (10, 'GUITAR', '23/07/23');
INSERT INTO sample_product VALUES (20, 'PIANO', '23/07/26');
INSERT INTO sample_product VALUES (30, 'DRUM', '23/08/03');

-- TABLE ��������
DROP TABLE emp1;
CREATE TABLE emp1 (
    id number(3) primary key, -- �⺻Ű
    name VARCHAR2(20) NOT NULL, -- NULL���� �Է��� �� ����
    sal NUMBER CHECK(sal > 1000) -- CHECK�� ������ �Է�
);
DESC emp1;
INSERT INTO emp1 VALUES(1, '�浿', 1001);
INSERT INTO emp1 VALUES(2, '�Ѹ�', 2000);
INSERT INTO emp1 VALUES(null, '���'); -- �⺻Ű�� �ߺ� �� null�� �Է� �ȵ�

-- ����)
CREATE TABLE members (
    member_id NUMBER(2) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(5) CHECK(gender IN ('WOMAN', 'MAN')),
    birth_day DATE DEFAULT SYSDATE,
    email VARCHAR2(200) UNIQUE NOT NULL
);


DESC �μ�;

INSERT INTO �μ� VALUES(1, '�濵');
INSERT INTO �μ� VALUES(2, '����');
DELETE FROM �μ� where ��ȣ = 1;

DESC ����;
INSERT INTO ���� VALUES(1, 'ȫ�浿' ,1);
INSERT INTO ���� VALUES(2, '�ؼ�' ,2);

DELETE FROM ����;


-- CREAT TABLE AS
drop table emp_temp;
create table emp_temp
as
select * from emp
where 1!=1; --where�� ���ǿ� �����ϴ� �����Ͱ� ����. (Ư�� ���̺��� ��(���̺� ���)�� ����)

select * from emp_temp;








