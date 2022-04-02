/*
    
    문제 1 ]
        
        이름이 SMITH인 사원과 동일한 직급을 가진 사원들의 정보를 출력하세요.
        
*/

SELECT
    *
FROM
    emp
WHERE
    job = (
            SELECT
                job
            FROM
                emp
            WHERE
                ename ='SMITH'
        )
;

/*

    문제 2 ]
    
        회사 평균 급여보다 급여를 적게 받는 사원들의
        사원이름, 직급, 급여[, 회사평균급여]를 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE 
    sal < (
            SELECT
                AVG(sal)
            FROM
                emp
    )
;

/*
    
    문제 3 ]
        
        사원들 중 급여가 제일 높은 사원의
        사원이름, 직급, 급여[, 최고급여]를 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    sal IN (
            SELECT
                MAX(sal)
            FROM
                emp
                )
;

/*
    
    문제 4 ]
        
        KING 사원보다 이후에 입사한 사원들의
        사원이름, 직급, 입사일[, KING 사원 입사일]을 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
    hiredate > ANY (
                     SELECT
                         hiredate
                     FROM
                         emp
                     WHERE
                         hiredate LIKE '81/11/17'
                   )
;

/*
    
    문제 5 ]
    
        각 사원의 급여와 회사평균급여의 차를 출력하세요.
        사원이름, 급여, 급여의 차, 회사평균급여를 조회하세요.
        
*/

SELECT
    ename 사원이름, sal 급여, "급여의 차", AVG(sal) 회사평균급여
FROM
    emp, (
            SELECT
                sal - AVG(sal)
            FROM
                emp)
;

/*
    
    문제 6 ]
        
        부서별 급여의 합이 제일 높은 부서 사원들의
        사원이름, 직급, 부서번호, 부서이름, 부서급여합계, 부서원수를 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, deptno 부서번호, cnt 부서원수, sum 부서급여합계
FROM
    emp,
    ( SELECT
            deptno dno, COUNT(*) cnt, SUM(sal) sum
      FROM
            emp
      GROUP BY  
            deptno
    )
WHERE
    MAX(sal) IN (
                 SELECT
                    SUM(sal)
                 FROM
                    emp
                 GROUP BY
                    deptno
                    )
    AND deptno = dno
;

-- 급여의 합이 제일 높은 부서

SELECT
    deptno
FROM
    emp
GROUP BY
    deptno
HAVING
    SUM(sal) =
                (
                    SELECT
                        max(SUM(sal))
                    FROM
                        emp
                    GROUP BY
                        deptno
                )
;

SELECT
    ename 사원이름, job 직급, dno 부서번호, dname 부서이름, 
    sum 부서급여합계, cnt 부서원수
FROM
    emp e,
    dept d,
    (
        SELECT
            deptno dno, COUNT(*) cnt, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno        
    )
WHERE
    e.deptno = dno
    AND e.deptno = d.deptno
    AND e.deptno = (
                        SELECT
                            deptno
                        FROM
                            emp
                        GROUP BY
                            deptno
                        HAVING
                            SUM(sal) >= ALL
                                         (       
                                                SELECT
                                                    SUM(sal)
                                                FROM
                                                    EMP
                                                GROUP BY
                                                    DEPTNO
                                            )
                                            --  >=  ALL(10, 20, 30)
                        /*
                           
                            SUM(sal) =
                                         (       
                                                SELECT
                                                    MAX(SUM(sal))
                                                FROM
                                                    EMP
                                                GROUP BY
                                                    DEPTNO
                                            )
                                            
                        */
                    )
;

/*
    
    문제 7 ]
    
        커미션을 받는 사원이 한명이라도 있는 부서의 사원들의 
        사원이름, 직급, 부서번호, 커미션을 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, deptno 부서번호, comm 커미션
FROM
    emp
WHERE
    EXISTS (
            SELECT
                *
            FROM
                emp
            WHERE
                comm IS NOT NULL
            )
;

/*
    
    문제 8 ]
        
        회사평균급여보다 높고 이름이 4, 5글자인 사원들의
        사원이름, 급여, 이름글자길이[, 회사평균급여]를 조회하세요.
        
*/

SELECT
    ename 사원이름, sal 급여, LENGTH(ename) 이름글자길이
FROM
    emp
WHERE
    sal > (
            SELECT
                AVG(sal)
            FROM
                emp
            )
    AND LENGTH(ename) IN (4, 5)
;

/*
    
    문제 9 ]
    
        사원이름의 글자수가 4글자인 사원과 같은 직급을 가진 사원들의
        사원이름, 직급, 급여를 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    job IN (
            SELECT
                job
            FROM
                emp
            WHERE 
                LENGTH(ename) = 4)
;

/*
    
    문제 10 ]
        
        입사년도가 81년이 아닌 사원과 같은 부서에 있는 사원들의
        사원이름, 직급, 급여, 입사일, 부서번호를 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, sal 급여, hiredate 입사일, deptno 부서번호
FROM
    emp
WHERE
    deptno IN (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    TO_CHAR(hiredate, 'YY') <> '81')
;

/*

    문제 11 ]
    
        직급별 평균급여보다 한 직급이라도 급여를 많이 받는 사원의
        사원이름, 직급, 급여, 입사일을 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, sal 급여, hiredate 입사일
FROM
    emp
WHERE
    sal > ANY (
                SELECT
                    AVG(sal)
                FROM
                    emp
                GROUP BY
                    job
                )
;

/*

    문제 12 ]
        
        모든 년도별 입사자의 평균급여보다 많이 받는 사원들의
        사원이름, 직급, 급여, 입사년도를 조회하세요.
    
*/

SELECT
    ename 사원이름, job 직급, sal 급여, TO_CHAR(hiredate, 'YYYY') 입사년도
FROM
    emp
WHERE
    sal > ALL (
                SELECT
                    AVG(sal)
                FROM
                    emp
                GROUP BY    
                    TO_CHAR(hiredate, 'YYYY')
                )
;

/*
    
    문제 13 ]
    
        최고급여자의 이름 글자수와 같은 글자수의 직원이 존재하면
        모든 사원의 사원이름, 이름글자수, 직급, 급여를 조회하고
        존재하지 않으면 출력하지 마세요.
        
*/

SELECT
    ename 사원이름, LENGTH(ename) 이름글자수, job 직급, sal 급여
FROM
    emp
WHERE
    LENGTH(ename) EXISTS (
                            SELECT
                                LENGTH(ename)
                            FROM
                                emp
                             WHERE
                                MAX(sal)
                        )
;
