/*
    
    ���� 1 ]
        
        �̸��� SMITH�� ����� ������ ������ ���� ������� ������ ����ϼ���.
        
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

    ���� 2 ]
    
        ȸ�� ��� �޿����� �޿��� ���� �޴� �������
        ����̸�, ����, �޿�[, ȸ����ձ޿�]�� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, sal �޿�
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
    
    ���� 3 ]
        
        ����� �� �޿��� ���� ���� �����
        ����̸�, ����, �޿�[, �ְ�޿�]�� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, sal �޿�
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
    
    ���� 4 ]
        
        KING ������� ���Ŀ� �Ի��� �������
        ����̸�, ����, �Ի���[, KING ��� �Ի���]�� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, hiredate �Ի���
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
    
    ���� 5 ]
    
        �� ����� �޿��� ȸ����ձ޿��� ���� ����ϼ���.
        ����̸�, �޿�, �޿��� ��, ȸ����ձ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, sal �޿�, "�޿��� ��", AVG(sal) ȸ����ձ޿�
FROM
    emp, (
            SELECT
                sal - AVG(sal)
            FROM
                emp)
;

/*
    
    ���� 6 ]
        
        �μ��� �޿��� ���� ���� ���� �μ� �������
        ����̸�, ����, �μ���ȣ, �μ��̸�, �μ��޿��հ�, �μ������� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, cnt �μ�����, sum �μ��޿��հ�
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

-- �޿��� ���� ���� ���� �μ�

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
    ename ����̸�, job ����, dno �μ���ȣ, dname �μ��̸�, 
    sum �μ��޿��հ�, cnt �μ�����
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
    
    ���� 7 ]
    
        Ŀ�̼��� �޴� ����� �Ѹ��̶� �ִ� �μ��� ������� 
        ����̸�, ����, �μ���ȣ, Ŀ�̼��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ, comm Ŀ�̼�
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
    
    ���� 8 ]
        
        ȸ����ձ޿����� ���� �̸��� 4, 5������ �������
        ����̸�, �޿�, �̸����ڱ���[, ȸ����ձ޿�]�� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, sal �޿�, LENGTH(ename) �̸����ڱ���
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
    
    ���� 9 ]
    
        ����̸��� ���ڼ��� 4������ ����� ���� ������ ���� �������
        ����̸�, ����, �޿��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, sal �޿�
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
    
    ���� 10 ]
        
        �Ի�⵵�� 81���� �ƴ� ����� ���� �μ��� �ִ� �������
        ����̸�, ����, �޿�, �Ի���, �μ���ȣ�� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���, deptno �μ���ȣ
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

    ���� 11 ]
    
        ���޺� ��ձ޿����� �� �����̶� �޿��� ���� �޴� �����
        ����̸�, ����, �޿�, �Ի����� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, sal �޿�, hiredate �Ի���
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

    ���� 12 ]
        
        ��� �⵵�� �Ի����� ��ձ޿����� ���� �޴� �������
        ����̸�, ����, �޿�, �Ի�⵵�� ��ȸ�ϼ���.
    
*/

SELECT
    ename ����̸�, job ����, sal �޿�, TO_CHAR(hiredate, 'YYYY') �Ի�⵵
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
    
    ���� 13 ]
    
        �ְ�޿����� �̸� ���ڼ��� ���� ���ڼ��� ������ �����ϸ�
        ��� ����� ����̸�, �̸����ڼ�, ����, �޿��� ��ȸ�ϰ�
        �������� ������ ������� ������.
        
*/

SELECT
    ename ����̸�, LENGTH(ename) �̸����ڼ�, job ����, sal �޿�
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
