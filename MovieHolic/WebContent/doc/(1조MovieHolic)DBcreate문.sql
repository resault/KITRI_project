ALTER TABLE mh_board
	DROP
		CONSTRAINT FK_mh_user_TO_mh_board
		CASCADE;

ALTER TABLE mh_board
	DROP
		CONSTRAINT FK_mh_category_TO_mh_board
		CASCADE;

ALTER TABLE mh_comment
	DROP
		CONSTRAINT FK_mh_user_TO_mh_comment
		CASCADE;

ALTER TABLE mh_comment
	DROP
		CONSTRAINT FK_mh_board_TO_mh_comment
		CASCADE;

ALTER TABLE mh_social
	DROP
		CONSTRAINT FK_mh_user_TO_mh_social
		CASCADE;

ALTER TABLE mh_wishlist
	DROP
		CONSTRAINT FK_mh_wishcate_TO_mh_wishlist
		CASCADE;

ALTER TABLE mh_wishlist
	DROP
		CONSTRAINT FK_mh_user_TO_mh_wishlist
		CASCADE;

ALTER TABLE mh_board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_user
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_wishcate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_visitor
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE mh_log
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE TABLE
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* mh_board */
DROP TABLE mh_board 
	CASCADE CONSTRAINTS;

/* mh_comment */
DROP TABLE mh_comment 
	CASCADE CONSTRAINTS;

/* mh_social */
DROP TABLE mh_social 
	CASCADE CONSTRAINTS;

/* mh_user */
DROP TABLE mh_user 
	CASCADE CONSTRAINTS;

/* mh_category */
DROP TABLE mh_category 
	CASCADE CONSTRAINTS;

/* mh_wishlist */
DROP TABLE mh_wishlist 
	CASCADE CONSTRAINTS;

/* mh_wishlistcate */
DROP TABLE mh_wishcate 
	CASCADE CONSTRAINTS;

/* mh_visitor */
DROP TABLE mh_visitor 
	CASCADE CONSTRAINTS;

/* mh_log */
DROP TABLE mh_log 
	CASCADE CONSTRAINTS;

/* mh_films */
DROP TABLE TABLE 
	CASCADE CONSTRAINTS;

/* mh_board */
CREATE TABLE mh_board (
	seq NUMBER NOT NULL, /* �۹�ȣ */
	userId VARCHAR2(100) NOT NULL, /* ȸ��ID */
	boardCode NUMBER NOT NULL, /* �Խ����ڵ� */
	subject VARCHAR2(100), /* ���� */
	postDate DATE, /* �ۼ��� */
	content CLOB, /* ���� */
	starPoint NUMBER, /* ���� */
	movieName CLOB, /* ��ȭ�� */
	director CLOB, /* ������ */
	movieCodeYoung CLOB, /* ��ȭ�ڵ�(�����) */
	category VARCHAR2(24), /* �帣 */
	best NUMBER, /* ��õ */
	worst NUMBER, /* ����õ */
	notify NUMBER, /* �Ű� */
	enable NUMBER, /* �������� */
	viewCount NUMBER /* ��ȸ�� */
);

COMMENT ON TABLE mh_board IS 'mh_board';

COMMENT ON COLUMN mh_board.seq IS '�۹�ȣ';

COMMENT ON COLUMN mh_board.userId IS 'ȸ��ID';

COMMENT ON COLUMN mh_board.boardCode IS '�Խ����ڵ�';

COMMENT ON COLUMN mh_board.subject IS '����';

COMMENT ON COLUMN mh_board.postDate IS '�ۼ���';

COMMENT ON COLUMN mh_board.content IS '����';

COMMENT ON COLUMN mh_board.starPoint IS '����';

COMMENT ON COLUMN mh_board.movieName IS '��ȭ��';

COMMENT ON COLUMN mh_board.director IS '������';

COMMENT ON COLUMN mh_board.movieCodeYoung IS '��ȭ�ڵ�(�����)';

COMMENT ON COLUMN mh_board.category IS '�帣';

COMMENT ON COLUMN mh_board.best IS '��õ';

COMMENT ON COLUMN mh_board.worst IS '����õ';

COMMENT ON COLUMN mh_board.notify IS '�Ű�';

COMMENT ON COLUMN mh_board.enable IS '��������';

COMMENT ON COLUMN mh_board.viewCount IS '��ȸ��';

ALTER TABLE mh_board
	ADD
		CONSTRAINT PK_mh_board
		PRIMARY KEY (
			seq
		);

/* mh_comment */
CREATE TABLE mh_comment (
	postDate DATE NOT NULL, /* �ۼ��� */
	userId VARCHAR2(100) NOT NULL, /* ȸ��ID */
	seq NUMBER NOT NULL, /* �۹�ȣ */
	content VARCHAR2(100) /* ���� */
);

COMMENT ON TABLE mh_comment IS 'mh_comment';

COMMENT ON COLUMN mh_comment.postDate IS '�ۼ���';

COMMENT ON COLUMN mh_comment.userId IS 'ȸ��ID';

COMMENT ON COLUMN mh_comment.seq IS '�۹�ȣ';

COMMENT ON COLUMN mh_comment.content IS '����';

ALTER TABLE mh_comment
	ADD
		CONSTRAINT PK_mh_comment
		PRIMARY KEY (
			postDate
		);

/* mh_social */
CREATE TABLE mh_social (
	userId VARCHAR2(100) NOT NULL, /* ȸ��ID */
	followingId VARCHAR2(100), /* �ȷ���ID */
	postDate DATE /* �ۼ��� */
);

COMMENT ON TABLE mh_social IS 'mh_social';

COMMENT ON COLUMN mh_social.userId IS 'ȸ��ID';

COMMENT ON COLUMN mh_social.followingId IS '�ȷ���ID';

COMMENT ON COLUMN mh_social.postDate IS '�ۼ���';

/* mh_user */
CREATE TABLE mh_user (
	userId VARCHAR2(100) NOT NULL, /* ȸ��ID */
	name VARCHAR2(16), /* �̸� */
	pass VARCHAR2(100), /* ��й�ȣ */
	phoneFirst VARCHAR2(3), /* �ڵ�����ȣ1 */
	phoneMid VARCHAR2(4), /* �ڵ�����ȣ2 */
	phoneLast VARCHAR2(4), /* �ڵ�����ȣ3 */
	birth VARCHAR2(16), /* ������� */
	gender VARCHAR2(2), /* ���� */
	joinDate DATE, /* ������ */
	outDate DATE, /* Ż���� */
	profile VARCHAR2(200), /* ȸ������ */
	enable NUMBER /* Ȱ��ȭ���� */
);

COMMENT ON TABLE mh_user IS 'mh_user';

COMMENT ON COLUMN mh_user.userId IS 'ȸ��ID';

COMMENT ON COLUMN mh_user.name IS '�̸�';

COMMENT ON COLUMN mh_user.pass IS '��й�ȣ';

COMMENT ON COLUMN mh_user.phoneFirst IS '�ڵ�����ȣ1';

COMMENT ON COLUMN mh_user.phoneMid IS '�ڵ�����ȣ2';

COMMENT ON COLUMN mh_user.phoneLast IS '�ڵ�����ȣ3';

COMMENT ON COLUMN mh_user.birth IS '�������';

COMMENT ON COLUMN mh_user.gender IS '����';

COMMENT ON COLUMN mh_user.joinDate IS '������';

COMMENT ON COLUMN mh_user.outDate IS 'Ż����';

COMMENT ON COLUMN mh_user.profile IS 'ȸ������';

COMMENT ON COLUMN mh_user.enable IS 'Ȱ��ȭ����';

ALTER TABLE mh_user
	ADD
		CONSTRAINT PK_mh_user
		PRIMARY KEY (
			userId
		);

/* mh_category */
CREATE TABLE mh_category (
	boardCode NUMBER NOT NULL, /* �Խ����ڵ� */
	boardName VARCHAR2(100) /* �Խ��Ǹ� */
);

COMMENT ON TABLE mh_category IS 'mh_category';

COMMENT ON COLUMN mh_category.boardCode IS '�Խ����ڵ�';

COMMENT ON COLUMN mh_category.boardName IS '�Խ��Ǹ�';

ALTER TABLE mh_category
	ADD
		CONSTRAINT PK_mh_category
		PRIMARY KEY (
			boardCode
		);

/* mh_wishlist */
CREATE TABLE mh_wishlist (
	userId VARCHAR2(100) NOT NULL, /* ȸ��ID */
	code NUMBER NOT NULL, /* �ڵ� */
	movieCodeNaver VARCHAR2(500), /* ��ȭ�ڵ�(���̹�) */
	movieCodeYoung VARCHAR2(500), /* ��ȭ�ڵ�(�����) */
	postDate DATE /* �ۼ��� */
);

COMMENT ON TABLE mh_wishlist IS 'mh_wishlist';

COMMENT ON COLUMN mh_wishlist.userId IS 'ȸ��ID';

COMMENT ON COLUMN mh_wishlist.code IS '�ڵ�';

COMMENT ON COLUMN mh_wishlist.movieCodeNaver IS '��ȭ�ڵ�(���̹�)';

COMMENT ON COLUMN mh_wishlist.movieCodeYoung IS '��ȭ�ڵ�(�����)';

COMMENT ON COLUMN mh_wishlist.postDate IS '�ۼ���';

/* mh_wishlistcate */
CREATE TABLE mh_wishcate (
	code NUMBER NOT NULL, /* �ڵ� */
	category VARCHAR2(100) /* �з��� */
);

COMMENT ON TABLE mh_wishcate IS 'mh_wishlistcate';

COMMENT ON COLUMN mh_wishcate.code IS '�ڵ�';

COMMENT ON COLUMN mh_wishcate.category IS '�з���';

ALTER TABLE mh_wishcate
	ADD
		CONSTRAINT PK_mh_wishcate
		PRIMARY KEY (
			code
		);

/* mh_visitor */
CREATE TABLE mh_visitor (
	connectDate DATE NOT NULL, /* ���ӳ�¥ */
	visitor NUMBER DEFAULT 0 /* �湮�ڼ� */
);

COMMENT ON TABLE mh_visitor IS 'mh_visitor';

COMMENT ON COLUMN mh_visitor.connectDate IS '���ӳ�¥';

COMMENT ON COLUMN mh_visitor.visitor IS '�湮�ڼ�';

ALTER TABLE mh_visitor
	ADD
		CONSTRAINT PK_mh_visitor
		PRIMARY KEY (
			connectDate
		);

/* mh_log */
CREATE TABLE mh_log (
	logDate DATE NOT NULL, /* Ȱ���ð� */
	logId VARCHAR2(100), /* Ȱ����ID */
	userId VARCHAR2(100), /* �ۼ���ID */
	logCate NUMBER, /* Ȱ���з� */
	subject VARCHAR2(100), /* ���� */
	movieCodeYoung CLOB /* ��ȭ�ڵ�(�����) */
);

COMMENT ON TABLE mh_log IS 'mh_log';

COMMENT ON COLUMN mh_log.logDate IS 'Ȱ���ð�';

COMMENT ON COLUMN mh_log.logId IS 'Ȱ����ID';

COMMENT ON COLUMN mh_log.userId IS '�ۼ���ID';

COMMENT ON COLUMN mh_log.logCate IS 'Ȱ���з�';

COMMENT ON COLUMN mh_log.subject IS '����';

COMMENT ON COLUMN mh_log.movieCodeYoung IS '��ȭ�ڵ�(�����)';

ALTER TABLE mh_log
	ADD
		CONSTRAINT PK_mh_log
		PRIMARY KEY (
			logDate
		);

/* mh_films */
CREATE TABLE TABLE (
	movieCodeYoung VARCHAR2(30) NOT NULL, /* ��������ȭ�ڵ� */
	movieName VARCHAR2(200), /* ��ȭ�� */
	movieCodeNaver VARCHAR2(30), /* ���̹���ȭ�ڵ� */
	prdtYear VARCHAR2(8), /* ���۳⵵ */
	openYear VARCHAR2(8), /* �������� */
	category VARCHAR2(100), /* �帣 */
	movieImage CLOB, /* ��ȭ�̹��� */
	starPointNaver FLOAT(126) /* ���̹����� */
);

COMMENT ON TABLE TABLE IS 'mh_films';

COMMENT ON COLUMN TABLE.movieCodeYoung IS '��������ȭ�ڵ�';

COMMENT ON COLUMN TABLE.movieName IS '��ȭ��';

COMMENT ON COLUMN TABLE.movieCodeNaver IS '���̹���ȭ�ڵ�';

COMMENT ON COLUMN TABLE.prdtYear IS '���۳⵵';

COMMENT ON COLUMN TABLE.openYear IS '��������';

COMMENT ON COLUMN TABLE.category IS '�帣';

COMMENT ON COLUMN TABLE.movieImage IS '��ȭ�̹���';

COMMENT ON COLUMN TABLE.starPointNaver IS '���̹�����';

ALTER TABLE TABLE
	ADD
		CONSTRAINT PK_TABLE
		PRIMARY KEY (
			movieCodeYoung
		);

ALTER TABLE mh_board
	ADD
		CONSTRAINT FK_mh_user_TO_mh_board
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_board
	ADD
		CONSTRAINT FK_mh_category_TO_mh_board
		FOREIGN KEY (
			boardCode
		)
		REFERENCES mh_category (
			boardCode
		);

ALTER TABLE mh_comment
	ADD
		CONSTRAINT FK_mh_user_TO_mh_comment
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_comment
	ADD
		CONSTRAINT FK_mh_board_TO_mh_comment
		FOREIGN KEY (
			seq
		)
		REFERENCES mh_board (
			seq
		);

ALTER TABLE mh_social
	ADD
		CONSTRAINT FK_mh_user_TO_mh_social
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

ALTER TABLE mh_wishlist
	ADD
		CONSTRAINT FK_mh_wishcate_TO_mh_wishlist
		FOREIGN KEY (
			code
		)
		REFERENCES mh_wishcate (
			code
		);

ALTER TABLE mh_wishlist
	ADD
		CONSTRAINT FK_mh_user_TO_mh_wishlist
		FOREIGN KEY (
			userId
		)
		REFERENCES mh_user (
			userId
		);

/* sequence1 */
DROP SEQUENCE seq;

/* sequence1 */
CREATE SEQUENCE seq
	start with 100;