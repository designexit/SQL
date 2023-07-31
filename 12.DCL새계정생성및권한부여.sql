-- 새 계정을 생성하려면 일반 계정에서 작업 X, 관리자 계정에서 가능
CREATE USER john IDENTIFIED BY 1234; -- 비번 1234 john계정 생성
-- 접속 권한 및 사용권한들을 모아서 한꺼번에 connect, resource롤을 부여
GRANT connect, RESOURCE TO john;

-- 권한 제거
REVOKE RESOURCE FROM john; -- 리소스 생성 안됨
REVOKE CONNECT FROM john; -- 계정 접속 불가

-- 계정 삭제 : 계정과 관계된 모든 데이터 삭제 (CASCADE)
DROP USER john CASCADE;