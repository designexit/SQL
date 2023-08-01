-- 문자형 함수
SELECT lower('ABCD'), upper('abcd'), initcap('abcd')
FROM dual;
-- CONCAT, SUBSTR : 문자열, 시작위치, 문자열 개수
SELECT CONCAT('헬로우','월드!'), SUBSTR('헬로우월드',2,2), LENGTH('헬로우'),
    INSTR('헬로우','로'), TRIM('  공백  '),'  공백  '
FROM dual;

-- 문자형 함수 예제
SELECT department_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins'; -- lower로 선언하면 소문자로만 적기

SELECT department_id, last_name, email
FROM employees
WHERE INITCAP(email) = 'Sking'; -- initcap으로 선언하면 소문자 대문자 섞어서 적기

SELECT last_name, CONCAT('직업명이 ', job_id) as 직업명
FROM employees
WHERE SUBSTR(job_id,4,3) = 'REP';

-- 문자열 치환 함수 replace
SELECT replace ('헬로우월드','월드','세상') from dual;

-- 예제1)
SELECT last_name, lower(last_name), upper(last_name), email, initcap(email)
from employees;

-- 예제2)
SELECT job_id 직업명, substr(job_id,1,2) 앞의2개
FROM employees;

-- 숫자형 함수 : ROUND는 반올림, TRUNC는 버림
SELECT ROUND(15.193,1) 소수첫째, ROUND(15.193) 정수, ROUND(15.193,2) 소수둘째
FROM dual;
SELECT TRUNC(15.193,1) 소수첫째, TRUNC(15.193) 정수, TRUNC(15.193,2) 소수둘째
FROM dual;
-- MOD는 나누기 후 나머지
-- 짝수번째 번호를 가진 직원들을 출력
SELECT employee_id 짝수번호, last_name 이름
FROM employees
WHERE MOD(employee_id, 2) = 0 -- 아이디번호를 2로 나누었을 때 나머지가 0인 값
ORDER BY 1; -- 첫번째 열로 정렬
-- 예제)
SELECT salary, ROUND(salary/30) 정수, ROUND(salary/30,1) 소수1, ROUND(salary/30,-1) "10의자리"
FROM employees;

-- 날짜형 함수 sysdate:현재날짜
SELECT ROUND(sysdate, 'DD') 일,
    ROUND(sysdate, 'MM') 월,
    ROUND(sysdate, 'YYYY') 년도,
    MONTHS_BETWEEN('2023/10/26','2023/7/26') 월차이,
    ADD_MONTHS('2023/7/26',2) 애드먼쓰
FROM DUAL;
-- 날짜 연산
SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일, SYSDATE+7 "일주일 후"
FROM DUAL;
-- 90번 부서 직원들의 근무일자 (오늘까지)
SELECT last_name, FLOOR(SYSDATE - hire_date) 근무일수
FROM employees
WHERE department_id = 90;
-- 예제)
--SELECT SYSDATE, hire_date, floor(months_between(sysdate, hire_date))
SELECT SYSDATE, hire_date, department_id, trunc(months_between(sysdate, hire_date), 1)
FROM employees
WHERE department_id = 100;
-- 예제2)
SELECT hire_date, add_months(hire_date,3)더하기, add_months(hire_date,-3) 빼기
FROM employees
WHERE employee_id between 100 AND 106;

-- 변환 함수
-- TO_CHAR : 숫자를 형식에 맞게 문자열로 표시
SELECT TO_CHAR(12345678,'999,999,999') 콤마,
    TO_CHAR(123.45678,'999,999,999.99') 소수점,
    TO_CHAR(123.45678,'$999,999,999.99') 달러,
    TO_CHAR(12345678,'L999,999,999') 원화,
    TO_CHAR(123,'0999') "0",
    TO_CHAR(123,'XXXX') "16진수"
FROM DUAL;
-- 날짜를 문자열로 표시
SELECT TO_CHAR(SYSDATE,'YYYY/MM-DD HH24:MI:SS') 현재날짜시간
FROM DUAL;
-- 예제1)
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY')입사월
FROM employees
WHERE department_id = 100;
-- 예제2)
SELECT first_name || ' ' || last_name 이름, TO_CHAR(salary, '$999,999,999.99') 월급
FROM employees
WHERE salary > 10000
ORDER BY 월급 DESC;

-- 문자열을 DATE 타입으로 변환하는 예제
SELECT TO_DATE('2023-01-01','YYYY-MM-DD')
FROM DUAL;
-- 문자를 숫자로 변환하는 예제
SELECT TO_NUMBER('012') + 10
FROM DUAL;
SELECT TO_NUMBER('035002525')
FROM DUAL;

-- NULL값 관련 함수
-- NVL 함수는 null값 대신에 값을 바꾸어준다.
SELECT last_name, NVL(manager_id, 0) 매니저
FROM employees
WHERE last_name = 'King';
-- NVL2:해당열의 NULL값이 아닐 경우와 NULL값인 경우 모두 값을 바꾸어 준다.
SELECT last_name, NVL2(manager_id, 1, 0) 매니저
FROM employees
WHERE last_name = 'King';
-- 예제)
SELECT last_name 이름, salary 월급, NVL(commission_pct,0) 커미션, salary*12 + salary*12*NVL(commission_pct,0) 연봉
FROM employees
ORDER BY 연봉 DESC;
-- 예제2)
SELECT last_name 이름, salary 월급, NVL2(commission_pct,1,0) 커미션, salary*12 + salary*12*NVL(commission_pct,0) 연봉,
    NVL2(commission_pct, 'SAL+COMM', 'SAL')
FROM employees
ORDER BY 연봉 DESC;

SELECT employee_id, last_name, commission_pct,
    NVL2(commission_pct, 'O', 'X') "커미션 유무",
    NVL2(commission_pct, salary*12+commission_pct, salary*12) 커미션합산
FROM employees;

-- DECODE 함수
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary*1.10,
                   'ST_CLERK', salary*1.15,
                   'SA_REP', salary*1.20,
                   salary) 수정월급
FROM employees;
-- 예제)
SELECT last_name 이름, job_id 직무, salary 월급,
    DECODE(TRUNC(salary/2000), 0, 0,
                            1, 0.09,
                            2, 0.2,
                            3, 0.3,
                            4, 0.4,
                            5, 0.42,
                            6, 0.44,
                             0.45) 세율
FROM employees;

-- CASE 함수
SELECT last_name 이름, job_id, salary,
    CASE WHEN salary < 5000 THEN 'LOW'
         WHEN salary < 10000 THEN 'MEDIUM'
         WHEN salary < 20000 THEN 'GOOD'
         ELSE 'EXCELLENT'
    END 급여수준
FROM employees;
-- 예제
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary >= 9000 THEN '상위급여'
         WHEN salary >= 6000 THEN '중위급여'
         -- WHEN salary between 6000 and 8999 THEN '중위급여'
         ELSE '하위급여'
    END 급여등급
FROM employees
WHERE job_id = 'IT_PROG';






