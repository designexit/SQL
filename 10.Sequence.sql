-- Sequence
create sequence 시퀀스1; -- 생성(옵션없이)
create sequence 시퀀스2
start with 1000
increment by 10; -- 1000번 부터 시작해서 10씩 증가하는 시퀀스2

select * from user_sequences
where sequence_name = '시퀀스1';

-- Table에 입력 시 Sequence 사용 방법
drop table 부서;
CREATE TABLE 부서(
    번호 number primary key,
    이름 VARCHAR2(100)
);
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '영업부');
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '개발부');
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '회계부');
INSERT INTO 부서 VALUES(시퀀스2.NEXTVAL, '경영부');

SELECT * FROM 부서;

-- sequence의 현재값 확인 currval
select 시퀀스1.currval from dual;
select 시퀀스2.currval from dual;

-- Sequence 삭제
drop sequence 시퀀스1;
drop sequence 시퀀스2;

update 부서
set 번호 = 시퀀스1.NEXTVAL; --SET 밑에 WHERE절이 없으면 전부 업데이트 됨
SELECT * FROM 부서;


