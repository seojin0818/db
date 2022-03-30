-- #day04

/*

    ���� ]
        
        HAVING ��
        ==> �׷�ȭ�� ����� ���͸��� ��
            ���͸� ������ ����ϴ� ��
            
            ���� ]
            
                WHERE ������ �׷��Լ� ��� �Ұ�
                HAVING ������ �׷��Լ� ��� ����
                
*/

/*
   
    JOIN 
    ==> Relation Database Management System������ �������� �ߺ��� ���ϱ� ���ؼ�
        ���̺��� �и��ϰ� �׷��� �����ν� ���̺�� ���� ���谡 ���� �Ǿ���
        
        �׷��� �и��� ���̺��� �����͸� �����س� �� ����ϴ� ������ JOIN
        
        ���� ]
        
            ����Ŭ ���� ER ������ �����ͺ��̽�
            ER
                ��ƼƼ(���̺�)������ ���踦 �̾߱��ϰ�
                �̷� ������ ���̺��� �����ϴ� �����ͺ��̽��� �����������ͺ��̽���� ��
        
        ���� ]
        
            �����������ͺ��̽������� �������� ���̺��� ���ÿ� �˻��ϴ� ����� �̹� ������ ����
            ==> �� �� �������� ���̺��� �����͸� ���ÿ� �˻��ϸ�
                Cartesian Product(CROSS JOIN)�� ��������µ�
                �� ������� ��Ȯ���� ���� �����͵� ���ԵǾ� ����
                ���� ��Ȯ�� �����͸� ���͸��ؼ� �����;� �ϴµ�
                �� �� �� ���͸��ϴ� �۾��� JOIN
        
        ���� ]
        
            Inner Join
            ==> ������ ���̺���� ������� �ȿ��� �������� ����
                Equi Join
                ==> ������ �� �� ����񱳿����ڷ� �����ϴ� ���
                
                Non Equi Join
                ==> ������ �� �� ����񱳿����� �̿��� �����ڷ� �����ϴ� ���
                
            Outer Join
            ==> Cartesian Proudct�� ���Ե��� ���� �����͸� �������� ����
                
                ���� ]
                
                    ���̺��̸�.�ʵ��̸� = ���̺��̸�.�ʵ��̸�(+)
                    
                    �� �� (+)�� NULL�� ǥ���Ǿ�� �� ���̺� �ʿ� �ٿ���
                    
            Self Join
            ==> ������ �ϴµ� ��� ���̺��� ���� ���̺��� ����ϴ� ����
            
        ���� ]
            
            ���ο����� �ٸ� �Ϲ����� ��� ����
          
*/

-- ���������̸� ���̺�
DROP TABLE ecolor; -- ���̺� ���� ���
CREATE TABLE ecolor (
    ceno NUMBER(3) -- �����÷� �Ϸù�ȣ
        CONSTRAINT ECLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7) -- �÷� �ڵ尪
        CONSTRAINT ECLR_CODE_UK UNIQUE
        CONSTRAINT ECLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT ECLR_NAME_NN NOT NULL
);

-- ������ �߰�
INSERT INTO
    ecolor
VALUES(
    100, '#FF0000', 'red'
);

INSERT INTO
    ecolor
VALUES(
    101, '#00FF00', 'green'
);

INSERT INTO
    ecolor
VALUES(
    102, '#000FF', 'blue'
);

INSERT INTO
    ecolor
VALUES(
    103, '#800080', 'purple'
);

commit;

-- �����÷� ���̺� ��ȸ

SELECT * FROM ecolor;
COMMIT; -- �޸��� �۾��������� �۾��� ������ �����ͺ��̽��� �����Ű�� ���

CREATE TABLE Kcolor (
    cKno NUMBER(3)
        CONSTRAINT KCLR_NO_PK PRIMARY KEY,
    code VARCHAR2(7)
        CONSTRAINT KCLR_CODE_UK UNIQUE
        CONSTRAINT KCLR_CODE_NN NOT NULL,
    name varchar2(20)
        CONSTRAINT KCLR_NAME_NN NOT NULL
)

INSERT INTO
    kcolor
VALUES(
    100, '#FF0000', '����'
);

INSERT INTO
    kcolor
VALUES(
    101, '#00FF00', '���'
);

INSERT INTO
    kcolor
VALUES(
    102, '#000FF', '�Ķ�'
);

commit;

SELECT * FROM kcolor;

SELECT
    *
FROM
    ecolor, kcolor
;

SELECT
    *
FROM
    emp e, emp ee
;

SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code -- ��������
;

-- Outer Join

SELECT
    ceno cno, e.code, e.name ename, k.name kname
FROM
    ecolor e, kcolor k
WHERE
    e.code = k.code(+)
;

-- Self Join
-- ������� ����̸�, ����ȣ, ����̸�, ���޿��� ��ȸ�ϼ���.

SELECT
    e.ename ����̸�, e.mgr ����ȣ, s.ename ����̸�, s.sal ���޿�
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;

CREATE TABLE sangsa
as
    SELECT * FROM emp;

-- ������� ����̸�, ����, �޿�, �޿� ����� ��ȸ�ϼ���.

SELECT
    ename ����̸�, job ����, sal �޿�, grade �޿����
FROM
    emp, salgrade -- �÷��� ��ġ�� �ʱ� ������ ��Ī �� �ٿ��� ��
WHERE
    sal BETWEEN losal AND hisal -- ������� ���� �ʾ����Ƿ� Non Equi Join
;

-- ������� �����ȣ, ����̸�, ����, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.

SELECT
    empno �����ȣ, ename ����̸�, job ����, dname �μ��̸�, loc �μ���ġ
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno
;

-- 81�� �Ի��� ����� ����̸�, ����, �Ի���, �μ��̸��� ��ȸ�ϼ���.

SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �Ի���, dname �μ��̸�
FROM
    emp, dept
WHERE
    emp.deptno = dept.deptno    -- ���� ����
    AND TO_CHAR(hiredate, 'YY') = '81' -- �Ϲ� ����
;

SELECT 
*
FROM 
emp, salgrade
WHERE
    ename = 'SMITH'
    AND SAL BETWEEN losal AND hisal
;

---------------------------------------------------------------

/*

    ANSI JOIN
    ==> ���� ����� �����ͺ��̽�(DBMS)�� ���� �ణ�� �� ������ �޶���
    
        ANSI �����̶�
        �̱� ���� ǥ�� ��ȸ(ANSI)���� ������ ���� ����� ������� �ؼ�
        ���ϵ� ����� ����� ����� ���� ��
        ���� DBMS�� ������ �ʰ� ���� ��

---------------------------------------------------------------

    1. CROSS JOIN
        ==> ����Ŭ�� Cartesian Product�� �����ϴ� ����
        
        ���� ]
            
            SELECT
                �ʵ��̸�, ...
            FROM
                ���̺�1 CROSS JOIN ���̺�2
            ;
            
    2. INNER JOIN
        ==> Equi Join, Non Equi Join, Self Join
        
        ���� ]
            
            SELECT
                �ʵ��̸�, ...
            FROM
                ���̺�1 [INNER] JOIN ���̺�2
            ON
                ��������
            ;
            
        ���� ]
        
            ���������� ON ������ ����ϰ�
            �Ϲ������� WHERE ������ �����
            
        ���� ]
        
            INNER JOIN�� ���� �Ϲ����� �����̱� ������ INNER��� �ܾ �����ϸ�
            INNER JOIN�� �ؼ��ؼ� �����ϰ� ��
            
    3. OUTER JOIN
        ==> Cartesian Product�� ���� ����� ��ȸ�ϴ� ���� ���
        
        ���� ]
            
            SELECT
                �ʵ��̸�, ...
            FROM
                ���̺�1 LEFT �Ǵ� RIGHT �Ǵ� FULL OUTER JOIN ���̺�2 
                ==> �� �� ������ �����Ͱ� �ִ� ���̺� ������ ����ϸ� ��
            ON
                ��������
            ;
            
        ���� ]
            
            ������ 2�� �̻� �Ǵ� ���
            
                ���� ]
                        
                    SELECT
                    
                    FROM
                        ���̺��̸� 
                    JOIN 
                        ���̺�2
                    ON
                        ��������
                    JOIN
                        ���̺�3
                    ON
                        ��������2
                    ;
                    
*/

-- ANSI JOIN
-- CROSS JOIN
-- ��������� �μ������� ũ�ν� �����ϼ���.

SELECT
    *
FROM
    emp CROSS JOIN dept
;

-- INNER JOIN
-- ������� ����̸�, ����, �μ���ȣ, �μ��̸��� ��ȸ�ϼ���.

SELECT
    ename ����̸�, job ����, e.deptno �μ���ȣ, dname �μ��̸�
FROM
    emp e INNER JOIN dept d
ON -- ���� ������
    e.deptno = d.deptno
;

-- 81�� �Ի��� ������� ����̸�, ����, �Ի�⵵, �μ��̸��� ��ȸ�ϼ���.

SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YY') �Ի�⵵, dname �μ��̸�
FROM
    emp e INNER JOIN dept d
ON -- ��������
    e.deptno = d.deptno
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
;

-- ������� ����̸�, �޿�, �޿������ ��ȸ�ϼ���. Non Equi Join

SELECT
    ename ����̸�, sal �޿�, grade �޿����
FROM
    emp JOIN salgrade
ON
    sal BETWEEN losal AND hisal
;

-- ������� ����̸�, ����̸��� ��ȸ�ϼ���.

SELECT
    e.ename ����̸�, s.ename ����̸�
FROM
    emp e JOIN emp s
ON
    e.mgr = s.empno -- ANSI������ (+) ���� ����
;

-- ������� ����̸�, ����̸��� ��ȸ�ϼ���.

SELECT
    e.ename ����̸�, NVL(s.ename, '������') ����̸�
FROM
    emp e LEFT OUTER JOIN emp s
ON
    e.mgr = s.empno
;

-- ������� ����̸�, �μ��̸�, �޿�, �޿������ ��ȸ�ϼ���.

SELECT
    ename ����̸�, dname �μ��̸�, sal �޿�, grade �޿����
FROM
    emp e
JOIN
    dept d
ON
    e.deptno = d.deptno
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
;

---------------------------------------------------------------

/*
    
    NATURAL JOIN
    ==> �ڵ� ����
        �ݵ�� ���� ���ǽĿ� ����ϴ� �ʵ��� �̸��� �����ϰ�
        �ݵ�� ������ �ʵ尡 �Ѱ��� �� ����� �� �ִ� ����
        �ڵ����� �ߺ��Ǵ� �ʵ带 ����ؼ� ������ �ϱ� ������
        ���������� ������� ����
        
        ���� ]
        
            SELECT
                �ʵ��̸�, ...
            FROM
                ���̺�1
            NATURAL JOIN
                ���̺�2
            ;
            
    USING JOIN
    ==> �ݵ�� ���� ���ǽĿ� ����ϴ� �ʵ��� �̸��� ������ ���
        �׸��� ���� �̸��� �ʵ尡 ������ �����ص� ������
    
        ���� ]
            
            SELECT
                �ʵ��̸�, ...
            FROM
                ���̺�1
            JOIN
                ���̺�2
            USING
                (���ο� ����� �ʵ��̸�)
            ;
            
*/

-- ������� ����̸�, �μ��̸��� ��ȸ�ϼ���.

SELECT
    ename ����̸�, dname �μ��̸�
FROM
    emp
NATURAL JOIN
    dept
;

-- TMP ���̺�� �μ��������̺��� �̿��ؼ�
-- ������� ����̸�, �μ���ġ�� ��ȸ�ϼ���.

SELECT
    ename, loc
FROM
    tmp
JOIN
    dept
USING
    (dname)
;

---------------------------------------------------------------

/*

    ������(SUB QUERY, ��������)
    ==> ���Ǹ�� �ȿ� �ٽ� ���Ǹ���� �����ϴ� ���
        ���ԵǴ� �� ���Ǹ���� �������� �Ǵ� ��������
        
        �� ]
        
            �̸��� SMITH�� ����� ���� �μ��� �ִ� ������� ������ ��ȸ�ϼ���.
            ==> �� ��� SMITH�� �μ���ȣ�� �˾Ƴ��� ���ؼ� ���� ���Ǹ���� ����Ǿ�� ��
            
            ==> ������ �μ���ȣ�� �̿��ؼ� ������ ��ȸ
            
            �� �� ���� ���Ǹ���� �Ʒ� ���� ���Ǹ�ɿ��� ��ȸ�ؼ� ����ؾ� ��
            
        ���� ]
            
            �� �� �������Ǹ� ���δ� ���Ǹ���� ���� ���Ǹ���̶� �θ�
        
        ���������� ��ġ�� ���� ���
            
            1. SELECT ��
            ==> �� �κп� ���Ǵ� ���Ǹ���� ����� �ݵ�� �� ��, �� �ʵ尡 ���;� ��
            2. FROM ��
            ==> FROM ������ ���̺��� �����Ǿ�� ��
                �׷��� ��ȸ ���� ����� ����� ��ġ ���̺�� ����
                �׷��� �� ��ȸ ���� ����� ����� ���̺�ó�� ����� �� �ִ� ���
                
                �� �� FROM �� �ȿ� ���� �������Ǹ�
                Ư���� ��ġ ���̺�� ���� �ؼ�
                    INLINE TABLE�̶�� �θ�
                    
                �� �� ����� ���Ǹ���� ���� �� ����� ��Ī�� ����ؼ�
                �����͸� ������ ��
            
            3. WHERE ��
                1. ������ �����ʵ�� ����� �߻��ϴ� ���
                ==> ����� �񱳿� ����ϸ� ��
                2. ������ �����ʵ�� ����� �߻��ϴ� ���
                    
                    ���� ]
                        
                        ���������� ����� ���������� �߻��ϴ� ���
                        �� �� ����ϴ� ������
                        
                        IN  : �������� ������ �� �ϳ��� ������ �Ǵ� ���
                            ==> ���������� ������ �� �ϳ��� �����ó���� ��
                            
                        ANY : �������� ������ �� �ϳ��� ������ �Ǵ� ���
                            ==> ��Һ� �����ڵ� ��� ����
                            
                        ALL : �������� �����Ͱ� ��� ������ �Ǵ� ���
                            ==> ����񱳴� ����� �� ����
                                ��Һ��� �� ���
                        
                3. ������ �����ʵ�� ����� �߻��ϴ� ���
                    
                    EXISTS : ���Ǹ���� ����� ������ ��, ������ ����
            
*/

SELECT
    *
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
    )
;

-- ������� ����̸�, �μ���ȣ, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.

SELECT
    ename ����̸�, deptno �μ���ȣ, 
    (
        SELECT
            dname
        FROM
            dept
        WHERE
            deptno = e.deptno
    ) �μ��̸�,
    (
        SELECT
            loc
        FROM
            dept
        WHERE
            deptno = e.deptno
    ) �μ���ġ
    
FROM
    emp e
;

-- �������� ������ �����ʵ��� ���

-- SMITH ����� ������ �μ��� ������� ������ ��ȸ�ϼ���.

SELECT
    *
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
                )
;

-- 10�� �μ� ������� ���� ����� ��ȸ�ϼ���.

SELECT
    job �����̸�, AVG(sal) ���ޱ޿����
FROM
    emp
WHERE
    job IN (
            SELECT
                job
            FROM
                emp
            WHERE
                deptno = 10 -- ���Ǹ���� ����� ���߰����� �߻� 
                            --      MANAGER, PRESIDENT, CLERK
        )
GROUP BY
    job
;

---------------------------------------------------------------

-- IN ������
-- ������ MANAGER�� ����� ���� �μ��� ���� �������
--  ����̸�, ����, �μ���ȣ�� ��ȸ�ϼ���.

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ
FROM
    emp
WHERE
    deptno IN (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    job = 'MANAGER'
                )
;

-- ANY
-- �� �μ��� ��� �޿����� �� �μ��� �޿��� ���� �������
-- ����̸�, ����޿�, �μ���ȣ�� ��ȸ�ϼ���.

SELECT
    ename ����̸�, sal ����޿�, deptno �μ���ȣ
FROM
    emp
WHERE
    sal > ANY (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                deptno
            )
;

-- ��� �� �μ��� �޿� ��պ��� ���� �޿��� �޴� �������
-- ����̸�, ����޿�, �μ���ȣ�� ��ȸ�ϼ���.

SELECT
    ename ����̸�, sal ����޿�, deptno �μ���ȣ
FROM
    emp
WHERE
    sal > ALL (
            SELECT
                AVG(sal)
            FROM
                emp
            GROUP BY
                deptno
            )
;

-- ��� �� 40�� �μ� ����� �����ϸ� 
-- ��� ������� ����̸�, �μ���ȣ�� ��ȸ�ϼ���.

SELECT
    scott.emp.ename ����̸�, scott.emp.deptno �μ���ȣ
FROM
    scott.emp
    
    /*
        
        ���̺��� ����ų �� ��Ģ��
            ����.���̺��̸�
        �� �������� ����ؾ� ��
        ������ ���Ӱ����� ������ �ִ� ���̺� ���ؼ���
        ���̺��̸��� ����ص� ��
        
    */
    
WHERE
    EXISTS ( -- ������ NOT EXISTS�� ǥ��
                SELECT
                    *
                FROM
                    emp
                WHERE
                    deptno = 40
            )
;

---------------------------------------------------------------

-- ������� ����̸�, �μ���ȣ, �μ�����, �μ���ձ޿�, �μ��޿��հ踦 ��ȸ�ϼ���.

SELECT
    ename ����̸�, deptno �μ���ȣ, cnt �μ�����, avg �μ���ձ޿�, sum �μ��޿��հ�
FROM
    emp,
    (
        SELECT
            deptno dno, COUNT(*) cnt, ROUND(AVG(sal), 2) avg, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
;

---------------------------------------------------------------

-- ȸ�� ��ձ޿����� ���� �޴� �������
-- ����̸�, ����, �Ի���, �޿��� ��ȸ�ϼ���.

