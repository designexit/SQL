-- Table 만들기
DROP TABLE COMP; -- TABLE 삭제
CREATE TABLE comp (
    고정열 CHAR(10),
    가변열 VARCHAR2(10)
);
DESC comp;
INSERT INTO comp VALUES ('1','하나');
INSERT INTO comp VALUES ('2','둘');
INSERT INTO comp VALUES ('3','셋');
SELECT * FROM comp;

-- 숫자와 날짜 네이블
CREATE TABLE ex_date (
    id NUMBER(2),
    start_date DATE DEFAULT SYSDATE
);
DESC ex_date;
-- 디폴트 값은 해당열에 값을 입력하지 않았을 때 
INSERT INTO ex_date(id) VALUES (10);
INSERT INTO ex_date(id) VALUES (11);
INSERT INTO ex_date(id) VALUES (12);
SELECT * FROM ex_date;

-- 주의!!! 삭제시 바로 커밋이 되어서 롤백이 안됨
DROP TABLE COMP; 
DROP TABLE ex_date;

-- 예제)
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

-- TABLE 제약조건
DROP TABLE emp1;
CREATE TABLE emp1 (
    id number(3) primary key, -- 기본키
    name VARCHAR2(20) NOT NULL, -- NULL값을 입력할 수 없음
    sal NUMBER CHECK(sal > 1000) -- CHECK는 조건을 입력
);
DESC emp1;
INSERT INTO emp1 VALUES(1, '길동', 1001);
INSERT INTO emp1 VALUES(2, '둘리', 2000);
INSERT INTO emp1 VALUES(null, '펭수'); -- 기본키는 중복 및 null값 입력 안됨

-- 예제)
CREATE TABLE members (
    member_id NUMBER(2) PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    gender VARCHAR2(5) CHECK(gender IN ('WOMAN', 'MAN')),
    birth_day DATE DEFAULT SYSDATE,
    email VARCHAR2(200) UNIQUE NOT NULL
);


DESC 부서;

INSERT INTO 부서 VALUES(1, '경영');
INSERT INTO 부서 VALUES(2, '개발');
DELETE FROM 부서 where 번호 = 1;

DESC 직원;
INSERT INTO 직원 VALUES(1, '홍길동' ,1);
INSERT INTO 직원 VALUES(2, '팽수' ,2);

DELETE FROM 직원;


-- CREAT TABLE AS
drop table emp_temp;
create table emp_temp
as
select * from emp
where 1!=1; --where절 조건에 만족하는 데이터가 없음. (특정 테이블의 열(테이블 헤더)만 복사)

select * from emp_temp;








