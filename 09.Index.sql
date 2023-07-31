-- Index 확인하기
select
    table_name 테이블명,
    index_name 인덱스이름,
    column_name 컬럼이름
from all_ind_columns
where table_name='employees';
-- 기본키, 유니크 열은 자동으로 인덱스가 생성됨. 또한 기본키를 참조하는 외래키도 인덱스가 있음.

create table members (
    member_id number,
    first_name varchar2(100) not null,
    last_name VARCHAR2(100) not null,
    gender CHAR(1) not null,
    dob date not null,
    email VARCHAR2(255) not null,
    PRIMARY KEY(member_id) -- 제약조건을 아래의 행에 따로 넣을 때 괄호안에 열의 이름을 입력한다
);

select
    table_name 테이블명,
    index_name 인덱스이름,
    column_name 컬럼이름
from all_ind_columns
where table_name='MEMBERS'; -- 테이블 명은 대문자

select * from members;

select * from members
WHERE last_name = 'Harse';

EXPLAIN plan for
select * from members
WHERE last_name = 'Harse';

-- 보고서 확인
SELECT 
    plan_table_output
from
    table(dbms_xplan.display());

-- Index 만들기 : members table의 last_name열, 이름은 members_last_name_i
CREATE INDEX members_last_name_i
ON members(last_name);

-- Index 삭제 : index는 table 삭제 시 자동삭제 됨.
drop index members_last_name_i;
