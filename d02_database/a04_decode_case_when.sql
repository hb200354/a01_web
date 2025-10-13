/*
# oracle decode 함수 처리
1. DECODE 함수는 특정값을 다른 값으로 바꿔주는(치환) 역할을 합니다. 
   마치 암호를 해독하듯, 컴퓨터가 알아듣는 코드 값( 'M', '01')을 우리가 이해하기
   쉬운 말(예) 남자, '서울')로 변환해 주는 아주 유용한 기능입니다.
2. 기본 형식
	DECODE( 기준값, 조건1, 결과1, 조건2, 결과2...., 기본결과)
	1) 기준값 : 바꾸고 싶은 값이 들어 있는 컬럼이나 데이터
	2) 조건, 결과 : 만약 기준값이 조건과 같다면, 결과로 바꿔줘라는 짝꿍입니다.
	3) 기본 결과 : 어떤 조건에도 해당하지 않을 때, 보여줄 값 지정..
3. 핵심 키워드
	1) DECODE(디코드) = 암호 해-독
	2) 연상법
	   - 첩보 영화를 떠올려보세요. 주인공이 적의 암호문(A01)을 입수합니다.
	   - 암호 해독기(DECODE)를 넣고 돌립니다.
	   - 작전 개시 라는 진짜 의미(결과)가 나타납니다.
	   - DECODE는 이렇게 코드를 해독해서 우리가 원하는 값을 바꿔주는 똑똑한 암호 
	   	  해독기입니다.	
4. 기본 예제
	어느 회사에 직급 코드가 아리와 같이 있다고 상상해 봅시다.
	10 : 사원
	20 : 대리
	30 : 과장
	40 : 부장
	이 코드만 보면 누가 높은 사람인지 한눈에 알기 어렵죠? DECODE로 재미있게
	바꿔볼까요?..
	사원 테이블(EMP)에서 사원번호(EMPNO), 이름(ENAME), 직급코드(DEPTNO)
	화 함께 DECODE로 변환한 직급명을 조회해보세요..
 * */
SELECT EMPNO, ENAME, DEPTNO, 
	   DECODE(DEPTNO, 10, '사원',
	                  20, '대리',
	                  30, '과장',
	                  40, '부장',
	                       '임원') AS POSITION
FROM EMP;	        
SELECT * FROM ACADEMY_STUDENT;
-- 확인 예제 DEPT_CODE를
-- 10 외교학과
-- 20 국어국문학과
-- 30 컴퓨터공학과
-- 40 제어계측학과  
-- 그외 아직정하지않음 으로 나뉘어 학생명, 학생번호, 학과를 출력하세요..
SELECT STUDENT_NO, SNAME, DEPT_CODE, 
      DECODE(DEPT_CODE, 10, '외교학과',
                        20, '국어국문학과',
                        30, '컴퓨터공학과',
                        40, '제어계측학과',
                            '아직정하지 않음' ) AS SUBJECT
FROM ACADEMY_STUDENT;                
-- 여러가지 함수를 적용하거나 연산된 결과값에 의해 처리된 내용을 DECODE로 처리하여 원하는
-- 결과를 수행(2단계, 3단계-중첩)
-- MOD 나눈 나머지값 MOD(EMPNO,2) 2나누었을 때, 나눈 나머지값...
SELECT EMPNO, MOD(EMPNO,2) EMPNODIV,
       DECODE(MOD(EMPNO,2),0,'청팀','홍팀') TEAM
  FROM EMP;
/*
# ORACLE CASE WHEN
1. DECODE를 뛰어 넘는 논리 대장
   1) CASE WHEN은 다양한 조건을 순서대로 체크해서, 가장 먼저 맞는 조건의 결과를 보여주는 진정한
   논리 대장입니다.
   2) DECODE가 단순한 값만 비교하여 1:1 암호 해독기였다면, CASE WHEN은 크기(>), 작다(<),
      포함한다(LIKE), 사이(BETWEEN) 등 훨씬 복잡하고 정교한 조건을 자유자재로 다룰 수 있는
      스마트한 기능입니다.
2. 기본 문법
   CASE
       WHEN 조건1 THEN 결과1
       WHEN 조건2 THEN 결과2
       ...
       ELSE 기본결과
   END
   1) WHEN ... THEN : 만약에 ~~ 이라면 이것을 @@@이라는 핵심 로직입니다.
   2) ELSE : 위의 WHEN 조건에 하나도 맞지 않을 경우 보여줄 값입니다.
   3) END : CASE 구문이 끝났음을 알려주는 중요한 짝꿍입니다.  반드시 써야 합니다.
3. 핵심 키워드..
	상황별 스마트 자판기 CASE WHEN!!
	키워드 : CASE(이런 경우에) WHEN(할 때)
	1) 최신형 스마트 자판기 앞에 섰다고 상상해 보세요..
	2) 자판기는 상황(CASE)를 살핍니다.
	3) 만약(WHEN) 들어온 돈이 1000원 이상이면 THEN 음료 버튼에 불을 켠다.
	4) 만약(WHEN) 콜라 버튼을 눌렀으면(THEN), 콜라를 내보낸다.
	5) 그 외(ELSE) 모든 상황에는 삐빅 오류음을 낸다.
	6) 주문 하나가 끝(END) 납니다.
	
	CASE WHEN은 이렇게 다양한 상황(조건)을 순서대로 체크하는 똑똑하고 유연한 자판기라고 기억하면
	완벽합니다.
*/
SELECT ENAME, SAL FROM EMP;  
SELECT ENAME, SAL,
       CASE 
           WHEN SAL >=5000 THEN 'A'
           WHEN SAL >=4000 THEN 'B'  -- 주의 상위에 선언된 것을 제외하고,
           WHEN SAL >=3000 THEN 'C'
           WHEN SAL >=2000 THEN 'D'
           ELSE 'F'
       END SAL_GRADE    
FROM EMP;  

SELECT * FROM student_score;
-- 학생의 점수 SCORE를 CASE WHEN 구문을 이용해서 A등급.... F등급까지 출력..
SELECT STUDENT_ID, STUDENT_NAME, SCORE,
       CASE 
       	  WHEN SCORE >= 90 THEN 'A등급'
       	  WHEN SCORE >= 80 THEN 'B등급'
       	  WHEN SCORE >= 70 THEN 'C등급'
       	  WHEN SCORE >= 60 THEN 'D등급'
       	  ELSE 'F등급'
       END SCORE_GRADE
FROM student_score;       
-- to_char(날짜, 'MM') 월만 추출해준다. 이것을 기분으로 BETWEEN 키워드를 이용하면
-- 입사 분기를 처리할 수 있다..
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE,'MM') "입사월",
       CASE 
       	  WHEN TO_CHAR(HIREDATE,'MM') BETWEEN '01' AND '03' THEN '1분기'
       	  WHEN TO_CHAR(HIREDATE,'MM') BETWEEN '04' AND '06' THEN '2분기'
       	  WHEN TO_CHAR(HIREDATE,'MM') BETWEEN '07' AND '09' THEN '3분기'
       	  ELSE '4분기'
       END AS "입사 분기"
FROM EMP;




