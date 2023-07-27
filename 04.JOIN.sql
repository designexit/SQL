-- 기본 JOIN 방법
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서명
-- = SELECT employee_id 직원번호, last_name 이름, d.department_id 부서번호, department_name 부서명 : 유일한 테이블은 테이블 별칭을 안 적어도 됨
FROM employees e JOIN departments d
ON e.department_id = d.department_id;
-- 3개 테이블 조인
SELECT e.employee_id, l.city, d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
-- JOIN과 함께 WHERE 조건절을 적는다고 하면
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서명
FROM employees e JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id = 50;

-- 예제 : 쌤풀이
SELECT d.department_name 부서명, l.city 시티명, c.country_name 국가명
FROM departments d 
JOIN locations l
    ON l.location_id = d.location_id
JOIN countries c
    ON c.country_id = l.country_id
WHERE l.city IN('Seattle','London') AND c.country_name like 'United%';

-- 자체조인 : 같은 테이블 내에서 참조하고 있을 경우
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- 외부조인
-- 왼쪽 외부조인
SELECT last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- 오른쪽 외부조인
SELECT last_name 직원, d.department_id 부서번호, d.department_name 부서명
FROM employees e RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- full 외부조인
SELECT last_name 직원, d.department_id 부서번호, d.department_name 부서명
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
-- 예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시 
FROM countries c LEFT OUTER JOIN locations l
    ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;

-- 교차조인 (Cross Join)
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c CROSS JOIN regions r;










