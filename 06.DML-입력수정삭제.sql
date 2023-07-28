-- 입력 INSERT

-- 테이블 열의 데이터 타입 간단히 보기
DESC departments; -- 확인 후 not null이면 무조건 입력해야 함

INSERT INTO departments(department_id,department_name,manager_id,location_id)
VALUES(300, '게임', 100, 1700);

-- 열이름 생략할 때 (모든 열(VALUES 값)을 다 입력해야 합)
INSERT INTO departments
VALUES(290, '낚시', 100, 1700);

-- null값이 입력될 때 (입력을 하지 않으면 null)
INSERT INTO departments(department_id,department_name)
VALUES(280, '음악');

-- 직원 테이블 입력
DESC employees;
INSERT INTO employees
VALUES (207, '길동', '홍', 'hong@gmail.com', '010.1234.1234', sysdate, 'IT_PROG', 9999, NULL, 205, 300);

-- 예제1)
DESC departments;
INSERT INTO departments VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments VALUES (273, 'Sample Dept 3', 200, 1700);

-- 수정 UPDATE (주의 : where절이 없으면 모든 행이 업데이트 된다)
UPDATE departments
SET manager_id = 200, location_id = 1700
WHERE department_id = 280;

-- 예제)
UPDATE departments
SET manager_id = 200
WHERE department_id between 150 and 200;

-- 삭제 DELETE
DELETE FROM departments
WHERE department_name = '음악';

-- 만약에 삭제하는 데이터를 참조하는 테이블과 데이터가 있을 경우 참조하는 데이터를 먼저 삭제해야 삭제가능
DELETE FROM departments
WHERE department_name = '게임'; -- 삭제불가 : employees에서 홍길동 직원이 있음

DELETE FROM employees
WHERE first_name = '길동'; 

-- 삭제 시 where절을 안 적으면? : 전체가 적용되므로 주의
UPDATE employees
SET phone_number = '010-1234-1234';

-- ROLLBACK : 그 전상태로 복구 (마지막 commit 시점으로 복구)
ROLLBACK;

-- 입력 수정 삭제 연습 (SCOTT계정)
delete from salgrade;
rollback;

DESC DEPT;
INSERT INTO DEPT (DEPTNO, DNAME, LOC)
VALUES (50, 'IT_PROG', 'BARCELLONA');

DESC EMP;
INSERT INTO EMP(EMPNO)
VALUES (7936);

INSERT INTO EMP(EMPNO, ENAME, JOB)
VALUES (7938, 'ORACLE', 'DT_MNG');

UPDATE EMP
SET JOB = 'IT_PROG', SAL = 1800, DEPTNO = 20
WHERE EMPNO = 7936;

INSERT INTO EMP(EMPNO)
VALUES (1111);

DELETE FROM EMP
WHERE EMPNO = 1111;

INSERT INTO EMP
VALUES (5000, '펭수', 'CREATOR', 5555, SYSDATE, 5000, NULL, 10);

INSERT INTO DEPT()








