-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.12-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;

-- 테이블 test.bbs_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_account` (
  `accountId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
  `accountEmail` varchar(80) COLLATE utf8mb4_bin NOT NULL COMMENT '계정이메일',
  `accountPassword` varchar(80) COLLATE utf8mb4_bin NOT NULL COMMENT '계정암호',
  `userName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '사용자명',
  `userPhoneNumber` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '사용자폰번호',
  `birthDay` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '생년월일',
  `sexCode` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '성별코드',
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '생성일시',
  `createHost` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '생성ID',
  `UpdateDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  `updateHost` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '수정ID',
  PRIMARY KEY (`accountId`),
  UNIQUE KEY `accountEmail` (`accountEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='계정';

-- 테이블 데이터 test.bbs_account:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_account` DISABLE KEYS */;
INSERT INTO `bbs_account` (`accountId`, `accountEmail`, `accountPassword`, `userName`, `userPhoneNumber`, `birthDay`, `sexCode`, `createDatetime`, `createHost`, `UpdateDatetime`, `updateHost`) VALUES
	(1, 'asd@gmail.com', '1234', 'asd', '01029774088', '19950111', 'M', '2020-05-18 14:28:45', 'admin', '2020-05-18 14:28:45', 'admin'),
	(2, 'zxc@gmail.com', '1234', 'zxc', '01012345678', '19940111', 'M', '2020-05-18 14:29:45', 'admin', '2020-05-18 14:29:45', 'admin');
/*!40000 ALTER TABLE `bbs_account` ENABLE KEYS */;

-- 테이블 test.bbs_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_board` (
  `boardId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
  `accountId` bigint(20) DEFAULT NULL COMMENT '계정ID',
  `title` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글제목',
  `content` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글내용',
  `writer` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글쓴이',
  `viewCnt` int(20) unsigned DEFAULT 0 COMMENT '조회수',
  `replyCnt` int(20) DEFAULT 0 COMMENT '댓글수',
  `boardDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '글생성일시',
  `boardUpDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '글수정일시',
  PRIMARY KEY (`boardId`),
  KEY `FK_bbs_account_TO_bbs_board` (`accountId`),
  CONSTRAINT `FK_bbs_account_TO_bbs_board` FOREIGN KEY (`accountId`) REFERENCES `bbs_account` (`accountId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='게시판';

-- 테이블 데이터 test.bbs_board:~30 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_board` DISABLE KEYS */;
INSERT INTO `bbs_board` (`boardId`, `accountId`, `title`, `content`, `writer`, `viewCnt`, `replyCnt`, `boardDatetime`, `boardUpDatetime`) VALUES
	(5, 1, '글을 작성합니다', '글쓰기가 잘되용', 'admin', 1, 0, '2020-05-19 14:38:35', '2020-05-21 11:00:54'),
	(6, 1, '안녕하세요 관리자님', '관리자님 안녕하신가요 반가워요', 'admin', 1, 0, '2020-05-19 14:39:06', '2020-05-21 11:00:54'),
	(7, 1, '안녕하세요 새로운 form 입니다,', '새로운 폼으로 작성 중 입니다. 안녕', 'admin', 1, 0, '2020-05-20 10:36:39', '2020-05-21 11:00:54'),
	(10, 1, '글 수정을 하고 싶어요.', '글쓰기 테스트 중입니다.', 'admin', 0, 0, '2020-05-20 14:51:38', '2020-05-21 11:00:54'),
	(11, 1, '글쓰기 테스트 11', '글쓰기 테스트 11입니다', 'admin', 0, 0, '2020-05-20 14:52:05', '2020-05-21 11:00:54'),
	(12, 1, '글쓰기 테스트 12 수정합니다', '글쓰기 수정 했어요', 'admin', 0, 0, '2020-05-20 14:52:40', '2020-05-21 13:06:00'),
	(13, 1, '글쓰기 좋아요를 수정했어요13', '내용을 입력하고 있어요. 수정한 시간이 생겨요 수정시간도 생겨용', 'admin', 0, 0, '2020-05-21 10:58:27', '2020-05-21 13:06:42'),
	(14, 1, '게시판 테스트', '게시판 테스트1 입니다', 'test', 0, 0, '2020-05-21 17:57:03', '2020-05-21 17:57:03'),
	(15, 1, '게시판 테스트', '게시판 테스트1 입니다', 'test', 0, 0, '2020-05-21 17:57:16', '2020-05-21 17:57:16'),
	(16, 1, '게시판 테스트', '게시판 테스트16 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(18, 1, '게시판 테스트', '게시판 테스트18 입니다', 'test', 1, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(19, 1, '게시판 테스트', '게시판 테스트19 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(20, 1, '게시판 테스트', '게시판 테스트20 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(21, 1, '게시판 테스트', '게시판 테스트21 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(22, 1, '게시판 테스트', '게시판 테스트22 입니다', 'test', 2, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(23, 1, '게시판 테스트', '게시판 테스트23 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(24, 1, '게시판 테스트', '게시판 테스트24 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(25, 1, '게시판 테스트', '게시판 테스트25 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(26, 1, '게시판 테스트', '게시판 테스트26 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(27, 1, '게시판 테스트', '게시판 테스트27 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(28, 1, '게시판 테스트', '게시판 테스트28 입니다', 'test', 0, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(29, 1, '게시판 테스트', '게시판 테스트29 입니다', 'test', 1, 0, '2020-05-21 18:00:14', '2020-05-21 18:00:14'),
	(30, 1, '게시판 테스트 30 수정2', '게시판 테스트30 입니다 수정2', 'test', 11, 0, '2020-05-21 18:00:14', '2020-05-27 14:00:54'),
	(33, 1, '0529 글쓰기 생성 수정', ' 글쓰기 입니다 수정', 'admin', 22, 1, '2020-05-29 16:26:51', '2020-06-01 10:05:06'),
	(34, 1, '안녕하세요 aaaa', '안녕하세요 글쓰기 테스트 입니다. bb', 'admin', 23, 0, '2020-06-01 14:37:10', '2020-06-01 14:37:32'),
	(35, 1, '두번째 글 작성', 'dddddd', 'admin', 3, 0, '2020-06-02 17:31:42', '2020-06-02 17:31:42'),
	(38, 1, '좋은 원단 고르는 방법 알려주세요', 'ddddddd', 'admin', 2, 0, '2020-06-11 11:30:10', '2020-06-11 11:30:10'),
	(39, 1, 'ddd', 'dddddd', 'admin', 0, 0, '2020-06-11 11:40:13', '2020-06-11 11:40:13'),
	(40, 1, 'ㄴㅇㄹㄴㅇㄹ', 'sdfsdfsdfsdf', 'admin', 1, 0, '2020-06-11 11:44:49', '2020-06-11 11:44:49'),
	(42, 1, 'testsetset', 'dfdfdfdfd', 'admin', 16, 2, '2020-06-11 11:52:14', '2020-06-11 11:52:14');
/*!40000 ALTER TABLE `bbs_board` ENABLE KEYS */;

-- 테이블 test.bbs_board_2 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_board_2` (
  `boardId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
  `originNo` int(10) DEFAULT 0 COMMENT '원글번호',
  `grpNo` int(10) DEFAULT 0 COMMENT '원글(답글포함) 그룹번호',
  `grpOrd` int(10) DEFAULT 0 COMMENT '그룹내 답글번호',
  `grpLayer` int(10) DEFAULT 0 COMMENT '답글계층번호',
  `title` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글제목',
  `content` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글내용',
  `writer` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '글생성자',
  `boardDatetime` datetime DEFAULT current_timestamp() COMMENT '글생성일시',
  PRIMARY KEY (`boardId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='게시판-계층형';

-- 테이블 데이터 test.bbs_board_2:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_board_2` DISABLE KEYS */;
INSERT INTO `bbs_board_2` (`boardId`, `originNo`, `grpNo`, `grpOrd`, `grpLayer`, `title`, `content`, `writer`, `boardDatetime`) VALUES
	(1, 1, 1, 0, 0, '게시판 테스트입니다', '게시판 테스트를 하는 중입니다.', 'admin1', '2020-05-18 10:30:51'),
	(2, 2, 2, 0, 0, '게시판 테스트입니다', '게시판 테스트를 하는 중입니다.', 'admin1', '2020-05-18 10:30:51'),
	(3, 3, 3, 0, 0, '게시판 테스트입니다', '게시판 테스트를 하는 중입니다.', 'admin1', '2020-05-18 10:30:51'),
	(4, 4, 4, 0, 0, '게시판 테스트입니다', '게시판 테스트를 하는 중입니다.', 'admin1', '2020-05-18 10:30:51'),
	(5, 5, 5, 0, 0, '게시판 테스트입니다2', '게시판 테스트를 하는 중입니다.', 'admin2', '2020-05-18 10:30:55');
/*!40000 ALTER TABLE `bbs_board_2` ENABLE KEYS */;

-- 테이블 test.bbs_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_file` (
  `fileId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
  `boardId` bigint(20) NOT NULL COMMENT '게시판ID',
  `accountId` bigint(20) NOT NULL COMMENT '계정ID',
  `fileName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '파일이름',
  `fileSize` bigint(50) DEFAULT 0 COMMENT '파일사이즈',
  PRIMARY KEY (`fileId`),
  KEY `FK_bbs_board_TO_bbs_file` (`boardId`),
  CONSTRAINT `FK_bbs_board_TO_bbs_file` FOREIGN KEY (`boardId`) REFERENCES `bbs_board` (`boardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='파일';

-- 테이블 데이터 test.bbs_file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_file` ENABLE KEYS */;

-- 테이블 test.bbs_files 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_files` (
  `fileId` bigint(20) NOT NULL DEFAULT 0 COMMENT '파일ID',
  `fileName` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '파일명',
  `fileType` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '파일타입',
  `fileData` blob DEFAULT NULL COMMENT '파일data',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='파일';

-- 테이블 데이터 test.bbs_files:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbs_files` ENABLE KEYS */;

-- 테이블 test.bbs_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs_reply` (
  `replyId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'idx',
  `accountId` bigint(20) NOT NULL COMMENT '계정ID',
  `boardId` bigint(20) NOT NULL COMMENT '게시판ID',
  `replyWriter` varchar(60) COLLATE utf8mb4_bin NOT NULL COMMENT '댓글작성자',
  `replyContent` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '댓글내용',
  `replyDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글생성일시',
  `replyCnt` int(20) unsigned DEFAULT 0 COMMENT '댓글수',
  PRIMARY KEY (`replyId`),
  KEY `accountId` (`accountId`),
  KEY `boardId` (`boardId`),
  CONSTRAINT `accountId` FOREIGN KEY (`accountId`) REFERENCES `bbs_account` (`accountId`) ON DELETE CASCADE,
  CONSTRAINT `boardId` FOREIGN KEY (`boardId`) REFERENCES `bbs_board` (`boardId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='게시판댓글';

-- 테이블 데이터 test.bbs_reply:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bbs_reply` DISABLE KEYS */;
INSERT INTO `bbs_reply` (`replyId`, `accountId`, `boardId`, `replyWriter`, `replyContent`, `replyDatetime`, `replyCnt`) VALUES
	(35, 1, 42, 'admin_test', 'ㅇㅇㅇ', '2020-06-23 18:15:49', 0),
	(38, 1, 42, 'admin_test', 'ㄷㄱㄷㄱㄷㄱ', '2020-06-23 18:24:08', 0),
	(39, 1, 42, 'admin_test', 'ㅇㅇㅇㅇ', '2020-06-23 18:33:26', 0),
	(40, 1, 42, 'admin_test', 'ㅇㅇㅇㅇㅇㅇ', '2020-06-23 18:33:34', 0);
/*!40000 ALTER TABLE `bbs_reply` ENABLE KEYS */;

-- 테이블 test.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 test.test:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`NAME`, `PASSWORD`) VALUES
	('red', '1234'),
	('red', '1234'),
	('blue', '1234');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 테이블 test.user_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `accountEmail` varchar(80) COLLATE utf8mb4_bin NOT NULL COMMENT '계정이메일',
  `accountPassword` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '계정암호',
  `userName` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '사용자명',
  `userPhoneNumber` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '사용자폰번호',
  `birthDay` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '생년월일',
  `sexCode` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '성별코드',
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '생성일시',
  `createHost` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '생성ID',
  `updateDatetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  `updateHost` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '수정ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountEmail` (`accountEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='계정';

-- 테이블 데이터 test.user_account:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` (`id`, `accountEmail`, `accountPassword`, `userName`, `userPhoneNumber`, `birthDay`, `sexCode`, `createDatetime`, `createHost`, `updateDatetime`, `updateHost`) VALUES
	(1, 'asd@gmail.com', '1234', 'asd', '01026847984', '19950703', 'M', '2020-05-12 13:55:41', 'admin', '2020-05-12 13:55:41', 'admin'),
	(2, 'qwe@gmail.com', '1234', 'qwe', '01012345678', '19950703', 'M', '2020-05-12 13:55:41', 'admin', '2020-05-12 13:55:41', 'admin');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
