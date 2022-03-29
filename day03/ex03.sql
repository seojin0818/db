-- ��Ÿ �Լ��� ó��

/*
    
    ���� 1 ]
        
        �� ���޺��� �ѱ� ��������
        ������� ����̸�, ����, �ѱ������� ��ȸ�ϼ���.
        
        MANAGER : ������
        SALESMAN : �������
        CLERK : ����
        ...
        
*/

SELECT
    job ����, ename ����̸�,
    DECODE(job, 'MANAGER', '������',
                'SALESMAN', '�������',
                'CLERK', '����',
                'ANALYST', '�м���',
                '����') �ѱ�����
FROM
    emp
;

/*
    
    ���� 2 ]
        
        �� �μ����� �̹��� ���ʽ��� �ٸ��� �����Ϸ��� �Ѵ�.
        10�� �μ��� �޿��� 10%
        20�� �μ��� �޿��� 15%
        30�� �μ��� �޿��� 20%�� �����ϱ�� �ߴ�.
        �׸��� �ű⿡ ������ Ŀ�̼��� ���ؼ� �޿��� �����ϱ�� �ߴ�.
        Ŀ�̼��� ���� ����� Ŀ�̼��� 0���� �ؼ� ����ؼ�
        ������� ����̸�, �μ���ȣ, �޿�, ���ޱ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, deptno �μ���ȣ, 
    DECODE(deptno, 10, sal * 1.1  + NVL(comm, 0),
                   20, sal * 1.15 + NVL(comm, 0),
                   30, sal * 1.2 + NVL(comm, 0)) ���ޱ޿�,
    sal �޿�
FROM
    emp
;

/*

    ���� 3 ]
        
        �Ի�⵵�� �������� �ؼ�
            80�� 'A���'
            81�� 'B���'
            82�� 'C���'
            �� �̿��� �ؿ� �Ի��� ����� 'D���'���� ��µǵ���
        ������� ����̸�, ����, �Ի���, ����� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'YY') �Ի���,
    DECODE(TO_CHAR(hiredate, 'YY'), '80', 'A���',
                                    '81', 'B���',
                                    '82', 'C���',
                                    'D���'
    ) ���
FROM
    emp
;

/*

    ���� 4 ] 
        
        ����̸��� ���ڼ��� 4���ڸ� 'Mr.'�� �̸� �տ� ���̰�
        4���ڰ� �ƴϸ� �ڿ� ' ��'���� ��µǵ���
        ������� ����̸�, �̸� ���ڼ�, ��ȸ�̸��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�,
    LENGTH(ename) "�̸� ���ڼ�", 
    CASE WHEN LENGTH(ename) = 4 THEN CONCAT('Mr.', ename)
        ELSE CONCAT(ename, ' ��')
    END ��ȸ�̸�
FROM
    emp
;

/*
    
    ���� 5 ]
        
        �μ���ȣ�� 10�� �Ǵ� 20���̸� �޿� + Ŀ�̼����� �����ϰ�
            �� �̿��� �μ��� �޿��� �����Ϸ��� �Ѵ�.
        ������� ����̸�, ����, �μ���ȣ, �޿�, Ŀ�̼�, ���ޱ޿��� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ���� 0���� ����ؼ� ����ϼ���.
        
*/

SELECT
    ename ����̸�, job ����, deptno �μ���ȣ,
    sal �޿�, comm Ŀ�̼�, 
    DECODE(deptno, 10, sal + NVL(comm, 0),
                   20, sal + NVL(comm, 0),
                   sal) ���ޱ޿�
FROM
    emp
;

/*

    ���� 6 ]
        
        �Ի������ �����, �Ͽ����� �����
            �޿��� 20% ���ؼ� �����ϰ�
            �� �̿��� ���Ͽ� �Ի��� �����
            �޿��� 10%�� ���ؼ� �����Ϸ��� �Ѵ�.
        ������� ����̸�, �޿�, �Ի���, �Ի����, ���ޱ޿��� ��ȸ�ϼ���.
    
*/

SELECT
    ename ����̸�, sal �޿�, hiredate �Ի���, TO_CHAR(hiredate, 'DAY') �Ի����,
    DECODE(TO_CHAR(hiredate, 'DAY'), '��', sal * 1.2,
                                     '��', sal * 1.2,
                                      sal * 1.1
    ) ���ޱ޿�
FROM
    emp
;

/*
    
    ���� 7 ]
    
        �ٹ��������� 490���� �̻��� �����
            Ŀ�̼��� 500�� �߰��ؼ� �����ϰ�
        �ٹ��������� 490���� �̸��� �����
            Ŀ�̼��� ���� Ŀ�̼Ǹ� �����ϵ��� �� �����̴�.
        ������� ����̸�, Ŀ�̼�, �Ի���, �ٹ�������, ����Ŀ�̼��� ��ȸ�ϼ���.
        ��, Ŀ�̼��� ���� ����� 0���� ����ϴ� ������ �Ѵ�.
        
*/

SELECT
    ename ����̸�, comm Ŀ�̼�, hiredate �Ի���, 
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) �ٹ�������, 
    FLOOR(
        CASE    WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) >= 490 THEN NVL(comm + 500, 0)
--              WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) < 490 THEN comm
                ELSE NVL(comm, 0)
        END
        ) ����Ŀ�̼�
FROM
    emp
;   

/*

    ���� 8 ]
    
        �̸� ���ڼ��� 5���� �̻��� ����� 
            �̸��� 3����***�� ǥ���ϰ�
        �̸� ���ڼ��� 4���� ������ ����� 
            �̸��� �״�� ����� �����̴�.
        ������� ����̸�, �̸� ���ڼ�, ��ȸ�̸��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, LENGTH(ename) "�̸� ���ڼ�",
    CASE WHEN LENGTH(ename) >= 5 THEN RPAD(SUBSTR(ename, 1, 3), LENGTH(ename), '*')
         WHEN LENGTH(ename) <= 4 THEN ename
    END ��ȸ�̸�
FROM
    emp
;

--------------------------------------------------------------

-- GROUP BY

/*
   
    ���� 1 ]
    
        �� �μ����� �ּ� �޿��� ��ȸ�Ϸ��� �Ѵ�.
        �� �μ��� �μ���ȣ, �ּұ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    deptno �μ���ȣ, MIN(sal) �ּұ޿�
FROM
    emp
GROUP BY
    deptno
;

/*
    
    ���� 2 ]
    
        �� ���޺��� �޿��� �Ѿװ� ��ձ޿��� ���ް� �Բ� ��ȸ�ϼ���.
        
*/

SELECT
    job ����, SUM(sal) �޿��Ѿ�, AVG(sal) ��ձ޿�
FROM
    emp
GROUP BY
    job
;

/*
   
    ���� 3 ]
    
        �Ի� �⵵���� ��ձ޿��� �ѱ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    TO_CHAR(hiredate, 'YY') �Ի�⵵, AVG(sal) ��ձ޿�, SUM(sal) �ѱ޿�
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YY')
;

/*
    
    ���� 4 ]
    
        �� �⵵���� �Ի��� ������� ��ȸ�ϼ���.
        
*/

SELECT
    TO_CHAR(hiredate, 'YY') �Ի�⵵, COUNT(*) �����
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YY')
;

/*
    
    ���� 5 ]
       
        ��� �̸��� ���ڼ��� �������� �׷�ȭ�ؼ� ��ȸ�Ϸ��� �Ѵ�.
        ��� �̸��� ���ڼ��� 4, 5 ������ ����� ���� ��ȸ�ϼ���.
        
*/

SELECT
    LENGTH(ename) "�̸� ���ڼ�", COUNT(*) �����
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
--    LENGTH(ename) BETWEEN 4 AND 5
      LENGTH(ename) in (4, 5)
;

/*
    
    ���� 6 ]
    
        81�⵵�� �Ի��� ����� ���� ���޺��� ��ȸ�ϼ���.
        
*/

SELECT
    job ����, COUNT(*) �����
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
GROUP BY
    job
;


/*
    
    ���� 7 ]
    
        ����̸��� ���ڼ��� 4, 5������ ����� ���� �μ����� ��ȸ�ϼ���.
        ��, ������� �ѻ�� ������ �μ��� ��ȸ���� �����ϼ���.
        
*/

SELECT
    deptno �μ���ȣ, COUNT(*) �����
FROM
    emp
WHERE
    LENGTH(ename) in (4, 5)
GROUP BY
    deptno
HAVING
    COUNT(*) > 1
;

/*
    
    ���� 8 ]
    
        81�⵵ �Ի��� ����� ��ü �޿��� ���޺��� ��ȸ�ϼ���.
        ��, ���޺� ��� �޿��� 1000 �̸��� ������ ��ȸ���� �����ϼ���.
        
*/

SELECT
    job ����, SUM(sal) �ѱ޿�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
GROUP BY
    job
HAVING
    NOT AVG(sal) < 1000
;

/*
    
    ���� 9 ]
    
        81�⵵ �Ի��� ����� �ѱ޿��� ����̸� ���ڼ����� �׷�ȭ�ϼ���.
        ��, �ѱ޿��� 2000 �̸��� ���� ��ȸ���� �����ϰ�
        �ѱ޿��� ���� �������� ���� ������� ��ȸ�ǰ� �ϼ���.
        
*/

SELECT
    LENGTH(ename) �̸����ڼ�, SUM(sal) �ѱ޿�
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'YY') = '81'
GROUP BY
    LENGTH(ename)
HAVING
    SUM(sal) >= 2000
ORDER BY 
    SUM(sal) DESC
;

/*
    
    ���� 10 ]
    
        ��� �̸� ���̰� 4, 5 ������ ����� �μ��� ������� ��ȸ�ϼ���.
        ��, ������� 0�� ���� ��ȸ���� �����ϰ�
        �μ���ȣ ������� ��ȸ�ϼ���.
        
*/

SELECT
    deptno �μ���ȣ, COUNT(*) �����
FROM
    emp
WHERE
    LENGTH(ename) in (4, 5)
GROUP BY
    deptno
HAVING
    COUNT(*) <> 0
ORDER BY
    deptno ASC
;

