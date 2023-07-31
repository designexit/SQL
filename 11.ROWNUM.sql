-- ROWNUM 데이터의 일련번호
SELECT rownum, emp.*
FROM emp where ROWNUM <= 5 ;

-- 6번 부터 10번까지 : rownum은 1번 부터 임시로 번호를 매기는거라 다른 조건으로는 검색이 안된다
SELECT rownum, emp.*
FROM emp where ROWNUM between 6 and 10 ; -- 검색 안 됨.

-- Table에 서브쿼리로 입력 시 번호 ROWNUM이 있는 테이블이 출력되어 조건 검색이 안됨.
SELECT * from (SELECT rownum, emp.*FROM emp)
where ROWNUM between 6 and 10;

-- ROWNUM을 RN별칭으로 설정 후에...
SELECT * from (SELECT rownum AS RN, emp.*FROM emp)
where RN between 6 and 10;

-- 정렬 (ORDER BY)이전에 ROWNUM 번호를 매기기 때문에 넘버링이 뒤죽박죽이다.
select rownum, emp.*
from emp
where rownum <=5 order by ename;
-- 정렬한 테이블을 서브쿼리로 넣은 다음에 rownum으로 번호를 매김
select rownum, A.* from (select * from emp
               order by ename) A
where rownum <=5;

select rownum, A.* from (select empno, ename from emp
                        order by ename) A
WHERE ROWNUM <= 5;


