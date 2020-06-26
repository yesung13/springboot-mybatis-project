CREATE TABLE `bbs_account` (
	`accountId` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
	`accountEmail` VARCHAR(80) NOT NULL COMMENT '계정이메일' COLLATE 'utf8mb4_bin',
	`accountPassword` VARCHAR(80) NOT NULL COMMENT '계정암호' COLLATE 'utf8mb4_bin',
	`userName` VARCHAR(50) NULL DEFAULT NULL COMMENT '사용자명' COLLATE 'utf8mb4_bin',
	`userPhoneNumber` VARCHAR(30) NULL DEFAULT NULL COMMENT '사용자폰번호' COLLATE 'utf8mb4_bin',
	`birthDay` VARCHAR(8) NULL DEFAULT NULL COMMENT '생년월일' COLLATE 'utf8mb4_bin',
	`sexCode` VARCHAR(1) NULL DEFAULT NULL COMMENT '성별코드' COLLATE 'utf8mb4_bin',
	`createDatetime` DATETIME NOT NULL DEFAULT current_timestamp() COMMENT '생성일시',
	`createHost` VARCHAR(40) NOT NULL COMMENT '생성ID' COLLATE 'utf8mb4_bin',
	`UpdateDatetime` DATETIME NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
	`updateHost` VARCHAR(40) NOT NULL COMMENT '수정ID' COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`accountId`),
	UNIQUE INDEX `accountEmail` (`accountEmail`)
)
COMMENT='계정'
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;


CREATE TABLE `bbs_board` (
	`boardId` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
	`accountId` BIGINT(20) NOT NULL COMMENT '계정ID',
	`title` VARCHAR(500) NULL DEFAULT NULL COMMENT '글제목' COLLATE 'utf8mb4_bin',
	`content` VARCHAR(4000) NULL DEFAULT NULL COMMENT '글내용' COLLATE 'utf8mb4_bin',
	`writer` VARCHAR(80) NULL DEFAULT NULL COMMENT '글쓴이' COLLATE 'utf8mb4_bin',
	`viewCnt` INT(20) NULL DEFAULT 0 COMMENT '조회수',
	`replyCnt` INT(20) NULL DEFAULT 0 COMMENT '댓글수',
	`boardDatetime` DATETIME NOT NULL DEFAULT current_timestamp() COMMENT '글생성일시',
	PRIMARY KEY (`boardId`),
	INDEX `FK_bbs_account_TO_bbs_board` (`accountId`),
	CONSTRAINT `FK_bbs_account_TO_bbs_board` FOREIGN KEY (`accountId`) REFERENCES `bbs_account` (`accountId`)
)
COMMENT='게시판'
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;


CREATE TABLE `bbs_reply` (
	`replyId` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
	`accountId` BIGINT(20) NOT NULL COMMENT '계정ID',
	`boardId` BIGINT(20) NOT NULL COMMENT '게시판ID',
	`replyWriter` VARCHAR(60) NOT NULL COMMENT '댓글작성자' COLLATE 'utf8mb4_bin',
	`replyContent` VARCHAR(2000) NULL DEFAULT NULL COMMENT '댓글내용' COLLATE 'utf8mb4_bin',
	`replyDatetime` DATETIME NOT NULL DEFAULT current_timestamp() COMMENT '댓글생성일시',
	PRIMARY KEY (`replyId`),
	INDEX `accountId` (`accountId`),
	INDEX `boardId` (`boardId`),
	CONSTRAINT `accountId` FOREIGN KEY (`accountId`) REFERENCES `bbs_account` (`accountId`),
	CONSTRAINT `boardId` FOREIGN KEY (`boardId`) REFERENCES `bbs_board` (`boardId`)
)
COMMENT='게시판댓글'
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;


CREATE TABLE `bbs_file` (
	`fileId` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
	`boardId` BIGINT(20) NOT NULL COMMENT '게시판ID',
	`accountId` BIGINT(20) NOT NULL COMMENT '계정ID',
	`fileName` VARCHAR(255) NULL DEFAULT NULL COMMENT '파일이름' COLLATE 'utf8mb4_bin',
	`fileSize` BIGINT(50) NULL DEFAULT 0 COMMENT '파일사이즈',
	PRIMARY KEY (`fileId`),
	INDEX `FK_bbs_board_TO_bbs_file` (`boardId`),
	CONSTRAINT `FK_bbs_board_TO_bbs_file` FOREIGN KEY (`boardId`) REFERENCES `bbs_board` (`boardId`)
)
COMMENT='파일'
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;

#bbs_account
insert into bbs_account (accountEmail, accountPassword, userName, userPhoneNumber, birthDay, sexCode, createDatetime,
                         createHost, UpdateDatetime, updateHost)
VALUES ('asd@gmail.com', '1234', 'asd', '01029774088', '19950111', 'M', '2020-05-18 14:28:45', 'admin',
        '2020-05-18 14:28:45', 'admin');

insert into bbs_account (accountEmail, accountPassword, userName, userPhoneNumber, birthDay, sexCode, createDatetime,
                         createHost, UpdateDatetime, updateHost)
VALUES ('zxc@gmail.com', '1234', 'zxc', '01012345678', '19940111', 'M', '2020-05-18 14:29:45', 'admin',
        '2020-05-18 14:29:45', 'admin');

#bbs_board
select * from bbs_board;

insert into bbs_board(accountId, title, content, viewCnt, replyCnt, boardDatetime)
VALUES (1, '게시판 테스트', '게시판 테스트1 입니다', 0, 0, '2020-05-18 14:30:45');

insert into bbs_board(accountId, title, content, viewCnt, replyCnt, boardDatetime)
VALUES (1, '게시판 테스트2', '게시판 테스트2 입니다', 0, 0, '2020-05-18 14:30:45');

insert into bbs_board(accountId, title, content, viewCnt, replyCnt, boardDatetime)
VALUES (2, '게시판 테스트3', '게시판 테스트3 입니다', 0, 0, '2020-05-18 14:30:45');