-- #day08

/*
    
    ������(Sequence)
    ==> �츮�� ���̺��� ����� ������ ���� ������ �� �ִ� �⺻Ű��
        ���� �ʼ������� �����ؾ� ��
        
        ���� ���
        ����� �����ϴ� ���̺��� �����
        ������ ����� ������ �� �ִ� ���𰡰� �־���ϰ�
        ���� �츮�� ������ �ִ� EMP ���̺�����
        �����ȣ(empno)�� �̿��ؼ� �̰��� ó���ϰ� ����
        
        ���� ���̺��� �̰��� ��Ȯ�ϰ� �����Ͽ� ó���� �� ������
        �׷��� ���� ���̺� ����
        
        ���� ��� �Խ��� ������ �����ϴ� ���̺��� ����� �Ǹ�
            ����, �۾���, ����, �ۼ���, ...
        ���� ������ �̰� �߿����� ��Ȯ�ϰ� �� ���� �����͸� ������ �� �ִ�
        ������ �ϴ� �ʵ尡 ������ ����
        �̷� ��� ��κ� �Ϸù�ȣ�� �̿��ؼ� �� ������ �ϵ��� �ϰ� ����
        
        ���� �Ϸù�ȣ�� ����� �ߺ��Ǿ�� �ȵǰ�
        ����� �����Ǿ�� �� ��
        (Primary Key == Unique + Not Null)
        ==> �����ͺ��̽��� ������ �Է��ϴ� ����� ������ �߻��� �� ����
        
        �������� �̷� �������� �ذ��ϱ� ���ؼ� ��Ÿ�� ��������
        �ڵ������� �Ϸù�ȣ�� �߻����� �ֱ� ���� ����
        
        ���
            1. ������ ����� ����
            2. �����ͺ��̽��� �Ϸù�ȣ�� �Է��� �ʿ��ϸ�
                �������� ���������� �Ϸù�ȣ�� �����޶�� ��û��
                ==> ��, �����͸� INSERT ��ų �� �Ϸù�ȣ �κ���
                    �Է��ϴ� ����� �Է��ϴ� ���� �ƴϰ� ���������� �ñ�
                    
        ������ ���� ���
        
            ���� ]
            
                CREATE SEQUENCE �������̸�
                    START WITH ����
                        ==> �߻���ų �Ϸù�ȣ�� ���۰�
                            �����ϸ� 1���� ����
                            
                    INCREMENT BY ����
                        ==> �߻��� �Ϸù�ȣ�� ������
                            �����ϸ� 1�� ����
                            
                    MAXVALUE ����
                    MINVALUE ����
                        ==> �߻���ų �Ϸù�ȣ�� �ִ밪�� �ּҰ��� �ǹ�
                            �����ϸ� NO�� ���
                            
                    CYCLE �Ǵ� NOCYCLE
                        ==> �߻���ų �Ϸù�ȣ�� �ִ밪�� �����ϸ�
                            �ٽ� ó������ �������� ���θ� �����ϴ� �ɼ�
                            �����ϸ� NOCYCLE
                            
                    CACHE �Ǵ� NOCACHE
                        ==> �Ϸù�ȣ �߻� �� �ӽ� �޸𸮸� ������� ���θ� �����ϴ� �ɼ�
                            (�̸� ���������� ����� ���� �޸𸮿� ����Ų �� �����)
                            ����ϰ� �Ǹ� �ӵ��� ���������� �޸𸮰� �پ��
                            ������� ������ �ӵ��� ���������� �޸𸮰� ���� ����

-------------------------------------------------------------------------

    ������ �����
    ==> �����͸� �Է��� �� �ڵ����� �Ϸù�ȣ�� �߻��ϱ� ���ؼ� ���� ���� ������
        ���� �ַ� INSERT���� ���
        
        ���� ]
            
            �������̸�.NEXTVAL
            
            ���� ]
            
                �������� ���������� ���� ��ȣ Ȯ���ϴ� ���
                    
                    �������̸�.CURRVAL

�������� ������
==> �������� ���̺� ������
    ��, �� �� ���� �������� ���� ���̺��� ����� �� ����
    �� �� � ���̺��� �������� ����ϵ������� �׻� ���� �Ϸù�ȣ�� �������
    
���� ]
    
    �������� ����
        
        ���� ]
            
            ALTER SEQUENCE �������̸�
                INCREMENT BY ����
                MAXVALUE ���� [�Ǵ� NOMAXVALUE]
                MINVALUE ���� [�Ǵ� NOMINVALUE]
                CYCLE [�Ǵ� NOCYCLE]
                CACHE ���� [�Ǵ� NOCACHE]
                
        ���� ]
            
            �������� �����ϴ� ���
            ���۰��� ������ �� ����
            �ֳ��ϸ� �̹� �߻��� ��ȣ�� �ֱ� ����
            ���۹�ȣ�� ���� ����� ���� ��ȣ�� �ڵ� ���۹�ȣ�� ��
            
�������� ����

    ���� ]
        
        DROP SEQUENCE �������̸�;
    
*/

-- 1���� 1�� �����ϴ� ������ test_seq�� ������. ��, �ִ밪�� 10���� �Ѵ�.

CREATE SEQUENCE test_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10
;

SELECT test_seq.CURRVAL FROM dual;

SELECT test_seq.NEXTVAL ������ȣ, test_seq.CURRVAL ��������ȣ FROM dual;

SELECT test_seq.CURRVAL FROM dual;

SELECT test_seq.NEXTVAL FROM dual;

SELECT test_seq.CURRVAL FROM dual;

/*

    ȸ����ȣ�� �ڵ����� ������� �������� �����ϼ���.
    �̸��� MEMBSEQ
    ���۰��� 1001
    �������� 1
    �ִ밪�� 9999
    �ٽ� �ݺ��ؼ� ������ �ʵ��� �ϼ���.
    
*/

CREATE SEQUENCE membseq
    START WITH 1001
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1001
    NOCYCLE
    NOCACHE
;

-- �ƹ�Ÿ ���̺� ������ �߰�

INSERT INTO 
    avatar
VALUES(
    10, 'noimage', 'noimage.jpg', 'noimage.jpg', '/img/avatar/', 6000, 'N', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    11, 'man1', 'img_avatar1.png', 'img_avatar1.png', '/img/avatar/', 11000, 'M', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    12, 'man2', 'img_avatar2.png', 'img_avatar2.png', '/img/avatar/', 8000, 'M', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    13, 'man3', 'img_avatar3.png', 'img_avatar3.png', '/img/avatar/', 8000, 'M', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    14, 'woman1', 'img_avatar4.png', 'img_avatar4.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    15, 'woman2', 'img_avatar5.png', 'img_avatar5.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);

INSERT INTO 
    avatar
VALUES(
    16, 'woman3', 'img_avatar6.png', 'img_avatar6.png', '/img/avatar/', 8000, 'F', sysdate, 'Y'
);

-- ���� �������� �̿��ؼ� ȸ�� �����͸� �Է��ϼ���.

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    1000, '������', 'euns', '12345', 'euns@githrd.com', '010-3175-9042', 11, 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '����', 'jennie', '12345', 'jennie@githrd.com', '010-1111-1111', 14, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '����', 'lisa', '12345', 'lisa@githrd.com', '010-2424-2424', 15, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '����', 'rose', '12345', 'rose@githrd.com', '010-5252-5252', 16, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '����', 'jisoo', '12345', 'jisoo@githrd.com', '010-2929-2929', 16, 'F'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '�絿��', 'dsoo', '12345', 'dsoo@githrd.com', '010-2106-1940', 12, 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen)
VALUES(
    MEMBSEQ.nextval, '������', 'phk', '12345', 'phk@githrd.com', '010-8630-0515', 'M'
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, avt, gen)
VALUES(
    MEMBSEQ.nextval, '������', 'thyun', '12345', 'thyun@githrd.com', '010-7556-1196', 12, 'M'
);

commit;

-------------------------------------------------------------------------

-- ���� ���̺� ����

CREATE TABLE guestboard(
    gno NUMBER(4)
        CONSTRAINT GBD_GNO_PK PRIMARY KEY,
    writer NUMBER(4)
        CONSTRAINT GBD_WRITER_UK UNIQUE
        CONSTRAINT GBD_WRITER_FK REFERENCES member(mno)
        CONSTRAINT GBD_WRITER_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT GBD_BODY_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT GBD_WDATE_NN NOT NULL,
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT GBD_isShow_CK CHECK(isShow IN('Y', 'N'))
        CONSTRAINT GBD_isShow_NN NOT NULL
    
);

-- �Խñ� ��Ͽ� ����� �۹�ȣ�� �������ִ� ������ GBRDSEQ�� ���弼��.
-- ���۹�ȣ�� 1001, �ִ밪�� 9999, �ִ밪�� �����ϴ��� �ٽ� �ݺ����� �ʵ��� �ϰ�
-- ĳ�ô� ������� �ʴ� ������ �Ѵ�.

CREATE SEQUENCE gbrdseq
    START WITH 1001
    INCREMENT BY 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
;

-- ���Ͽ� GBRDSEQ�� �̿��ؼ� ���� ����غ���.

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1000, '�Խ��� ���� ����帳�ϴ�.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1005, '���� �����մϴ�.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1006, '�Դٰ��ϴ�.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1007, '�ȳ��ϼ���.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1001, '��� ��â�ϼ���.'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval, 1004, '���� �ȳ�!'
);

-- ���Ͽ��� �۹�ȣ, �ۼ��� ���̵�, �ۼ��� ����, �ۼ��� �ƹ�Ÿ �����̸�, �۳���, �ۼ����� ��ȸ�ϼ���.

SELECT
    gno �۹�ȣ, id ���̵�, m.gen ����, savename �ƹ�Ÿ�����̸�, body �۳���, TO_CHAR(wdate, 'YYYY"�� "MM"�� "DD"��"') �ۼ���
FROM
    guestboard g, member m, avatar a
WHERE
    writer = mno
    AND avt = ano
;

select * from member;

-- ����� ������ ���̵� �˰� �ִٴ� ���� �Ͽ��� ���Ͽ� ���� ����ϼ���.

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval,
    (
        SELECT
            mno
        FROM
            member
        WHERE
            id = 'lisa'
    ), '�ȳ�!'
);

INSERT INTO
    guestboard(gno, writer, body)
VALUES(
    GBRDSEQ.nextval,
    (   
        SELECT
            mno
        FROM
            member
        WHERE   
            id = 'rose'
    ), '�ȳ� �ȳ�!'
);

-------------------------------------------------------------------------

/*

    �ε��� (Index)
    ==> �˻��ӵ��� ������ �ϱ� ���ؼ� B-Tree �������
        ������ ���� SELECT�� ���� �ӵ��� ó���� �� �ֵ��� �ϴ� ��
        
        
    ���� ]
    
        �ε����� ����� �ȵǴ� ���
        
            1. �������� ���� ���� ���� ������ �ӵ��� ������
                �ý��ۿ� ���� �޶�������
                �ּ��� ��ʸ��� �̻��� �����Ͱ� �ִ� ��쿡�� ������
            
            2. �������� ������� ����� ���� ������ �ӵ��� ������
                ��? �����Ͱ� �Էµ� ������ ����ؼ� ������ �����ؾ� �ϹǷ� ������ ������
                
    ���� ]
    
        �ε����� ����� ȿ���� �������� ���
            
            1. JOIN � ���� ���Ǵ� �ʵ尡 �����ϴ� ���
            2. NULL ���� ���� �����ϴ� ���
            3. WHERE �������� ���� ���Ǵ� �ʵ尡 �����ϴ� ���
            
    ���� ]
        
        ���������� �߰��� ��
        �⺻Ű �׸��� ����Ű�� �ο��ϸ�
        �ڵ������� �ش� �ʵ�� �ε����� �������
        
�ε��� ����� ���
    
    ���� 1 ] �Ϲ� �ε��� ����� ��� (NON UNIQUE INDEX)
        
        CREATE INDEX �ε����̸�
        ON
            ���̺��̸�(�ε����� ����� �ʵ��̸�);
            
        ���� ]
            
            �Ϲ� �ε����� �����Ͱ� �ߺ��Ǿ ��� ����
    
    ���� 2 ] UNIQUE �ε��� ����� ��� (UNIQUE INDEX)
            ==> �ε����� �����Ͱ� �ݵ�� UNIQUE�ϴٴ� ������ �ִ� ��쿡 ���ؼ�
                �ε����� ����� ���
                
        CREATE UNIQUE INDEX �ε����̸�
        ON
            ���̺��̸�(�ε����� ����� �ʵ��̸�);
    
        ���� ]
            
            �� �� ������ �ʵ��� ������ �ݵ�� �����ϴٴ� ������ �־�� ��
        
        ���� ]
            
            �Ϲ� �ε������� ó���ӵ��� ��ô ����
            ��? ���� �˻��� ����ϱ� ����
            
    ���� 3 ] ���� �ε��� ����� ���
            ==> �������� �ʵ带 �����ؼ� �ϳ��� �ε����� ����� ���
                �� ���� ���������� �ִµ�
                �������� �ʵ��� ������ �ݵ�� �����ؾ� ��
                
                �� �ϳ��� �ʵ常 ������� ����ũ �ε����� ������ ���ϴ� ���
                �������� �ʵ带 ���ļ� ����ũ �ε����� ���� ����ϴ� ���
                
                CREATE UNIQUE INDEX �ε����̸�
                ON
                    ���̺��̸�(�ʵ��̸�, �ʵ��̸�, ...);
                
        ���� ] ����Ű �������� �߰��ϱ�
            
            CREATE TABLE ���̺��̸�(
                �ʵ�1 ������Ÿ��(����),
                �ʵ�2 ������Ÿ��(����),
                �ʵ�3 ������Ÿ��(����),
                ...
                CONSTRAINT ���������̸� PRIMARY KEY(�ʵ��̸�1, �ʵ��̸�2)
            );
    
    ���� 4 ] ��Ʈ �ε��� ����� ���
            ==> �ַ� �� �ȿ� ����ִ� �����Ͱ� ��� �� �ϳ��� ��쿡 ���� ���Ǵ� ���
               
                �� ]
                
                    GEN �ʵ忡�� F, M, N�� �Էµ� ��
                    
                    deptno �ʵ忡�� 10, 20, 30, 40�� �Էµ� ��
                    
                �̰��� ���������� �����͸� �̿��ؼ� �ε����� ���� ����ϴ� ���
                
                CREATE BITMAP INDEX �ε����̸�
                ON
                    ���̺��̸�(�ʵ��̸�);
        
*/

-- ȸ�� ���̺��� �̸��� �̿��ؼ� �ε����� ���弼��.

CREATE INDEX name_idx
ON
    member(name);

-------------------------------------------------------------------------

/*

    �ζ��� ��(InLine View)
    ==> ��ȸ���Ǹ��(SELECT ���)�� ������ ����� �߻���
        �� �� �߻��� ����� "�ζ��� ��"��� ����
        
        ��, ��� �ζ��� �� �߿��� ���� ����ϴ� �ζ��� �並 ����ؼ� ����ϴ� ������ ��
        
    �׷��� �ζ��� ��� �ϳ��� ������ ���̺�
    ���̺��̶� ���ڵ�� �ʵ�� ������ �����͸� �Է��ϴ� ����
    ���� �ζ��� ��� �ϳ��� ���̺�� ���� ������
    ��, ���̺��� ����ؾ� �ϴ� ���� �ζ��� �並 ��� ��� ����
    
�ζ��� �並 ����ؾ� �ϴ� ����
    ���� ���̺� �������� �ʴ� �����͸� �߰��ؼ� ����ؾ� �ϴ� ��쿡 �ζ��� �並 ���� �����
    
    ���� ]
        
        ROWNUM
        ==> �̰��� ������ �ʵ�� �����Ͱ� ��ȸ�� ������ ǥ���ϴ� �ʵ�

*/

-- �ζ��� ���� ��� �߿��� ȸ����ȣ�� �̸��� ��������.

SELECT
    mno, name
FROM
    (SELECT * FROM member)
;

-- ������ �߻��ϴ� ���

SELECT
    mno, id, name, joindate
FROM
    (SELECT mno, id, name, mail FROM member)
    -- �ζ��κ��� ������� joindate �ʵ�� ��������� �ʾ����Ƿ�
;

SELECT * FROM guestboard ORDER BY wdate DESC;

SELECT
    *
FROM
    (
        SELECT
            ROWNUM rno, g.*
        FROM
            (
                SELECT
                    gno, writer, body, wdate
                FROM 
                    guestboard
                WHERE
                    isshow = 'Y'
                ORDER BY 
                    wdate DESC
            ) g
    )
WHERE
    rno BETWEEN 4 AND 6
;

SELECT
    ROWNUM rno, g.*
FROM
    (
        SELECT
            gno, writer, body, wdate
        FROM 
            guestboard
        WHERE
            isshow = 'Y'
        ORDER BY 
            wdate DESC
    ) g
WHERE
    ROWNUM BETWEEN 1 AND 3
;

-- ȸ�� ���̺��� ȸ������ ��ȸ�ϴµ� ROWNUM �������� 4 ~ 6 ȸ���� ��ȸ�ϼ���.
-- ��, ������ �̸� ���� �������� �����ϼ���.

SELECT
    *
FROM
    (
    SELECT
        ROWNUM rno, mno, id, name, mail, tel, gen, joindate, avt, savename
    FROM
        (
            SELECT
                mno, id, name, mail, tel, m.gen, joindate, avt, savename
            FROM
                member m, avatar a
            WHERE
                avt = ano
            ORDER BY
                name DESC
        ) 
    )
WHERE
    rno BETWEEN 4 AND 6
;
