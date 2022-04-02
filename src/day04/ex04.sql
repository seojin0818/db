-- ANSI JOIN을 사용한 질의명령으로도 작성해보세요.

/*
    
    문제 1 ]
    
        직급이 MANAGER인 사원의
        사원이름, 직급, 입사일, 급여, 부서이름을 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, dname 부서이름
FROM
    emp, dept
WHERE
    emp.deptno = dept.deptno
    AND job = 'MANAGER'
;

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, dname 부서이름
FROM
    emp e INNER JOIN dept d
ON
    e.deptno = d.deptno
WHERE
    job = 'MANAGER'
;

/*
    
    문제 2 ]
    
        사원이름이 5글자인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급을 조회하세요.
        
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, grade 급여등급
FROM
    emp, salgrade
WHERE
    LENGTH(ename) = 5
    AND sal BETWEEN losal AND hisal
;

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, grade 급여등급
FROM
    emp INNER JOIN salgrade
ON
    sal BETWEEN losal AND hisal
WHERE
    LENGTH(ename) = 5
;

/*
    
    문제 3 ]
        
        입사일이 81년이고
        직급이 MANAGER인 사원들의
        사원이름, 직급, 입사일, 급여, 급여등급, 부서이름, 부서위치를 조회하세요.
    
*/

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, grade 급여등급, dname 부서이름, loc 부서위치
FROM
    emp e, salgrade, dept d
WHERE
    e.deptno = d.deptno -- 조인조건
    AND sal BETWEEN losal AND hisal -- 조인조건
    AND TO_CHAR(hiredate, 'YY') = '81'
    AND job = 'MANAGER'
;

SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, grade 급여등급, dname 부서이름, loc 부서위치
FROM
    emp e
JOIN
    salgrade
ON
    sal BETWEEN losal AND hisal
JOIN
    dept d
ON
    e.deptno = d.deptno
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
    AND job = 'MANAGER'
;

/*
    
    문제 4 ]
    
        사원들의 사원이름, 직급, 급여, 급여등급, 상사이름을 조회하세요.
        
        보너스 ]
            
            상사가 없는 사원은 상사이름을 '상사없음'으로 조회하세요.
            
*/

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, grade 급여등급, NVL(s.ename, '상사없음') 상사이름
FROM
    emp e, salgrade, emp s
WHERE
    e.sal BETWEEN losal and hisal
    AND e.mgr = s.empno(+) -- 사원의 상사번호는 상사의 사원번호
;

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, grade 급여등급, s.ename 상사이름
FROM
    emp e
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
LEFT JOIN
    emp s
ON
    e.mgr = s.empno
;

/*
    
    문제 5 ]
        
        사원들의 사원이름, 직급, 급여, 상사이름, 부서이름, 급여등급을 조회하세요.
        
        보너스 ]
            
            상사가 없는 사원은 상사이름을 '상사없음'으로 조회하세요.
            
*/

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, NVL(s.ename, '상사없음') 상사이름, dname 부서이름, grade 급여등급
FROM
    emp e, emp s, salgrade, dept d
WHERE
    e.mgr = s.empno(+)
    AND e.deptno = d.deptno
    AND e.sal BETWEEN losal AND hisal
;

SELECT
    e.ename 사원이름, e.job 직급, e.sal 급여, s.ename 상사이름, dname 부서이름, grade 급여등급
FROM
    emp e
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
JOIN
    emp s
ON
    e.mgr = s.empno
JOIN
    dept d
ON
    e.deptno = d.deptno
;

-- 위 문제들을 ANSI JOIN을 사용한 질의명령을 작성하세요.
