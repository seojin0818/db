-- ANSI JOIN�� ����� ���Ǹ�����ε� �ۼ��غ�����.

/*
    
    ���� 1 ]
    
        ������ MANAGER�� �����
        ����̸�, ����, �Ի���, �޿�, �μ��̸��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, dname �μ��̸�
FROM
    emp, dept
WHERE
    emp.deptno = dept.deptno
    AND job = 'MANAGER'
;

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, dname �μ��̸�
FROM
    emp e INNER JOIN dept d
ON
    e.deptno = d.deptno
WHERE
    job = 'MANAGER'
;

/*
    
    ���� 2 ]
    
        ����̸��� 5������ �������
        ����̸�, ����, �Ի���, �޿�, �޿������ ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, grade �޿����
FROM
    emp, salgrade
WHERE
    LENGTH(ename) = 5
    AND sal BETWEEN losal AND hisal
;

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, grade �޿����
FROM
    emp INNER JOIN salgrade
ON
    sal BETWEEN losal AND hisal
WHERE
    LENGTH(ename) = 5
;

/*
    
    ���� 3 ]
        
        �Ի����� 81���̰�
        ������ MANAGER�� �������
        ����̸�, ����, �Ի���, �޿�, �޿����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
    
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, grade �޿����, dname �μ��̸�, loc �μ���ġ
FROM
    emp e, salgrade, dept d
WHERE
    e.deptno = d.deptno -- ��������
    AND sal BETWEEN losal AND hisal -- ��������
    AND TO_CHAR(hiredate, 'YY') = '81'
    AND job = 'MANAGER'
;

SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, grade �޿����, dname �μ��̸�, loc �μ���ġ
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
    
    ���� 4 ]
    
        ������� ����̸�, ����, �޿�, �޿����, ����̸��� ��ȸ�ϼ���.
        
        ���ʽ� ]
            
            ��簡 ���� ����� ����̸��� '������'���� ��ȸ�ϼ���.
            
*/

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, grade �޿����, NVL(s.ename, '������') ����̸�
FROM
    emp e, salgrade, emp s
WHERE
    e.sal BETWEEN losal and hisal
    AND e.mgr = s.empno(+) -- ����� ����ȣ�� ����� �����ȣ
;

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, grade �޿����, s.ename ����̸�
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
    
    ���� 5 ]
        
        ������� ����̸�, ����, �޿�, ����̸�, �μ��̸�, �޿������ ��ȸ�ϼ���.
        
        ���ʽ� ]
            
            ��簡 ���� ����� ����̸��� '������'���� ��ȸ�ϼ���.
            
*/

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, NVL(s.ename, '������') ����̸�, dname �μ��̸�, grade �޿����
FROM
    emp e, emp s, salgrade, dept d
WHERE
    e.mgr = s.empno(+)
    AND e.deptno = d.deptno
    AND e.sal BETWEEN losal AND hisal
;

SELECT
    e.ename ����̸�, e.job ����, e.sal �޿�, s.ename ����̸�, dname �μ��̸�, grade �޿����
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

-- �� �������� ANSI JOIN�� ����� ���Ǹ���� �ۼ��ϼ���.
