-- #day03

/*

    9. REPLACE()
    ==> ���ڿ��� Ư���κ��� �ٸ� ���ڿ��� ��ü�ؼ� ��ȯ���ִ� �Լ�
    
        ���� ]
            
            REPLACE(������, ã�� ����, ��ġ ����)
    
    10. TRIM()
        ==> ���ڿ� �߿��� �� �Ǵ� �ڿ� �ִ� ������ ���ڸ� �����ؼ� ��ȯ���ִ� �Լ�
        
            ���� ]
            
                �߰��� �ִ� ���ڴ� �������� ����
                
            ���� ]
                
                TRIM([������ ���� FROM ] ������)
                
            ���� ]
                
                ���� ���ڰ� ��, �ڿ� ���ӵǾ� ������ ��� ����
            
            ���� ]
                
                ���� ������ �� �Ǵ� �ڿ� ���鹮�ڰ� �� ��찡 ����
                �̷� ��츦 ����ؼ� �� �ڿ� �� ���� ���ڸ� ������ �������� ���� �����
                
                10 - 1
                    
                    LTRIM
                    RTRIM
                    
                    ���� ]
                        
                        LTRIM(������, ���� ����)
                        RTRIM(������, ���� ����)
    
    11. CHR()
        ==> ASCII �ڵ带 �˷��ָ� �� �ڵ忡 �ش��ϴ� ���ڸ� �˷��ִ� �Լ�
        
        ���� ]
            
            CHR(����)
    
    12. ASCII()
        ==> ���ڿ��� �ش��ϴ� ASCII �ڵ带 �˷��ִ� �Լ�
        
        ���� ]
            
            ASCII(������)
            
        ���� ]
            
            �� ���� �̻����� �� ���ڿ��� ����
            ù������ �ڵ尪�� ��ȯ����
            
    13. TRANSLATE()
        ==> REPLACE�� ���������� ���ڿ� �� ������ �κ���
            �ٸ� ���ڿ��� �ٲ㼭 ��ȯ���ִ� �Լ�
            
            ������ ]
            
                REPLACE()�� �ٲ� ���ڿ� ��ü�� �ٲٴµ�
                TRANSLATE()�� ���� ���� ó��
                
            ���� ]
            
                TRANSLATE(������, �ٲ� ���ڿ�, �ٲ� ���ڿ�)
    
                    
*/

SELECT
    REPLACE('hong gil dong', 'n', 'nn') ȫ�浿
FROM
    dual
;

SELECT
    REPLACE('   hong gil dong   ', ' ', '') ȫ�浿
FROM
    dual
; -- �߰��� �ִ� ������ REPLACE

SELECT
    TRIM('   hong gil dong   ') ȫ�浿
FROM
    dual
;

SELECT
    TRIM(' ' FROM '    hong gil dong   ') ȫ�浿
FROM
    dual
;

SELECT
    RTRIM(
        LTRIM('ooooooooooracleooooooooooo', 'o'),
        'o'
    ),
    TRIM('o' FROM 'ooooooooooracleooooooooooo')
FROM
    dual
;

-- ASCII()

SELECT
    ASCII('HONG') �ڵ尪,
    CHR(ASCII('HONG')) ���ĺ�
FROM
    dual
;

SELECT
    TRANSLATE('ADBC', 'ABCD', '1234')
    
    /*
    
        A ==> 1
        B ==> 2
        C ==> 3
        D ==> 4
        �� ��ȯ��
        
    */
    
FROM
    dual
;

--------------------------------------------------------------

/*

    ��¥ ó�� �Լ�
    
        **
        ���� ]
            
            SYSDATE
            ==> �����
                ���� �ý����� ��¥�� �ð��� �˷��ִ� �����
                (�ǻ� �÷����� ���� ��)
                
                
        ���� ]
            
            ��¥ - ��¥�� ����� ����
            ��¥ �������� - ������ �ϰ� ��
            
            ���� ]
                
                ��¥���� : ����.�ð�
                
        ���� ]
            
            ��¥�������� ������ ���� - ���길 ����
            ��¥ + ��¥, ��¥ * ��¥, ��¥ / ��¥�� ������� ����
            
        ���� ]
            
            ��¥ + (�Ǵ� -) ������ ������ ����
            ==> ��¥ ���� +(-) �����̹Ƿ�
                �ᱹ ��¥���� ���ϴ� ���ڸ�ŭ �̵��� ��¥�� ǥ����
            
            ��¥ �������� �������� 1970�� 1�� 1�� 0�� 0�� 0�ʸ� �������� ��

*/

-- ������� �ٹ��ϼ��� ��ȸ�ϼ���.

SELECT
    ename ����̸�,
    FLOOR(SYSDATE - hiredate) �ٹ��ϼ�
FROM
    emp
;

SELECT
    SYSDATE + 10 "10�� ��"
FROM
    dual
;

--------------------------------------------------------------

/*
    
    ��¥������ ó���Լ�
    
        1. ADD_MONTHS()
            ==> ���� ��¥�� ������ �޼��� ���ϰų� �� ��¥�� �˷���
            
            ���� ]
                
                ADD_MONTHS(��¥, ���� ������)
            
            ���� ]
                
                ���� �������� ������ �Է��ϸ�
                �ش� �������� �� ��¥�� �˷���
                
        2. MONTHS_BETWEEN
            ==> �� ��¥ �������� �������� �˷��ִ� �Լ�
            
        3. LAST_DAY
            ==> ������ ��¥�� ���Ե� ���� ������ ��¥�� �˷��ִ� �Լ�
                
            ���� ] LAST_DAY(��¥)
        
        4. NEXT_DAY
            ==> ������ ��¥ ���Ŀ� ���� ó�� ���� ������ ���Ͽ� �ش��ϴ� ��¥�� �˷��ִ� �Լ�
              
              ���� ] NEXT_DAY(��¥, '����')
                
                    ���� ]
                        
                        ���� ���ϴ� ���
                            
                            1. �츮�� �ѱ� ������ �� ����Ŭ�̹Ƿ�
                                '��', 'ȭ', '��', ...
                                '������', 'ȭ����', '������', ...
                                
                            2. �����ǿ�����
                                'SUN', 'MON', ...
                                'SUNDAY', 'MONDAY', ...
        
        5. ROUND()
            ==> ��¥�� ������ �κп��� �ݿø��ϴ� �Լ�
                �� �� ���� �κ��� ��, ��, ��, ...
                
                ���� ] ROUND(��¥, ���� ����)
                
                    ���� ]
                        
                        ���ش���
                            CC, SCC             : 4�ڸ� ������ �� �α��ڸ� �������� �ݿø�
                            
                            SYYY, YYYY, YEAR,   : �� (7�� 1�Ϻ��� �ݿø�) �� �������� �ݿø�
                            SYEAR, YYY, YY, Y
                            
                            DDD, D, J           : ���� �������� �ݿø�
                            
                            HH, HH12, HH24      : �ø� �������� �ݿø�
                            
                            Q                   : �� �б��� �ι�° ���� 16���� �������� �ݿø�
                            
                            MONTH, MON, MM, RM  : �� (16���� ��������) �������� �ݿø�
                            
                            DAY, DY, D          : �� �ְ� ���۵Ǵ� ��¥�� �������� �ݿø�
                            
                            MI                  : ���� �������� �ݿø�
                
*/

SELECT
    ADD_MONTHS(SYSDATE, 4) "4���� ��",
    ADD_MONTHS(SYSDATE, -3) "3���� ��"
FROM
    dual
;

-- ������� �ٹ��������� ��ȸ�ϼ���.

SELECT
    ename ����̸�,
    hiredate �Ի���,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "�ٹ�������"
FROM
    emp
;

-- �̹��� ������ ��¥�� ��ȸ�ϼ���.

SELECT LAST_DAY(SYSDATE) FROM dual;

-- ������� ù��° ������ ��ȸ�ϼ���. �޿� ������ �ſ� ���Ϸ� �Ѵ�.

SELECT 
    ename ����̸�, sal �޿�, hiredate �Ի���, LAST_DAY(hiredate) ù�޿���
FROM
    emp
;

-- ������� ù��° ������ ��ȸ�ϼ���. �޿������� �ſ� 1�Ϸ� �Ѵ�.

SELECT
    ename ����̸�, sal �޿�, hiredate �Ի���, (LAST_DAY(hiredate) + 1) ù�޿���
FROM
    emp
;

-- �̹��� �Ͽ����� ��ĥ���� ��ȸ�ϼ���.

SELECT
    NEXT_DAY(SYSDATE, '��')
FROM
    dual
;

-- �� ��ź�� ���� ù ������� ��ȸ�ϼ���.

SELECT
    NEXT_DAY('2022/12/25', '��') "ù�����"
    -- �� ���� ��¥ �����͸� �Է��ؾ� ������
    -- ���ڷ� �Է��ص� ����Ǵ� ������ ���� �����͸� ��¥ �����ͷ� ��ȯ���ִ�
    -- �Լ��� �ڵ� ȣ��Ǿ� ��¥ �����ͷ� ��ȯ���ֱ� ������
    -- NEXT_DAY(TO_DATE('2022/12/25', 'YYYY/MM/DD'), '��') "ù�����"
FROM
    dual
;

-- ���� �ð��� �⵵�� �������� �ݿø��ϼ���.

SELECT TO_CHAR(ROUND(SYSDATE, 'YEAR'), 'YYYY/MM/DD HH24:mi:ss') �ݿø� FROM dual;

-- ���� �ð��� ���� �������� �ݿø��ϼ���.

SELECT ROUND(SYSDATE, 'MONTH') ���ݿø� FROM dual;

--------------------------------------------------------------

/*

    ��ȯ�Լ�
    ==> �Լ��� ������ ���¿� ���� ����ϴ� �Լ��� �޶���
        �׷��� ���� ����Ϸ��� �����Ͱ� �Լ��� �ʿ��� �����Ͱ� �ƴ� ��쿡��
        �������� ���¸� ��ȯ�ؼ� ����ؾ� ��
        ==> �������� ���¸� �ٲپ Ư�� �Լ��� ��밡���ϵ��� ������ִ� �Լ�
        
                    TO_CHAR()           TO_CHAR()
                     ------>             <------
        NUMBER       <----->     CHAR    <----->     DATE
                     <------             ------>
                    TO_NUMBER()         TO_DATE()
                    
    1. TO_CHAR()
        ==> ��¥�� ���ڸ� ���� �����ͷ� ��ȯ�����ִ� �Լ�
            
        ���� 1 ]
            
            TO_CHAR(��¥ �Ǵ� ����)
            
        ���� 2 ]
            
            TO_CHAR(��¥ �Ǵ� ����, ����)
            ==> �ٲ� �� ���ϴ� ���¸� �����ؼ� ���ڿ��� ��ȯ��Ű�� ���
            
            ���� ]
            
                ���ڸ� ���ڷ� ��ȯ�� �� �������� ����ϴ� ����
                    9   - ��ȿ���ڴ� ǥ������ ����
                    0   - ��ȿ���ڵ� ǥ����
            
            ���� ]
                
                ��¥ ��� ����
                    YYYY, YY    : �⵵
                    MM          : ��
                    MON         : ���� ���ĺ����� ǥ��
                    DAY         : ����
                    DY          : ������ ���ڷ� ǥ��
                    HH          : �ð��� 12��������
                    HH24        : �ð��� 24��������
                    MI          : ��
                    SS          : ��
                    
    2. TO_DATE()
        ==> ���ڷ� �� ������ ��¥ �����ͷ� ��ȯ�����ִ� �Լ�
        
            ���� 1 ]
            
                TO_DATE(��¥ ���� ���ڿ�)
            
            ���� 2 ]
            
                TO_DATE(��¥ ������ ���� ������, '��ȯ����')
                ==> ���ڿ��� ����Ŭ�� �����ϴ� ������ ��¥ó��
                    ������ ���� ��� ����ϴ� ���
                    
                    '12/09/91'ó�� ��, ��, ���� ������ ���ڰ� �������
                    
                    ���� ]
                    
                     ���⿡���� ��ȯ�����̶�?
                     �Է��� ���� �����Ͱ� � �ǹ̸� ������ �����������
                     �˷��ִ� ���
        
    3. TO_NUMBER()
        ==> ���� ������ ���� �����͸� ���ڷ� ��ȯ�����ִ� �Լ�
            ���� �����ʹ� +, - ������ �� ��
            
            ���� 1]
                
                TO_NUMBER(���� ������)
                
            ���� 2 ]
                
                TO_NUMBER(������, ��ȯ����)
                
                ��ȯ����
                    
                    ���� ���ڿ��� � �ǹ̷� ������������� �˷��ִ� ���
                    
                '1,234' + '5,678'
    
*/

/*

    ������� ����̸�, �Ի���, �μ���ȣ�� ��ȸ�ϼ���.
    ��, �Ի����� '0000�� 00�� 00��'�� �������� ��ȸ�ǰ� �ϼ���.
    
*/

SELECT
    ename ����̸�, TO_CHAR(hiredate, 'YYYY') || '�� ' || TO_CHAR(hiredate, 'MM') || '�� ' || TO_CHAR(hiredate, 'DD') || '��' �Ի���,
    TO_CHAR(hiredate, 'YYYY"�� "MM"�� "DD"��"') �ѱ��Ի���,
    deptno �μ���ȣ
FROM
    emp
;

-- �޿��� 100 ~ 999 ������ ����� ������ ��ȸ�ϼ���.

SELECT
    ename, sal
FROM
    emp
WHERE
    sal BETWEEN 100 AND 999
;

SELECT
    ename, sal
FROM
    emp
WHERE
--   TO_CHAR(sal) LIKE '___'
    LENGTH(TO_CHAR(sal)) = 3
;

-- ��� �޿��� ��ȸ�ϴµ� �տ��� $�� ���̰� 3�ڸ����� ,�� �ٿ��� ��ȸ�ϼ���.

SELECT
    ename ����̸�, sal �޿�, TO_CHAR(sal, '$9,999,999,999,999') ���ڱ޿�1,
    TO_CHAR(sal, '$0, 000, 000') ���ڱ޿�2
FROM
    emp
;

--------------------------------------------------------------

-- TO_DATE()

-- ���ݱ��� ��ĥ���� ��� �ִ��� �˾ƺ���.
-- ��Ʈ ] ���� �ð� - �������

SELECT 
    FLOOR(SYSDATE - TO_DATE('96/08/18')) "��ƿ� �� ��", -- * 3 AS "��׸� ��"
    FLOOR(SYSDATE - TO_DATE('19960818')) "�� ��" -- . , # , _ �� ����
FROM
    dual
;

SELECT FLOOR(SYSDATE - TO_DATE('08/18/1996', 'MM/DD/YYYY')) �곯 FROM dual;

SELECT FLOOR(SYSDATE - TO_DATE('08181996', 'MMDDYYYY')) �곯 FROM dual;

--------------------------------------------------------------

-- TO_NUMBER

-- '123'�� '456'�� ���� ����� ��ȸ�ϼ���.

SELECT '123' + '456' result FROM dual; -- �� ��� ����ȯ �Լ��� �ڵ� ȣ��Ǳ� ������ ��� ����

SELECT TO_NUMBER('123') + TO_NUMBER('456') result FROM dual; -- ����

SELECT '1,234' + '5,678' FROM dual; -- ���ڿ��� , �ȵ��ϱ�

SELECT TO_NUMBER('1,234', '9,999,999') + TO_NUMBER('5,678', '9,999,999') FROM dual;

--------------------------------------------------------------

/*

    ��Ÿ �Լ�
    
    1. NVL()
        ==> NULL �����ʹ� ��� ����(�Լ�)�� ������� ����
            �� ������ �ذ��ϱ� ���� ���õ� �Լ�
            
            �ǹ� ]
                
                NULL �����͸� ������ ������ �����ͷ� �ٲ㼭
                ����, �Լ��� �����ϵ��� �ϼ���.
                
            ���� ]
                
                NVL(������, �ٲ� ����)
                
            ***
            ���� ]
                
                ������ �����Ϳ� �ٲ� ������ �ݵ�� ���°� ��ġ�ؾ� ��
                
    2. NVL2()
        
            ���� ]
                
                NVL2(�ʵ��̸�, ó������1, ó������2)
                
            �ǹ� ]
                
                �ʵ��� ������ NULL�̸� ó������2��,
                NULL�� �ƴϸ� ó������1���� ó��
                
    3. NULLIF
        
            ���� ]
            
                NULLIF(������1, ������2)
            
            �ǹ� ]
                
                �� �����Ͱ� ������ NULL�� ó���ϰ�
                �� �����Ͱ� �ٸ��� ������1���� ó��
                
    4. COALESCE()
        
            ���� ]
                
                COALESCE(������1, ������2, ...)
                
            �ǹ� ]
            
                �������� ������ �� ���� ù��° ������ NULL�� �ƴ� �����͸� ����ϼ���.
    
*/

SELECT
    ename ����̸�, 
--    NVL(comm, 'NONE') Ŀ�̼� -- ��ü�� ������ ���°� �ٸ��Ƿ� ���� �߻�
    NVL(TO_CHAR(comm), 'NONE') Ŀ�̼�
    
    /*
        
        �ݵ�� �����Ϳ� ��ü�� �������� ���´� ��ġ������� ��
        
    */
    
FROM
    emp
;

-- NVL2
-- Ŀ�̼��� ������ �޿��� �޿� + Ŀ�̼����� ����ϰ�
-- Ŀ�̼��� ������ �޿��� �޿��� ����ϼ���.

SELECT
    ename, NVL2(comm, sal + comm, sal) �޿�
FROM
    emp
;

-- Ŀ�̼��� ����ϴµ� ���� Ŀ�̼��� NULL�̸� �޿��� ��� ����ϵ��� �ϼ���.

SELECT
    ename, sal, comm, COALESCE(comm, sal, -1000)
FROM
    emp
;

/*
    
    ���� 1 ]
        
        comm�� �����ϸ� 
            ���� �޿��� 10%�� �λ��� �ݾ� + Ŀ�̼���  
        comm�� �������� ������
            ���� �޿��� 5%�� �λ��� �ݾ� + 100���� ��ȸ�ϼ���.
            
        ��ȸ������ ����̸�, �޿�, Ŀ�̼�, ���ޱ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, sal �޿�, comm Ŀ�̼�, NVL2(comm, sal * 1.1 + comm, sal * 1.05 + 100) ���ޱ޿�
FROM
    emp
;

SELECT
    ename �̸�, sal �޿�, comm Ŀ�̼�, COALESCE(sal * 1.1 + comm, sal * 1.05 + 100) ���ޱ޿�
FROM
    emp
;

/*
    
    ���� 2 ]
        
        Ŀ�̼ǿ� 50%�� �߰��ؼ� �����ϰ��� �Ѵ�.
        ���� Ŀ�̼��� �������� ������
        �޿��� �̿��ؼ� 10%�� �����ϰ��� �Ѵ�.
        ����̸�, �޿�, Ŀ�̼�, ���ޱ޿��� ��ȸ�ϼ���.
        
*/

SELECT
    ename ����̸�, sal �޿�, comm Ŀ�̼�, NVL2(comm, comm * 1.5, sal * 1.1) ���ޱ޿�
FROM
    emp
;

SELECT
    ename ����̸�, sal �޿�, comm Ŀ�̼�, COALESCE(comm * 1.5, sal * 1.1) ���ޱ޿�
FROM
    emp
;

--------------------------------------------------------------

/*
    
    ���� ó�� �Լ�
    ==> �Լ���⺸�ٴ� ������ ���ɿ� �����
        �ڹ��� switch ~ case, if�� ����ϱ� ���ؼ� �������� ��
        
    1. DECODE() : switch ~ case ���ɿ� �ش��ϴ� �Լ�
    
        ���� ]
            
            DECODE(�ʵ��̸�, ��1, ó������1,
                            ��2, ó������2,
                            ...
                            ó������n)
                            
        �ǹ� ]
        
            �ʵ��� ������
                ��1�� ������ ó������1��
                ��2�� ������ ó������2��
                ...
                �� �̿��� ���� ó������n���� ó��
                
        ���� ]
        
            DECODE �Լ� �������� ���ǽ��� ����� �� ����
            
    2. CASE : IF ���ɿ� �ش��ϴ� ����
        
        ���� 1 ]
            
            CASE    WHEN    ���ǽ�1    THEN    ����1
                    WHEN    ���ǽ�2    THEN    ����2
                    ...
                    ELSE ����n
            END
            
        �ǹ� ]
            
            ���ǽ�1�� ���̸� ����1��
            ���ǽ�2�� ���̸� ����2��
            ...
            �� �̿ܿ��� ����n�� �����ϼ���.
            
                  
        ���� 2 ]
        
            CASE    �ʵ��̸�    WHEN    ��1  THEN    ���೻��1
                                WHEN    ��2  THEN    ���೻��2
                                ...
                                ELSE    ���೻��N
            END
            
        �ǹ� ]
            
            DECODE �Լ��� ������ �ǹ�
            ��, ���������� ����񱳸� ����ϴ� ����
            
*/

/*

    ������� ����̸�, �������, �μ���ȣ, �μ��̸��� ��ȸ�ϼ���.
    �μ��̸���
        �μ���ȣ�� 10�̸� ȸ���
                   20�̸� ������
                   30�̸� ������
                   �������� �����η� ó���ϼ���.
                    
*/

SELECT
    ename ����̸�, job �������, deptno �μ���ȣ, 
    DECODE(deptno, 10, 'ȸ���',
                   20, '������',
                   30, '������',
                   '������'
    ) �μ��̸�
FROM
    emp
;

/*
    
    �޿��� 1000 �̸��̸� 20%�� �λ��ϰ�
            1000 ~ 3000 �̸��̸� 15%�� �λ��ϰ�
            3000 �̻��̸� 10%�� �λ��Ͽ�
    ������� ����̸�, ����, �޿�, �λ�޿��� ��ȸ�ϼ���.

*/

SELECT
    ename ����̸�, job ����, sal �޿�,
    FLOOR(
        CASE    WHEN sal < 1000 THEN sal * 1.2
                WHEN sal < 3000 THEN sal * 1.15
                ELSE sal * 1.1
        END
    ) "�λ�޿�"
FROM
    emp
;

--------------------------------------------------------------

/*

    �׷��Լ�
    ==> �������� �����͸� �ϳ��� ���� ���𰡸� ����ϴ� �Լ�
    
        ***
        ���� ]
            
            �׷��Լ��� ����� ���� �Ѱ��� ������ ��
            ���� �׷��Լ��� 
            ����� ������ ������ ���(������ �Լ�, �� �ʵ�)�� ȥ���ؼ� ����� �� ����
            ���� ����� ���ٷθ� ������ �Ͱ��� ȥ�� ����
            
        1. SUM
        ==> �������� �հ踦 ���ϴ� �Լ�
            ���� ] SUM(�ʵ��̸�)
        
        2. AVG
        ==> �������� ����� ���ϴ� �Լ�
            ���� ] AVG(�ʵ��̸�)
            
            ���� ]
            
                NULL �����ʹ� ��� ���꿡�� ���ܵǱ� ������
                ����� ���ϴ� ���꿡���� ������ ���ܵ�
        
        3. COUNT
        ==> �����͵��� ������ ���ϴ� �Լ�
            ������ �ʵ� �߿��� �����Ͱ� �����ϴ� �ʵ��� ������ �˷��ִ� �Լ�
            ���� ] COUNT(�ʵ��̸�)
            
            ���� ]
            
                �ʵ��̸� ��� *�� ����ϸ�
                ���� �ʵ��� ī���͸� ���� ���� ��
                �� ��� �߿��� ���� ū���� �˷��ְ� ��
        
        4. MAX / MIN
        ==> ������ �ʵ��� ������ �߿��� ���� ū��(�Ǵ� ������)�� �˷��ִ� �Լ�
        
        5. STDDEV
        ==> ǥ�������� ���ϴ� �Լ�
        
        6. VARIANCE
        ==> �л��� ���ϴ� �Լ� 
        
*/

SELECT
    SUM(sal) �ѱ޿���, MAX(sal) �ִ�޿�, MIN(sal) �ּұ޿�,
    FLOOR(AVG(sal)) �޿����, COUNT(*) �����
FROM
    emp
;

SELECT AVG(comm), FLOOR(2200 / 14) ������ FROM emp;

--------------------------------------------------------------

/*
    
    GROUP BY
    ==> �׷��Լ��� ����Ǵ� �׷��� �����ϴ� ��
        ��ȸ�� �� �� ����� �׷����� �ؼ� ��ȸ�ϴ� ���
        
        �� ]
            
            �μ����� �޿��� �հ踦 ���ϰ� ����
            ���޺��� �޿��� ����� ��ȸ�ϰ� ����
            
        ���� ]
        
            SELECT
                �׷��Լ�, �׷�����ʵ�
            FROM
                ���̺��̸�
            [WHERE
                ���ǽ�]
            GROUP BY
                �ʵ��̸�
            [HAVING
                ����]
            ORDER BY
                �ʵ��̸�...
            ;
            
        ���� ]
            
            GROUP BY�� ����ϴ� ��쿡��
            GROUP BY�� ����� �ʵ�� ���� ��ȸ�� �� ����
            
        HAVING
        ==> �׷�ȭ�� ��� ���� �׷� �߿��� ��¿� ����� �׷��� �����ϴ� ���ǽ��� ����ϴ� ��
        
            ***
            ���� ]
                
                WHERE �������� ��꿡 ���Ե� �����͸� �����ϴ� ������
                HAVING �������� �׷�ȭ�ؼ� ����� �� ������� ������ �����ϴ� ������
                
            *****
            ���� ]
                
                WHERE �� �ȿ����� �׷��Լ� ��� �Ұ�
                ������ HAVING �� �ȿ����� �׷��Լ� ��� ����
    
*/

-- ���޺� �޿������ ���޸��� �Բ� ��ȸ�ϼ���.

SELECT
    job ���޸�, FLOOR(AVG(sal)) ������ձ޿�
FROM
    emp
GROUP BY
    job
;

/*

    �μ��� �ִ�޿��� ��ȸ�ϴµ�
    �μ���ȣ��
        10  ȸ���
        20  ������
        30  ������
        �� �ܴ̿� �����η� ��ȸ�ǰ� �ϰ�
    
    �μ���ȣ, �μ��̸�, �μ��ִ�޿��� ��ȸ�ϼ���.

*/

SELECT
    deptno �μ���ȣ, 
    DECODE(deptno, 10, 'ȸ���',
                   20, '������',
                   30, '������',
                   '������'
    ) �μ��̸�, 
    MAX(sal) �μ��ִ�޿�
FROM
    emp
GROUP BY
    deptno
;

-- �μ��� ��� �޿��� ��ȸ�ϼ���. ��, �μ� ��� �޿��� 2000 �̻��� �μ��� ��ȸ�ǰ� �ϼ���.

SELECT
    deptno �μ���ȣ, FLOOR(AVG(sal)) �μ���ձ޿�
FROM
    emp
GROUP BY
    deptno
HAVING
    AVG(sal) >= 2000
;

-- ���޺� ������� ��ȸ�ϼ���.
-- ��, ������� 1���� ������ ��ȸ���� �ʰ� �ϼ���.

SELECT
    job ����, COUNT(*) �����
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(*) > 1
;