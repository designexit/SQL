-- 그룹함수(집계함수)
SELECT ROUND(AVG(salary)) 평균월급, MAX(salary), MIN(salary), SUM(salary) 월급들의총합,
    COUNT(salary) 총갯수
FROM employees
WHERE job_id = 'IT_PROG';
-- 그룹절 GROUP BY 그룹별 집계함수
SELECT department_id 부서명, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY department_id;
-- 예제1) COUNT(*)은 NULL값 포함 카운팅
SELECT department_id 부서명, COUNT(*) 사원수, MAX(salary) 최대급여, MIN(salary) 최소급여, 
    SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;
-- 예제2)
SELECT department_id 부서번호, job_id 직종, SUM(salary), COUNT(job_id)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
-- 예제3)
SELECT ROUND(AVG(MAX(salary))) 부서별최고월급평균, ROUND(AVG(MIN(salary))) 부서별최저월급평균
FROM employees
GROUP BY department_id;

-- 그룹 함수 Having 조건절
SELECT department_id 부서번호, count(*) 사원수
FROM employees
-- where count(*) > 5 : where절에서 이런(그룹함수) 조건은 쓸 수 없으므로 having(그룹함수)절로..
GROUP by department_id
HAVING count(*) > 5; -- 그룹조건으로 행의 수(사원수)가 5가 넘는 그룹
-- 예제)
SELECT job_id 부서번호, SUM(salary) 급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP by job_id
HAVING ROUND(AVG(salary)) > 10000
ORDER BY 급여합계 DESC;
-- 예제2)
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id !=40
GROUP by department_id
HAVING AVG(salary) <=7000;
-- 예제3)
SELECT job_id, SUM(salary) 급여합계
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP by job_id
HAVING SUM(salary) >= 13000
ORDER BY 급여합계 DESC;



