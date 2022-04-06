-- #day06

/*
    
    ��������
    ==> �����Ͱ� �Էµ� �� �̻��� �ִ� �����Ͱ� ���� ����� ����Ŭ ��ü
    
    ���� ]
    
        �����ͺ��̽��� �̻������� ������ �������� ���
        
    ���� ]
        
        �⺻Ű(PRIMARY KEY) �������� 
            - �Ӽ������� �����͸� ������ �� �־�� ��
              �⺻Ű ���������� �ʼ��� �ƴ�����
              �ǵ����̸� �⺻Ű ���������� �߰��ϴ� ���� ����
              
              �⺻Ű = ����Ű + NOT NULL ��������
              
        ����Ű(UNIQUE KEY) ��������
            - �Ӽ����� �ٸ� �����Ϳ� ������ �Ǿ�� ��
              NULL �����ʹ� �Է��� �� ����
              
        ����Ű(�ܷ�Ű, FOREIGN KEY) ��������
            - �����ϴ� ���̺��� Ű���� �ݵ�� ����ؾ� �ϴ� ��������
              �Էµ��� ���� Ű���� �Է����� ���ϵ��� ���� ��������
              ���� ���̺��� �����Ϸ��� �ϸ�
              ���� �����ϰ� �ִ� ���̺��� �����ϰ� �ش� ���̺��� �����ؾ� ��
              
        NOT NULL ��������
            - �Ӽ������� NULL �����Ͱ� �Էµ��� �ʵ��� ���� ��������
            
        CHECK ��������
            - �ԷµǾ�� �� �Ӽ����� ������ �ִ� ���(�� ] ����, ���⿩��)
              �Էµ� �Ӽ��� �̿��� ���� �ԷµǴ� ���� �����ϴ� ��������
    
*/

drop table dept;

-- emp ���̺� �Ѹ� ����� �Է��ϴµ� ����� �Ի����� ����ð����� �ϰ�
-- �μ��� 50�� �μ��� �Է��ϼ���.

INSERT INTO
    emp(empno, ename, hiredate, deptno)
VALUES(
    (
        SELECT
            NVL(MAX(empno) + 1, 1001)
        FROM
            emp
    ),
    '�Ѹ�', sydate, 50
);

/*

    ���� ]
    
        ������ ������� �Ѵ�.
        ������ ȸ�������� �ϸ� �� �������� �ڵ� ��ȯ�ǵ��� �� �����̴�.
        ���Ͽ��� ȸ�����̵�� �λ��� ���ԵǾ�� ��
        
        ������ ER Model Diagram, ER-D, ���̺� ����,
        DDL ���Ǹ���� �ۼ��ϼ���.

*/

/*
    
    ����Ŭ���� ����� �� �ִ� ������ ����
    
        1. ������
            CHAR
                ==> ���������� ������
                
                ���� ]
                    
                    CHAR(�ִ����)
                    ==> �� �� ��밡���� �ִ� ���̴� 2000 ����Ʈ������ ��� ����
                    
            VARCHAR2
                ==> ���������� ������
                
                ���� ]
                
                    VARCHAR2(�ִ����)
                    ==> �ִ���̴� 4000����Ʈ���� ��� ����
                    
            LONG
                ==> ���������� ������
                
                ���� ]
                    
                    LONG
                    ==> �ִ���� 2GB���� ��� ����
                    
            CLOB
                ==> ���������� ������
                
                ���� ]
                    
                    CLOB
                    ==> �ִ���̴� 4GB���� ��� ����
                    
                ==> �� Ÿ���� VARCHAR2�� 4KB������ ����ϱ� ������
                    �� �̻��� ���ڼ��� ���� �����ʹ� �Է¹��� ����
                    �� ������ �ذ��ϱ� ���� ������� �������� Ÿ��
                    
    ���� ]
    
        �������� ������ ( CHAR�� ó���ӵ� �ξ� ����)
            ==> ������ ���̸� �̸� ������ ��
                �Է��� ���ڰ� ���̺��� �����ϸ� ������ �̿��ؼ�
                �ݵ�� ���� ������ ���ڸ� ���� �Է��ϴ� ���
                ==> �����ȣ�� ���� ���̰� ������ ������ �����Ϳ� ���ؼ�
                    �ַ� ���Ǵ� Ÿ��
        
        �������� ������
            ==> �Է��� ������ ���̿� ���� ������ ����ϴ� ������ �����ؼ�
                ���ڿ��� ���̸� �Է��� ������ ���̿� ���ߴ� ����
                ==> �������� ���̸� �� �� ���� ��쿡 �ַ� ���� ���
                
        2. ������
            NUMBER
            
                ���� ]
                
                    NUMBER(����1[, ����2])
                    
                    ����1 : ��ü �ڸ����� �ǹ�(��ȿ�ڸ���)
                    ����2 : �Ҽ����� �ڸ����� �ǹ�
                    
                ���� ]
                
                    ����1���� ū ���� �Է¹��� ����
                    ����2���� �Ҽ����ϰ� ������ �ڵ����� �ݿø��ؼ� �Է���
                    
        3. ��¥��
            DATE
            
                ���� ]
                    
                    DATE
                    
    ���� ]
        
        �����ͺ��̽��� ���� ������ ���µ� �ణ�� �޶���
        ����� ANSI ������ ���¶�� �ؼ�
        ��� �����ͺ��̽��� ���� ������ ���� ���¸� ǥ��ȭ��ȸ���� �����ϰ� ����

--------------------------------------------------------------

1. ���̺� �����
    
    ���� ]
        
        CREATE TABLE ���̺��̸�(
            �ʵ��̸�    ������Ÿ��(����),
            �ʵ��̸�    ������Ÿ��(����),
            ...
        );
        
    ���̺��� ��������ִ��� Ȯ���ϴ� ���
        
        SELECT tname FROM tab;
        
    ���̺� ������ �����ϰ� Ȯ���ϴ� ���
        
        DESCRIBE ���̺��̸�;
        DESC     ���̺��̸�;

*/

-- jennie ���� ����

CREATE USER jennie IDENTIFIED BY "12345" ACCOUNT UNLOCK;

GRANT resource, connect TO jennie;
ALTER USER jennie DEFAULT TABLESPACE USERS;

-- jennie �������� ����
-- Memb ���̺� ����

CREATE TABLE memb(
    mno NUMBER(4), 
    name VARCHAR2(20 CHAR),
    id VARCHAR2(15 CHAR),
    pw VARCHAR2(15 CHAR),
    mail VARCHAR2(50 CHAR),
    tel VARCHAR2(13 CHAR),
    addr VARCHAR2(100 CHAR),
    gen CHAR(1),
    joindate DATE DEFAULT sysdate,
    isShow CHAR(1) DEFAULT 'Y'
);

/*

    �������� �ο��ϴ� ���
        
        ���� ]
            
            ���������� �̸��� �ο��ϴ� ��Ģ
                
                ���̺��̸�_�ʵ��̸�_��������
                �� ���·� �ο��ϸ� ��
                
                �� ]
                
                    member ���̺��� �⺻Ű ��������
                    ==> MEMB_NO_PK
                    
        1. ���̺� ������ �� �߰��ϴ� ���
        
            *****
            1-1. �ʵ带 ������ �� �߰��ϴ� ���
            
                ���� ]
                    
                    �ʵ��̸�    ������Ÿ��(����)
                        CONSTRAINT  ���������̸�     ��������1
                        CONSTRAINT  ���������̸�     ��������2
                        
                ���� ]
                
                    ����Ű ��������
                        CONSTRAINT ���������̸� REFERENCES ���̺��̸�(�ʵ�)
                        
                    üũ ��������
                        CONSTRAINT ���������̸� CHECK (�ʵ��̸� IN (������1, ������2, ...))
                        
            1-2. �ʵ带 �̸� �����ϰ� ���߿� ���������� �߰��ϴ� ���
            
            1-3. ���� ������������ ����ϴ� ���
            
*/

-- memb ���̺� ����

DROP TABLE memb;

CREATE TABLE memb(
    mno NUMBER(4) PRIMARY KEY, 
    name VARCHAR2(20 CHAR),
    id VARCHAR2(15 CHAR),
    pw VARCHAR2(15 CHAR),
    mail VARCHAR2(50 CHAR),
    tel VARCHAR2(13 CHAR),
    addr VARCHAR2(100 CHAR),
    gen CHAR(1),
    joindate DATE DEFAULT sysdate,
    isShow CHAR(1) DEFAULT 'Y'
);

INSERT INTO
    memb(mno, name)
VALUES(
    1001, '��浿'
);

INSERT INTO
    memb(mno, name)
VALUES(
    1001, '��ġ'
);

DROP TABLE memb;

-- �ʵ带 �����ϸ鼭 ���������� �߰��ϴ� ���

CREATE TABLE memb(
    mno NUMBER(4)
        CONSTRAINT MEMB_NO_PK PRIMARY KEY, 
    name VARCHAR2(20 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    id VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    pw VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MEMB_MAIL_UK UNIQUE
        CONSTRAINT MEMB_MAIL_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MEMB_TEL_UK UNIQUE
        CONSTRAINT MEMB_TEL_NN NOT NULL,
    addr VARCHAR2(100 CHAR)
        CONSTRAINT MEMB_ADDR_NN NOT NULL,
    gen CHAR(1)
        CONSTRAINT MEMB_GEN_CK CHECK(gen IN('F', 'M'))
        CONSTRAINT MEMB_GEN_NN NOT NULL,
    joindate DATE DEFAULT sysdate
        CONSTRAINT MEMB_JOIN_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMB_SHOW_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT MEMB_SHOW_NN NOT NULL
);

-- �Խ��� ���̺�� ÷������ ���̺��� ����� ���Ǹ���� �ۼ��ϼ���.

-- GESI

CREATE TABLE gesi(
    bno NUMBER(6)
        CONSTRAINT GESI_BNO_PK PRIMARY KEY,
    upno NUMBER(6)
    bmno NUMBER(4)
        CONSTRAINT GESI_BMNO_FK REFERENCES memb(mno)
        CONSTRAINT GESI_BMNO_NN NOT NULL,
    title VARCHAR2(30 CHAR)
        CONSTRAINT GESI_TITLE_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT GESI_BODY_NN NOT NULL,
    bdate DATE DEFAULT sysdate
        CONSTRAINT GESI_BDATE_NN NOT NULL,
    edate DATE
    click NUMBER(6) DEFAULT 0
        CONSTRAINT GESI_CLICK_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GESI_SHOW_CK CHECK(isShow IN('Y', 'N')
        CONSTRAINT GESI_SHOW_NN NOT NULL
);

-- CHUMBU

CREATE TABLE chumbu(
    serial NUMBER(7)
        CONSTRAINT CHUMBU_SER_PK PRIMARY KEY,
    fno NUMBER(6)
        CONSTRAINT CHUMBU_FNO_FK REFERENCES gesi(bno)
    oname VARCHAR2(50 CHAR)
        CONSTRAINT CHUMBU_ONAME_NN NOT NULL,
    sname VARCHAR2(50 CHAR)
        CONSTRAINT CHUMBU_SNAME_UK UNIQUE
        CONSTRAINT CHUMBU_SNAME_NN NOT NULL,
    track VARCHAR2(200 CHAR)
        CONSTRAINT CHUMBU_TRACK_NN NOT NULL,
    size NUMBER(12)
        CONSTRAINT CHUMBU_SIZE_NN NOT NULL,
    count NUMBER(6) DEFAULT 0
        CONSTRAINT CUMBU_COUNT_NN NOT NULL,
    isShow CHAR(!) DEFAULT 'N'
        CONSTRAINT CHUMBU_isShow_CK CHECK(isShow IN('Y', 'N')
        CONSTRAINT CHUMBU_NN NOT NULL
        
);