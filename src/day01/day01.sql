
/*
질의명령

    질의 : 물어본다
    
    데이터베이스 관리시스템한테 해당 데이터가 어디 있는지
    문의를 한다고 해서 질의명령이라 함
    
-----------------------------------------------------------

SQL : Structured Query Language의 약자
    구조화된 쿼리 언어
    
    이미 구조화 되어 있는 명령을 사용해서 데이터를 조작하는 언어
    프로그램이 불가능하다는 점이 특징
    
    명령 종류 ]
        1. DML 명령
            - Data Maniuplation Language (데이터 조작 언어)
                ==> 데이터를 추가, 수정, 삭제, 조회하는 작업을 하는 명령
                
                데이터를 조작하는 방법
                        의미          명령
                    C   - CREATE    - INSERT
                    R   - READ      - SELECT
                    U   - UPDATE    - UPDATE
                    D   - DELETE    - DELETE
                    
        2. DDL 명령
            - Data Definition Language (데이터 정의 언어)
            ==> 개체를 만들고 수정하는 언어
            
                    CREATE  - 개체(테이블, 사용자, 함수, 인덱스 등)를 만들 때 사용하는 명령
                    ALTER   - 개체를 수정하는 명령
                    DROP    - 개체를 삭제하는 명령
                    TRUNCATE    - 테이블을 잘라내는 명령
                    
        3. DCL 명령
            - Data Control Language (데이터 제어 언어)
            ==> 작업을 적용시킨다든지 (TCL 명령 : Transaction Control Language)
                권한을 준다든지
                
                    COMMIT
                    ROLLBACK
                    
                    GRANT
                    REVOKE
-----------------------------------------------------------

*/

-- 이것은 오라클 주석 ==> 어디서든지 사용할 수 있는 주석

select * from emp;

select
    empno, ename, job, mgr, hiredate, sal, comm, dname, loc -- select 절
from
    emp e, dept d -- from 절
where
    d.deptno = e.deptno; -- 조건절(where)절
    
/*
    
    참고 ]
        
        오라클의 명령은 명령을 구분하는 문자로 ; 을 사용함
        
        따라서 질의명령을 작성하는데 ;(세미콜론)을 적지 않으면
        명령이 끝나지 않은 것으로 간주함
        
        하나의 명령이 종료되면 반드시 세미콜론(;)을 적어줘야 함
        
*/

select * from emp;

select * from dept;

-----------------------------------------------------------

/*
    
    테이블 구조를 조회해보는 명령
    
    형식 ]
        
        describe    테이블이름;
        desc    테이블이름;
*/

-- emp 테이블의 구조를 조회해보자.
describe emp;

desc emp;

/*
    
    오라클의 데이터 타입
        
        숫자
            NUMBER, NUMBER(숫자) ==> 숫자는 사용자릿수
            NUMBER(유효자릿수, 소수이하자릿수)
        문자
            CHAR
            ==> 고정 문자수 문자열 데이터타입
            
                형식 ]
                    CHAR(숫자) ==> 바이트수만큼의 문자 기억
                    CHAR(숫자 CHAR) ==> 숫자개수만큼의 문자 기억
            VARCHAR2
            ==> 가변 문자수 문자열 데이터타입
                    VARCHAR2(숫자) ==> 숫자수만큼의 바이트만큼 문자 기억
                    VARCHAR2(숫자 CHAR) ==> 숫자개수만큼의 문자를 기억할 수 있음
            
            예 ]
                
                CHAR(10)
                ==> 'A' ==> 이 문자를 기억할 때 10바이트를 모두 사용함
                VARCHAR2(10)
                ==> 'A' ==> 1바이트로 문자 기억
                
        날짜
            Date
                
                형식 ]
                    
                    Date
        
*/

-----------------------------------------------------------

/*

     데이터 조회 명령
        
        SELECT
            컬럼이름들 (콤마로 구분해서 나열_
        FROM
            테이블이름들 (콤마로 구분해서 나열)
        [WHERE
                ]
        [GROUP BY
        
        [HAVING
                ]]
        ORDER BY
        
                ]
        ;
*/

-- 부서 정보 테이블의 정보를 조회하세요.
SELECT
    deptno, dname, loc
FROM
    dept
;

-- 1 + 4의 결과를 조회하세요.

select 1 + 4 from emp;

select '하리보' from emp;

/*
    
    문자열 데이터 표현 : '' 에 데이터를 표현
    오라클에서는 문자와 문자열을 구분하지 않음
    
    참고 ]
        
        오라클에서 테이블이름, 컬럼이름, 연산자, 명령어, 함수이름들은 
        대소문자를 구분하지 않음
        
        하지만 주의 사항으로
        데이터 자체는 반드시 대소문자를 구분해줘야 함
    
*/

-- 조건 검색

/*

    SELECT
        컬럼이름
    FROM
        테이블이름
    WHERE
        조건(결과값이 반드시 논리값이 되어야 함)
        
    조건 ]
        비교연산자
        =   : 같다
        >   : 크다
        <
        <=
        >=
        !=  : 다르다
        <>  : 다르다
        
        역시 오라클에서도 동시에 두개를 비교하는 것은 안 됨
        
            예 ]
            
                700 < SAL < 1200 ==> X
                
            참고 ]
                
                오라클은 데이터의 형태를 매우 중요시 함
                원칙적으로 문자는 문자끼리만 비교할 수 있고
                숫자는 숫자끼리만 비교할 수 있음
                단,
                    날짜는 문자처럼 비교 가능
                    이 때 날짜 데이터와 문자 데이터를 비교하는 것이 아니고
                    문자 데이터를 날짜 데이터로 변환한 후 비교하게 됨
                    
            참고 ]
                
                오라클은 문자도 크기 비교 가능
                아스키코드 값으로 비교하기 때문에
                
            참고 ]
                오라클은 문자와 문자열의 구분이 없음
                대신 문자열 데이터의 대소문자는 반드시 구분해서 처리해야 함
                
            참고 ]
                
                조건을 비교하는 방법은 오라클이 한 줄을 출력할 때마다
                그 행이 조건에 맞는지를 확인한 후
                조건이 맞으면 출력하게 됨
                
            참고 ]
            
                조건절에 조건을 여러개 나열하는 경우는
                AND 또는 OR 연산자를 이용해서 나열함
                
                이 때 조회시간은 처음 조건이 많이 걸러내는 조건일수록 짧아짐
        
*/

-- 사원이름이 'smith' 인 사원의 급여를 조회하세요.

SELECT
    sal
FROM
    emp
WHERE
    ename = 'smith'; -- 데이터 자체는 대소문자를 구분해줘야 함
    
;

-- 사원 중 직급이 MANAGER이고 부서번호가 10번인 사원의 이름을 조회하세요.
SELECT
    ename
FROM
    emp
WHERE
    job = 'MANAGER' 
    AND deptno = 10
;
-----------------------------------------------------------

/*
    
    EMP 테이블
    
        EMPNO       : 사원번호
        ENAME       : 사원이름
        JOB         : 사원직급
        MGR         : 상사번호
        HIREDATE    : 입사일
        SAL         : 급여
        COMM        : 커미션
        DEPTNO      : 부서번호
        
*/

/*
    
    1. 사원 이름이 SMITH인 사원의
        이름, 직급, 입사일을 조회하세요.
    
*/

    SELECT
        ename, job, hiredate
    FROM
        emp
    WHERE
        ename = 'SMITH'
    ;

/*
   
   2. 직급이 MANAGER인 사원의
        이름, 직급, 급여를 조회하세요.
        
*/

    SELECT
        ename, job, sal
    FROM
        emp
    WHERE
        job = 'MANAGER'
    ;

/*
    
    3. 급여가 1500을 넘는 사원들의
        이름, 직급, 급여를 조회하세요.
        
*/

    SELECT
        ename, job, sal
    FROM
        emp
    WHERE
        sal > 1500
    ;

/*
    
    4. 이름이 'S' 이후의 문자로 시작하는 사원들의 (S 포함)
        이름, 직급, 급여를 조회하세요.
        
*/

    SELECT
        ename, job, sal
    FROM
        emp
    WHERE
        ename >= 'S' -- 'S' < 'Sa'
    ;
    
-- 입사일이 '81/08' 이전에 입사한 사원들의
--   사원이름, 입사일, 급여를 조회하세요.

SELECT
    ename, hiredate, sal
FROM
    emp
WHERE
    hiredate < '81/08/01'
;

-- 부서번호가 10번 또는 30번인 사원들의 사원이름, 직급, 부서번호를 조회하세요.

SELECT
    ename, job, deptno
FROM
    emp
WHERE
/*
    
    deptno = 10
    OR deptno = 30
    
*/

    deptno IN(10, 30)
;

/*
    
    NOT 연산자
    ==> 조건식의 결과를 부정하는 연산자
    
        형식 ]
            
            WHERE
                NOT 조건식
                
*/

-- 부서번호가 10번이 아닌 사원들의 사원이름, 직급, 부서번호를 조회하세요.

SELECT
    ename, job, deptno
FROM
    emp
WHERE
--    NOT deptno = 10
--    deptno != 10
      deptno <> 10
;

-----------------------------------------------------------

/*

    5. 급여가 1000 ~ 3000인 사원들의
        사원이름, 직급, 급여를 조회하세요.

*/

    SELECT
        ename, job, sal
    FROM
        emp
    WHERE
        sal >= 1000
        AND sal <= 3000
    ;
/*

    6. 직급이 MANAGER이면서 급여가 1000 이상인 사원들의
        사원이름, 직급, 입사일, 급여를 조회하세요.
        
*/

    SELECT
        ename, job, hiredate, sal
    FROM
        emp
    WHERE
        job = 'MANAGER'
        AND sal >= 1000
    ;
    
-----------------------------------------------------------

/*
    
    특별한 조건 연산자
    
    1. BETWEEN ~ AND
    ==> 데이터가 특정 범위 안에 있는지를 확인하는 연산자
    
        형식 ]
            
            컬럼이름 BETWEEN 데이터1 AND 데이터2
            컬럼의 내용이 데이터1과 데이터2 사이에 있는지를 검사
            
            주의 ]
                
                값이 작은 데이터가 데이터1에 와야 함
                
                부정을 할 경우는 between 앞에 not을 붙여줌
                
    2. IN
    ==> 데이터가 주어진 데이터들 중 하나인지를 검사하는 연산자
        
        형식 ]
        
            필드 IN(데이터1, 데이터2, ...)
            
    3. LIKE (문자열 비교 연산자)
    ==> 문자열을 처리하는 경우에만 사용하는 방법으로
        문자열의 일부분을 와일드카드 처리하여
        조건식을 제시하는 방법
        
        형식 ]
            
            필드  LIKE '와일드카드'
        
        의미 ] 
            
            데이터가 지정한 문자열 형식과 동일한지를 판단
        
        참고 ]
            
            와일드카드 사용법
            
                _ : 한개당 한글자만을 와일드카드로 지정하는 것
                % : 글자수에 관계없이 모든 문자를 포함하는 와일드카드
                문자를 쓰게 되면 그 위치에 문자가 와야 함
                
                예 ]
                    
                    'M%' - M으로 시작하는 모든 문자열
                    'M__' - 'M'으로 시작하는 세문자로 이루어진 문자열
                    '%M%' - M이 포함된 모든 문자열
                    '%M' - M으로 끝나는 문자열
    
*/

/*

            예 ]
                
                급여가 1000 ~ 3000인 사원들의
                사원이름, 급여를 조회하세요.

*/

SELECT
    ename, sal
FROM
    emp
WHERE
    sal BETWEEN 1000 AND 3000
;

/*

    부서번호가 10번, 30번인 사원들의 사원이름, 직급, 부서번호를 조회하세요.
    
*/

SELECT
    ename, job, deptno
FROM
    emp
WHERE
    deptno IN(10, 30)
;

-- NOT을 붙일 경우

SELECT
    ename, job, deptno
FROM
    emp
WHERE
    deptno NOT IN(10, 30)
;

/*

    직급이 MANAGER, SALESMAN이 아닌 사원들의
    사원이름, 직급, 급여를 조회하세요.
    
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    job NOT IN('MANAGER', 'SALESMAN')
;

/*

    참고 ]
        
        조회되는 컬럼에 별칭을 부여해서 조회 가능
        
        형식 ]
            
            컬럼이름 별칭
            
            컬럼이름 AS 별칭
            
            컬럼이름 "별 칭"
            
            컬럼이름 AS "별 칭"
            
            참고 ]
            
                공백이 포함된 별칭의 경우는 큰 따옴표로 감싸줌
*/

-----------------------------------------------------------

/*
    LIKE
*/

/*
    
    이름이 다섯글자인 사원들의
    사원이름, 직급을 조회하세요.
    
*/

SELECT
    ename, job
FROM
    emp
WHERE
    ename LIKE '_____'
;

/*

    입사일이 1월인 사원들의
    사원이름, 입사일을 조회하세요.
    
*/

SELECT
    ename, hiredate
FROM
    emp
WHERE
    hiredate LIKE '__/01/__' -- 81/01/01
;

-----------------------------------------------------------

/*
    
    문제 1 ]
        
        부서번호가 10번인 사원들의
            이름, 직급, 입사일, 부서번호를 조회하세요.
        
*/

SELECT
    ename, job, hiredate, deptno
FROM
    emp
WHERE
    deptno = 10
;

/*
    
    문제 2 ]
        
        직급이 'SALESMAN'인 사원들의
            이름, 직급, 급여를 조회하세요.
        단, 필드 이름은 제시한 이름으로 조회되게 하세요.
    
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    job = 'SALESMAN'
;

/*
    
    문제 3 ]
        
       급여가 1000보다 적은 사원들의
            이름, 직급, 급여를 조회하세요.
            
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    sal <= 1000

;

/*
    
    문제 4 ]
        
        사원이름이 'M' 이전의 문자로 시작하는 사원들의
            이름, 직급, 급여를 조회하세요.
            
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    ename < 'M'
;

/*
    
    문제 5 ]
        
       입사일이 1981년 9월 8일 입사한 사원의
            이름, 직급, 입사일을 조회하세요.
            
*/

SELECT
    ename, job, hiredate
FROM
    emp
WHERE
    hiredate = '81/09/08'
;

/*
    
    문제 6 ]
        
       사원이름이 'M' 이후 문자로 시작하는 사원 중
       급여가 1000 이상인 사원의
            이름, 급여, 직급을 조회하세요.
            
*/

SELECT
    ename, sal, job
FROM
    emp
WHERE
    ename LIKE 'M%'
    AND sal >= 1000
;

/*
    
    문제 7 ]
        
       직급이 'MANAGER'이고 급여가 1000보다 크고
       부서번호가 10번인 사원의
            이름, 직급, 급여, 부서번호를 조회하세요.
            
*/

SELECT
    ename, job, sal, deptno
FROM
    emp
WHERE
    job = 'MANAGER'
    AND sal >= 1000
    AND deptno = 10
;

/*
    
    문제 8 ]
        
       직급이 'MANAGER'인 사원을 제외한 사원들의
            이름, 직급, 입사일을 조회하세요.
        단, NOT 연산자를 이용하세요.
            
*/

SELECT
    ename, job, hiredate
FROM
    emp
WHERE
    job NOT IN('MANAGER')
;

/*
    
    문제 9 ]
        
       이름이 'C'로 시작하는 것보다 크고
       'M'으로 시작하는 것보다 작은 사원만
            이름, 직급, 급여를 조회하세요.
        단, BETWEEN 연산자를 사용하세요.
            
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    ename between 'C' and 'M'
;

/*
    
    문제 10 ]
    
        급여가 800, 950이 아닌 사원들의
            이름, 직급, 급여를 조회하세요.
         단, IN 연산자를 사용해서 처리하세요.
            
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    sal NOT IN(800, 950)
;

/*
    
    문제 11 ]
        
       이름이 'S'로 시작하고 다섯글자인 사원들의
            이름, 직급, 급여를 조회하세요.
            
*/

SELECT
    ename, job, sal
FROM
    emp
WHERE
    ename LIKE 'S%'
    AND ename LIKE '_____'
;

/*
    
    문제 12 ]
        
       입사일이 3일인 사원들의
            이름, 직급, 입사일을 조회하세요.
            
*/

SELECT
    ename, job, hiredate
FROM
    emp
WHERE
    hiredate LIKE '__/__/03'
;

/*
    
    문제 13 ]
        
       이름의 글자수가 4글자이거나 5글자인 사원들의
            이름, 직급을 조회하세요.
            
*/

SELECT
    ename, job
FROM
    emp
WHERE
    ename LIKE '____'
    OR ename LIKE '_____'
;

/*
    
    문제 14 ]
        
       입사년도가 81년도이거나 82년도인 사원들의
            이름, 급여, 입사일을 조회하세요.
            
        보너스 ]
        
            위 문제에서 급여를 10% 인상해서 조회하세요.
            
*/

SELECT
    ename, sal, hiredate
FROM
    emp
WHERE
    hiredate LIKE '81/__/__'
    OR hiredate LIKE '82/__/__'
;

/*
    
    문제 15 ]
        
       이름이 'S'로 끝나는 사원의
            이름, 급여, 커미션을 조회하세요.
            
*/

SELECT
    ename, sal, comm
FROM
    emp
WHERE
    ename LIKE '%S'
;

SELECT
    ename || '님' 사원이름, sal 이전급여, (sal * 2) "인상급여"
FROM
    emp
;

-----------------------------------------------------------

/*
    
    데이터 결합 연산자
    
        형식 ]
            
            데이터1 || 데이터2
            
*/

SELECT 10 || 20 from dual;

-- 사원들 이름에 Mr.를 붙여서 조회하세요.
SELECT
    'Mr.' || ename 사원이름, sal || ' 달러' 급여, hiredate 입사일
FROM
    emp
;

SELECT
    ename 이름, sal 원급여, 
    sal + 1000 "보너스 적용 급여", 
    sal * 1.5 인상, sal * 12 연봉
FROM
    emp
;

SELECT
    e.ename 사원이름, e.sal 사원급여, e.mgr 상사번호, 
    s.ename 상사이름, s.sal 상사급여
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;

SELECT
    ename 사원이름, sal 급여, grade 급여등급
FROM
    emp, salgrade
WHERE
    sal between losal and hisal
;

SELECT
    distinct deptno 부서번호
FROM
    emp
;



