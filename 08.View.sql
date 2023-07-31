-- View : 가상의 테이블
create view emp_v2
as
select employee_id 직원번호, first_name 이름, last_name 성, email, hire_date, job_id
from employees;

select * from emp_v2;
INSERT into emp_v2 VALUES(207, '길동', '홍', 'Hong', '2023-07-31', 'IT_PROG');
-- 뷰는 실제 물리적인 테이블이 아닌데 입력을 했음 => 실제로 뷰를 만든 테이블에 입력됨.
DELETE FROM EMP_V2 where 직원번호 = 207; -- employee_id 직원번호 별칭으로 쓰기
SELECT * from employees;

-- 읽기만 가능한 뷰로 만들기 (read with only)
create view emp_read(직원번호, 이름, 성, 이메일, 고용일자, 직종)
as
select employee_id, first_name, last_name, email, hire_date, job_id
from employees with read only;

select * from emp_read;
delete from emp_read where 직원번호 = 100; -- 삭제불가
-- 읽기만 가능한 뷰는 DML(입력, 수정, 삭제)가 안됨.











