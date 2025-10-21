/*
# 오라클의 인라인 뷰(INLINE VIEW)
1. 인라인 뷰는 SQL쿼리에서 임시 재료 손질하는 그릇의 역할을 한다.
2. 복잡한 쿼리를 작성하기 전에, FROM 절 안에서 필요한 데이터만 뽑아 원하는 모양으로 가공해 가상의
미니 테이블을 만드는 기술이다. 이 가상 테이블은 오직 그 쿼리가 실행되는 동안에만 존재한다.
3. 핵심 키워드
    1) FROM (절의 서브 쿼리) : FROM 절 안에 들어감
    2) 가상테이블(VIRTUAL TABLE) : 실제 테이블이 아닌, 쿼리 실행 중에만 존재하는 임시 테이블이다.
    3) 데이터 사전 처리 : 복잡한 계산, 그룹화, 순서 매기기 등을 미리 처리하여 메인 쿼리를 단순하게 만듦

EX) 우리 회사 연봉 TOP은?
ROWNUM은 ORDER BY 보다 먼저 실행되기에, 단순히 ORDER BY로 정렬 후 ROWNUM <= 3 조건을 걸면 원하는 결과가 안나온다.
이럴 때 사용하는 것이 인라인 뷰
EMP 테이블에서 급여를 가장 많이 받는 상위 3명을 출력해라.
1) 인라인 뷰 : 먼저 EMP 테이블의 급여를 내림차순으로 정렬
2) 메인 쿼리 : 정렬된 결과에 ROWNUM을 이용해 1,2,3등만 뽑아낸다.
PS) ROWNUM : 실제 테이블에 저장된 값이 아닌, 쿼리 결과로 선행된 행에 오라클이 순서대로 붙여주는 임시 번호표다
    - FROM 절과 WHERE 절을 통해 테이블에서 데이터를 가져오는 순간에 ROWNUM이 발급됨 
    - ROWNUM을 받은 후에야 ORDER BY를 통해 정렬이 가능함
*/
-- 1단계: 기본 데이터 로딩
SELECT ROWNUM, ENAME, SAL
FROM EMP;
-- 2단계 
SELECT ENAME, SAL, ROWNUM RANKING, RN
FROM (
    SELECT ROWNUM RN, ENAME, SAL
    FROM EMP
    ORDER BY SAL DESC
) WHERE ROWNUM <=3;