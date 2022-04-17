-- 금요일에 배운 내용 복습문제

/*
    
    문제 1 ]
    
        사원의 이름, 직급, 입사일, 급여를 조회하세요.
        단, 급여가 높은 사람부터 먼저 출력되도록 하세요.
        
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여
FROM
    emp
ORDER BY
    sal DESC
;

/*
    
    문제 2 ]
    
        사원들의 
            사원이름, 직급, 입사일, 부서번호를 조회하세요.
        단, 부서번호 순서대로 출력하고 
        같은 부서이면 입사일 순서대로 출력되도록 하세요.
        
*/

SELECT
    ename 사원이름, job 직급 , hiredate 입사일, deptno 부서번호
FROM
    emp
ORDER BY
    deptno ASC, hiredate
;

/*
    
    문제 3 ]
    
        입사월이 5월인 사원의 
            사원이름, 직급, 입사일을 조회하세요.
            단, 입사일이 빠른 사람이 먼저 조회되도록 하세요.
            
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
    hiredate LIKE '__/05/__'
ORDER BY
    hiredate
;

/*
    
    문제 4 ] 연산자를 사용해서 처리하세요.
        
        이름의 마지막 글자가 S인 사람의 
            사원이름, 직급, 입사일을 조회하세요.
        단, 직급 순서대로 조회하고 
        같은 직급이면 입사일 순서대로 출력되도록 하세요.
        
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
    SUBSTR(ename, -1) = 'S'
ORDER BY
    job ASC, hiredate
;

/*
    
    문제 5 ] NVL()을 사용해서 처리하세요.
        
        커미션을 27% 인상하여 조회하세요.
        단, 커미션이 없는 사원은 커미션을 100으로 계산해서
            100에 27%를 인상하도록 하세요.
        단, 소수 이상 둘째 자리에서 반올림하여 출력하세요.
        
*/

SELECT
    ename 사원이름, sal 사원급여, ROUND(NVL(comm * 1.27, 100 * 1.27), -2) 커미션
FROM
    emp
;

/*
    
    문제 6 ]
       
        급여의 15%를 인상한 금액과 커미션을 합쳐서 
        사원이름, 직급, 급여를 출력하세요.
        단, 급여는 소수 이상 첫째자리에서 버림하여 출력하도록 하세요.
        그리고 커미션이 없는 사람은 0으로 가정하여 계산하도록 하세요.
        
*/
 
SELECT
    ename 사원이름, job 사원직급, 
    -- TRUNC(NVL(sal * 1.15 + comm, sal * 1.15), -1) 지급급여
    TRUNC(sal * 1.15 + NVL(comm, 0), -1) 지급급여
FROM
    emp
;

/*
    
    문제 7 ]
       
        급여를 100으로 나누어 떨어지는 사람만 
            사원이름, 직급, 급여를 조회하세요.
            
*/

SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    MOD(sal, 100) = 0
;
