-- 현재 날짜를 표시한다
SELECT sysdate FROM dual;
-- HR계정을 UNLOCK 하고 비밀번호를 1234로 수정
alter user hr account unlock identified by 1234;
-- scott.sql을 실행(연습용 scott계정을 사용하기 위함)
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
-- scott계정의 비밀번호를 1234로 수정
alter user scott identified by 1234;

