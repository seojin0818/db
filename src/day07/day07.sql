-- #day07

/*

    �������� �߰��ϱ�
    
        ���� 1 ]
            
            �÷��̸�    ������Ÿ��(����)
                CONSTRAINT  ���������̸�  PRIMARY KEY
                CONSTRAINT  ���������̸�  REFERENCES ���̺��̸�(�÷��̸�)
                CONSTRAINT  ���������̸�  UNIQUE
                CONSTRAINT  ���������̸�  NOT NULL
                CONSTRAINT  ���������̸�  CHECK(�÷��̸� IN(������1, ������2), ...))
                
        ���� 2 ]
            
            �÷��̸�    ������Ÿ��(����),
            �÷��̸�    ������Ÿ��(����),
            ...
            CONSTRAINT  ���������̸�  PRIMARY KEY(�÷��̸�),
            CONSTRAINT  ���������̸�  UNIQUE(�÷��̸�)
            CONSTRAINT  ���������̸�  FOREIGN KEY(�÷��̸�)   REFERENCES ���̺��̸�(�÷��̸�,
            CONSTRAINT  ���������̸�  CHECK(�÷��̸� IN(������1, ������2), ...))
            
            ���� ]
            
                �÷��� ������� ���Ŀ��� NOT NULL ���������� �߰����� ����
                <== ���������� �߰����� �ʰ� ���̺��� ����� �Ǹ�
                    �÷����� NULL �����͸� ����ϴ� �÷����� �������
                    ���� NOT NULL ���������� �̷� �÷��� �Ӽ��� �����ؾ� ��
                    
        ���� 3 ]
            
            �������� ���� ���̺��� ����� ��� 
            ���̺� ���� ������� ���������� �߰��ϴ� ���
            
            ALTER TABLE ���̺��̸�
            ADD CONSTRAINT ���������̸�   ��������(�÷��̸�)
            ;
                    
*/

CREATE TABLE TMP(
    no NUMBER(2),
    name VARCHAR2(10 CHAR)
);

DESC TMP;

DROP TABLE tmp;

/*

    ���� ���̺��� ������ ��
    �����ϴ� ������ �������ִ� ���̺���� �����ؾ� ��
    
*/

-- �ƹ�Ÿ ���̺�
-- ���̺� ����

DROP TABLE avatar CASCADE CONSTRAINTS;

CREATE TABLE avatar(
    ano NUMBER(2),
    aname VARCHAR2(15 CHAR),
    oriname VARCHAR2(50 CHAR),
    savename VARCHAR2(50 CHAR),
    dir VARCHAR2(100 CHAR),
    len NUMBER,
    gen CHAR(1)
        CONSTRAINT AVT_GEN_CK CHECK(gen IN('F', 'M', 'N'))
        CONSTRAINT AVT_GEN_NN NOT NULL,
    adate DATE DEFAULT sysdate,
    isShow CHAR(1) DEFAULT 'Y',
    CONSTRAINT AVT_NO_PK PRIMARY KEY(ano),
    CONSTRAINT AVT_SNAME_UK UNIQUE(savename),
    CONSTRAINT AVT_SHOW_CK CHECK(isShow IN('Y', 'N'))
);

-- NOT NULL �������� ����

ALTER TABLE avatar
MODIFY aname
    CONSTRAINT AVT_NAME_NN NOT NULL
;

ALTER TABLE avatar
MODIFY oriname
    CONSTRAINT AVT_ONAME_NN NOT NULL
;

ALTER TABLE avatar
MODIFY savename
    CONSTRAINT AVT_SNAME_NN NOT NULL
;

ALTER TABLE avatar
MODIFY dir
    CONSTRAINT AVT_DIR_NN NOT NULL
;

ALTER TABLE avatar
MODIFY len
    CONSTRAINT AVT_LEN_NN NOT NULL
;

ALTER TABLE avatar
MODIFY adate
    CONSTRAINT AVT_DATE_NN NOT NULL
;

ALTER TABLE avatar
MODIFY isShow
    CONSTRAINT AVT_SHOW_NN NOT NULL
;

-- ȸ�� ���̺� �߰�

CREATE TABLE MEMBER(
    mno NUMBER(4)
        CONSTRAINT MB_NO_PK PRIMARY KEY,
    name VARCHAR2(20 CHAR)
        CONSTRAINT MB_NAME_NN NOT NULL,
    id VARCHAR2(15 CHAR)
        CONSTRAINT MB_ID_UK UNIQUE
        CONSTRAINT MB_ID_NN NOT NULL,
    pw VARCHAR2(15 CHAR)
        CONSTRAINT MB_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MB_MAIL_UK UNIQUE
        CONSTRAINT MB_MAIL_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MB_TEL_UK UNIQUE
        CONSTRAINT MB_TEL_NN NOT NULL,
    avt NUMBER(2) DEFAULT 10
        CONSTRAINT MB_ANO_FK REFERENCES avatar(ano)
        CONSTRAINT MB_ANO_NN NOT NULL,
    gen CHAR(1)
        CONSTRAINT MB_GEN_CK CHECK(gen IN('F', 'M'))
        CONSTRAINT MB_GEN_NN NOT NULL,
    joindate DATE DEFAULT sysdate
        CONSTRAINT MB_DATE_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MB_SHOW_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT MB_SHOW_NN NOT NULL
);

/*
    
    ��ϵ� �������� Ȯ���ϴ� ���
    ==> ��ϵ� ���������� ����Ŭ�� ���̺��� �̿��ؼ� ������
        �� ���̺� �̸��� USER_CONSTARINTS
        
        ���� �� ���̺��� ������ Ȯ���ϸ� ��ϵ� ���������� Ȯ�� ����
        
        ���� ]
            
            CONSTRAINT_TYPE
                
                P   PRIMARY KEY
                R   FOREIGN KEY
                U   UNIQUE
                C   NOT NULL, CHECK

----------------------------------------------------------

�������� �����ϱ�
    
    ���� ]
    
        ALTER TABLE ���̺��̸�
        DROP CONSTRAINT ���������̸�;
        
    ���� ]
        
        �⺻Ű(PRIMARY KEY)�� ���� ���������̸��� ���� ������ �� ����
        �⺻Ű�� ���̺� ���� �Ѱ��� ��������� ������
        
        ���� ]
        
            ALTER TABLE ���̺��̸�
            DROP PRIMARY KEY;
        
*/

DESC USER_CONSTRAINTS;

-- �ƹ�Ÿ�� ��� ���̺��� �������� ��ȸ

SELECT
    constraint_name ���������̸�, constraint_type ��������, table_name ���̺��̸�
FROM
    user_constraints
WHERE
    table_name IN('AVATAR', 'MEMBER')
;

-- ȸ�� ���̺� �⺻Ű �������� ����

ALTER TABLE member
DROP PRIMARY KEY;

-- �⺻Ű �߰�

ALTER TABLE member
ADD CONSTRAINT MB_NO_PK PRIMARY KEY(mno);

-- tmp ���̺� ����

CREATE TABLE tmp(
    no NUMBER(4)
);

/*

    ���̺� �����ϱ�
        1) �ʵ� �߰��ϱ�
        
            ���� ]
                
                ALTER TABLE ���̺��̸�
                ADD (
                    �ʵ��̸�    ������Ÿ��(����)
                        CONSTRAINT ���������̸� ��������
                );
                
        2) �ʵ� �̸� �����ϱ�
            
            ���� ]
                
                ALTER TABLE ���̺��̸�
                RENAME COLUMN �ʵ��̸� TO �ٲ��̸�;
                
----------------------------------------------------------
        3) �ʵ� ���� �����ϱ�
            
            ���� ]
            
                ALTER TABLE ���̺��̸�
                MODIFY �ʵ��̸� ������Ÿ��(����);
                
            ���� ]
                
                -- DEFAULT �� �߰�
                ALTER TABLE ���̺��̸�
                MODIFY �ʵ��̸� DEFAULT ������;
            
            *****
            ���� ]
                
                ���̺����� ���� ���̺��� ���̴� ���� ���������� ���̴� ���� �Ұ���
                <== �̹� �ԷµǾ� �ִ� �����Ͱ� ������ ���̸� �Ѿ �� �ֱ� ����
                
        4) �ʵ� �����ϱ�
            
            ���� ]
                
                ALTER TABLE ���̺��̸�
                DROP COLUMN �ʵ��̸�;

----------------------------------------------------------

���̺� �̸� �����ϱ�

    ���� ]
    
        ALTER TABLE ���̺��̸�
        RENAME TO �ٲ� ���̺��̸�;
        
----------------------------------------------------------

���̺� �����ϱ�

    ���� ]
    
        ���̺� ���� ��� �����͵� ���� ������
        
    ���� 1 ]
        
        DROP TABLE ���̺��̸�;
        
    ���� 2 ]
        
        DROP TABLE ���̺��̸� purge;
        ==> �����뿡 ���� ���� ���� �����϶�� �ǹ�
        
    ���� ]
        
        DML ����� ������ ����������
        DDL ����� ������ ��Ģ������ �Ұ���
        
    ���� ]
        
        10g���� ������ ������ �߰��ؼ�
        ������ �����͸� �����뿡 �����ϵ��� �ϰ� ����
        
    ������ ���� ]
    
        1. �����뿡 �ִ� ��� �����͸� ���� ����
            
            purge recyclebin;
        
        2. �����뿡 �ִ� Ư�� ���̺� ���� ����
            
            purge table ���̺��̸�;
            
        3. ������ Ȯ���ϱ�
            
            show recyclebin;
        
        4. �������� ���̺� �����ϱ�
        
            flashback table ���̺��̸� to before drop;
            
*/

-- TMP ���̺� NAME �ʵ� �߰�

ALTER TABLE tmp
ADD(
    name VARCHAR2(10 CHAR)
        CONSTRAINT TMP_NAME_NN NOT NULL
);

-- TMP ���̺��� NO �ʵ忡 �⺻Ű �������� �߰�

ALTER TABLE tmp
ADD CONSTRAINT TMP_NO_PK PRIMARY KEY(no)
;

-- NO�� TNO�� ����

ALTER TABLE tmp
RENAME COLUMN no TO tno;

-- ������ Ȯ��

show recyclebin;

----------------------------------------------------------

/*

    TRUNCATE
    ==> DML ��� �� DELETE ��ɰ� ����
        ���̺� �ȿ� �ִ� ��� �����͸� �����ϴ� ���
        
    ���� ]
    
        TRUNCATE TABLE ���̺��̸�;
        
    ���� ]
        
        DELETE ����� DML �Ҽ�
        ==> ���� ����
        TRUNCATE ����� DDL �Ҽ�
        ==> ���� �Ұ�
        
*/

/*
    
    ���Ἲ üũ
    ==> �����ͺ��̽��� ���α׷� �� ���꿡�� �۾��� �� �ʿ��� �����͸� �������ִ� ���� ���α׷�
        ���� �����ͺ��̽��� ���� �����ʹ� �׻� �Ϻ��� �����Ϳ��� ��
        �׷��� �����͸� �Է��ϴ� ���� ����� ���̰�
        ���� �Ϻ��� �����͸� ������ �� ���� �Ǿ���
        
        ������ ���̺� ������ �ȵ� �����ͳ�
        ������ �ȵǴ� ������ ���� �̸� �����س���
        �����͸� �Է��ϴ� ����� �߸� �Է��ϸ�
        �� �����ʹ� �ƿ� �Էµ��� ���ϵ��� �����ϴ� ������ �ϴ� ���
        
        �Ѹ���� �������ڸ�
            �̻������� �Է��� �����ϴ� ���
            
        ���� �� ����� �ݵ�� �ʿ��� ����� �ƴ�
        ==> �Է��ϴ� ����� ����� �Է��ϸ� �Ǳ� ������
            �Ǽ��� �̿��� ������ �� �ֵ��� �ϴ� ���
        
*/

/*
    
    ���� ]
    
        ���̺��� �����ϴ� �������
        ���������� ����� �̿��ؼ� ���̺��� ����� ����� ����
        
        CREATE TABLE ���̺��̸�
        AS
            ��������
        ;
        
        ���� ]
            
            �̷��� �����ϰ� �Ǹ� ��� �����Ϳ� ���̺��� ������ ������ �� ������
            NOT NULL ���������� ������ ��� ���������� �����ؿ��� ����
            
        ���� ]
            
            �� �� ������ ���̺��� ������ �����ϰ� ���� ���
            
            CREATE TABLE ���̺��̸�
            AS
                SELECT * FROM ���̺��̸� WHERE 1=2;
            
*/

-- MEMBER ���̺��� ��� ������ �����ؼ� MEMB02 ���̺��� ������.

CREATE TABLE memb02
AS
    SELECT * FROM member
;

ALTER TABLE memb02
ADD CONSTRAINT MB02_NO_PK PRIMARY KEY(mno);

-- INSERT ��ɿ� �������� ��� ����

/*
    
    ���� ]
    
        INSERT INTO ���̺��̸�
            ��������
        ;
        
*/

-- EMP ���̺��� ��� �� �μ���ȣ�� 10���� ������� �����͸� �����ϼ���.

INSERT INTO emp2
    SELECT 
        * 
    FROM 
        emp
    WHERE 
        deptno = 10
;

----------------------------------------------------------

/*

    DCL(Data Control Language)
    
        Ʈ����� ó��
        ==> ���������� �ǹ̷δ�
            ����Ŭ�� ó��(����)�ϴ� ��� ����
            
            �츮�� ���̺��� ���� �� CREATE ����� ġ�� ����Ű�� ������
            �� ����� �����ϰ� �Ǵµ�
            �̰��� "Ʈ������� ����Ǿ���"��� ǥ����
            
            ���� ���� ��κ��� ����� ����Ű�� ������ ����
            ����� ����ǰ� �װ��� �� Ʈ������� ����� ���̹Ƿ�
            �ᱹ ����Ŭ�� ��� ������ �� �ϳ��� Ʈ������� ��
            
            �׷��� DML ��ɸ�ŭ�� Ʈ������� ������ �޶���
                
                ���� ]
                    
                    DML ��� : INSERT, UPDATE, DELETE
                    
                ==> DML ����� ���� ����Ǵ� ���� �ƴϰ�
                    ���� ���(�ӽ� ������)�� �� ����� ��Ƹ� ����
                ==> �ᱹ Ʈ������� ������� ����
                
                ���� DML ����� ������ Ʈ����� ���� ����� ������ ��
                �� �� Ʈ������� �ѹ��� �Ͼ�� ��
                
                ��?
                    <== DML ����� �����͸� �����ϴ� ���
                        �����ͺ��̽����� ���� �߿��� ������ ���Ἲ�ε�
                        �̷� ���� DML ����� �Ѽ��� Ʈ����� ó���� �ȴٸ�
                        �������� ���Ἲ�� ���� �� ����
                        �̷� �������� �ذ��ϱ� ���� ��������
                        Ʈ����� ����� ������ ������
                        
                �׷��� ���ۿ� ��Ƴ��� ����� Ʈ����� ó���ϴ� ���
                    
                    �ڵ� Ʈ����� ó��
                        1. sqlplus�� ���������� �����ϴ� ���� Ʈ����� ó���� �Ͼ
                            ==> exit ������� ������ ���������� �ݴ� ���� Ʈ����� ó���� �Ͼ
                            
                        2. DDL ����̳� DCL ����� �������� ����
                        
                    ���� Ʈ����� ó��
                        3. commit�̶�� ������ ����� ������ ����
                    
                    ���� ]
                    
                        ���ۿ� ��Ƴ��� ����� ������� �ʴ� ����
                        ==> Ʈ����� ó���� ���� ���ϰ� �������� ���
                        
                        �ڵ�
                            1. ���� � ���ؼ� �ý����� �˴ٿ� �Ǵ� ����
                            2. sqlplus�� ������ �����ϴ� ����
                        
                        ����
                            3. rollback�̶�� ����� ������ ����
                            
    *****
    ���������
    DML ����� ���� �� �ٽ� �����ؼ� �Ϻ��� ����̶�� �ǴܵǸ�
    COMMIT�̶�� ����ؼ� Ʈ������� �߻���Ű��
    ���� ���� ���� �� ������ �߰ߵǸ�
    ROLLBACK�̶�� ������� �߸��� ����� ����ϵ��� ��
    
    å���� �����
        SAVEPOINT �������̸�;
        
    �̰��� ����ؼ� ROLLBACK�ϴ� ���
    
        ROLLBACK TO SAVEPOINT�̸�;
        
    �� ]
    
        SAVEPOINT a;
            DML (1)
            DML (2)
            DML (3)
        SAVEPOINT b;
            DML (4)
            DML (5)
            DML (6)
        SAVEPOINT c;
            DML (7)
            DML (8)
            DML (9)
            
        ROLLBACK TO c;  7,8,9 ���
        ROLLBACK TO b;  4,5,6[,7,8,9] ���
        ROLLBACK TO a;  1,2,3[,4,5,6,7,8,9] ���
        
    ���� ]
    
        Ʈ������� ó���Ǹ� SAVEPOINT�� �ڵ� �ı�
        
*/

ALTER TABLE emp2
ADD CONSTRAINT EMP2_NO_PK PRIMARY KEY(empno);

----------------------------------------------------------

/*

    ��(VIEW)
    ==> ���������� �ǹ̷δ�
        ���� ����� ����� �ϳ��� â������ �ٶ� �� �ִ� â��
        
        �� ]
        
            SELECT * FROM EMP;
            ==> �̷��� ���Ǹ���� �����ϸ� ����� �߻��ϴµ�
                �� ��� �߿��� �Ϻκи� �� �� �ִ� â���� ���� ����ϴ� ��
        
        ���̺�� ���������� ���̺�� �ٸ� ���� ���������� �����ͺ��̽���
        �ʵ���� ����������� �ʴٴ� ��
        
    ==> ���� ����ϴ� ������ ���Ǹ���� ���� ������ ����
        �� ���Ǹ���� ����� �ս��� ó���� �� �ֵ��� �ϴ� ��
        
    ���� ����
        1. �ܼ���
            ==> �ϳ��� ���̺� �̿��ؼ� ������� ��
                DML ���(INSERT, UPDATE, DELETE) ��Ģ������ ��� ����
        2. ���պ�
            ==> �ΰ� �̻��� ���̺��� �̿��ؼ�(����) ������� ��
                DML ���(INSERT, UPDATE, DELETE) ��� �Ұ�
            ==> SELECT ��ɸ� ��� ����
            
----------------------------------------------------------

���� ]
    
    ��Ģ������ ����� ������ �����ڰ� ����� �ϸ� �� �� ����
    �׷��� �並 ����� ������ ���� �ο��Ǿ� ���� ����
    ���� ������ �ο��ϰ� �並 ������ ��
    
    ���� �ο� ��� - ������ �������� (SYSTEM) 
    
        GRANT �����̸�, �����̸�, ... TO �����̸�;
        
----------------------------------------------------------

    �並 ����� ���
    
        ���� 1 ]
            
            CREATE[OR REPLACE] VIEW ���̸�
            AS
                ��������;
                
        ���� ]
            
            �並 Ȯ���ϴ� ���
            ����Ŭ������ �並 �����ϴ� ���̺��� �����ϰ� �� ���̺��� ������
            �� ���̺� �̸��� USER_VIEW
            
        ���� 2 ]
        
            ==> DML ������� �����͸� ������ ��
                ����� �����ʹ� �⺻ ���̺� ����ǹǷ�
                �� ���忡�� ���� �� �����͸� ������ ����� �� ���� �� ����
                
                CREATE [OR REPLACE] VIEW ���̸�
                AS
                    ���Ǹ��
                WITH CHECK OPTION;
                
        ���� 3 ]
            
            ==> �並 �̿��ؼ� �����͸� �����ϸ�
                �並 ����ϴ� �����͸� ���� ����
                �̰��� ���� ���̺��� ���忡���� ���� �߻� ���ɼ�
                �並 ���ؼ� �����͸� �������� ���ϵ��� �����ϴ� ����
                
                CREATE OR REPLACE VIEW ���̸�
                AS
                    ���Ǹ��
                WITH READ ONLY;
                
----------------------------------------------------------

    ���� ]
    
        ���� ��� �⺻ ���̺��� �ְ� �װ��� �ٶ󺸴� â���� ����� ����
        �׷��� �⺻ ���̺��� ��� �並 ���� �� ����
        
        ���� ]
            
            CREATE OR REPLACE FORCE VIEW ���̸�
            AS
                ���Ǹ��
            ...
            ;
            
        ���� ]
            
            ������ ���̺� ���� �䰡 �۵��Ǵ� ���� �ƴ�
            ���̺��� �ʿ��ѵ�
            �� ����� ������ ������ ���� ��쿡 ���� �� ����ϴ� ���
            ���߿� ���̺��� ��������� �� �� �����͸� �ҷ����� ��
            
----------------------------------------------------------

    VIEW ����
    
        ���� ]
        
            DROP VIEW ���̸�;
            
*/

-- ������ ����(SYSTEM)���� �۾�

GRANT CREATE VIEW TO scott;

GRANT CREATE VIEW TO jennie;

CREATE VIEW dnosal
AS
    SELECT
        deptno dno, max(sal) max, min(sal) min, sum(sal) sum, count(*) cnt, avg(sal) avg 
    FROM
        emp
    GROUP BY
        deptno    
;

-- ������� ����̸�, �μ���ȣ, �μ��ִ�޿�, �μ������� ��ȸ�ϼ���.

SELECT
    ename ����̸�, deptno �μ���ȣ, max �μ��ִ�޿�, cnt �μ�����
FROM
    emp, dnosal
WHERE
    deptno = dno
;

-- USER_VIEWS ����Ȯ��

DESC USER_VIEWS;

SELECT * FROM USER_VIEWS WHERE VIEW_NAME = 'DNOSAL';

-- EMP ���̺��� ������� �����ȣ, ����̸�, �μ���ȣ, �μ��̸�, �μ���ġ�� ��ȸ�ϴ� ��(EMP_DNO)�� ���弼��.

CREATE OR REPLACE VIEW emp_dno
AS  
    SELECT
        empno, ename, e.deptno, dname, loc
    FROM
        emp e, dept d
    WHERE
        e.deptno = d.deptno
;

-- ������ �߰� (�� ���̺��� �����ؼ� ���� ���պ��̹Ƿ� DML ��� ��� �Ұ�)

INSERT INTO
    emp_dno
VALUES(
    8000, 'JENNIE', 40, 'OPERATIONS', 'BOSTON'
);

/*
    
    ���� 2 ]
        
        10�� �μ� ������� �����ȣ, ����̸�, �޿�, Ŀ�̼��� ��ȸ�ϴ� ��(DNO10)�� ���弼��.
        
*/

CREATE OR REPLACE VIEW dno10
AS
    SELECT
        empno, ename, sal, comm
    FROM
        emp
    WHERE
        deptno = 10
;

-- ������ �߰�

INSERT INTO
    dno10
VALUES(
    8000, 'jennie', 7000, 10000
);

ROLLBACK;

-- EMP ���̺��� �����ؼ� EMPLOYEE ���̺��� ���弼��.
-- �⺻Ű �������ǰ� ����Ű ���������� �߰��ϼ���.

CREATE TABLE employee
AS 
    SELECT * FROM emp
;

-- PK

ALTER TABLE employee
ADD CONSTRAINT EMPLY_NO_PK PRIMARY KEY(empno);

-- FK

ALTER TABLE employee
ADD CONSTRAINT EMPLY_DNO_FK FOREIGN KEY(deptno) REFERENCES dept(deptno);

/*
    
    ���� 3 ]
        
        EMPLOYEE ���̺��� 10�� �μ� ������� �����ȣ, ����̸�, �޿�, Ŀ�̼�, �μ���ȣ�� ��ȸ�ϴ� ��(DNO10)��
        �並 ����� �������� ���Ǵ� �÷��� �����ʹ� �������� ���ϵ��� �ϼ���.
        
*/

CREATE OR REPLACE VIEW dno10
AS
    SELECT 
        empno, ename, sal, comm
    FROM
        employee
    WHERE
        deptno = 10
        
WITH CHECK OPTION
;

-- DNO10 ��ȸ

SELECT * FROM dno10;

-- CLARK�� Ŀ�̼��� 500���� �λ��ϼ���.

UPDATE
    dno10
SET
    comm = NVL(comm + 500, 500)
WHERE
    ename = 'CLARK'
;

-- KING�� �μ���ȣ�� 40������ �����ϼ���. (���� �߻�)

UPDATE
    dno10
SET
    deptno = 40
WHERE
    ename = 'KING'
;

UPDATE
    employee
SET 
    deptno = 40
WHERE
    ename = 'KING'
;

rollback;

-- �Խ��� ���̺�(BOARD)�� �۹�ȣ, �ۼ��ڹ�ȣ, ������, �ۼ���, Ŭ������ ��ȸ�ϴ� �並 �ۼ��ϼ���.

CREATE OR REPLACE FORCE VIEW brdlist
AS
    SELECT
        bno, bmno, titlw, wdate, click
    FROM
        board
;

-- brdlist ����

DROP VIEW brdlist;