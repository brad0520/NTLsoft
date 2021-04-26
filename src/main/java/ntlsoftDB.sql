# DB 생성
DROP DATABASE IF EXISTS ntlsoft;
CREATE DATABASE ntlsoft;
USE ntlsoft;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    regDate DATETIME NOT NULL COMMENT '작성날짜',
    updateDate DATETIME NOT NULL COMMENT '수정날짜',
    boardId INT(10) UNSIGNED NOT NULL COMMENT '게시판번호',
    memberId INT(10) UNSIGNED NOT NULL COMMENT '회원번호',
    title CHAR(100) NOT NULL COMMENT '제목',
    `body` TEXT NOT NULL COMMENT '본문',
    blindStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    blindDate DATETIME COMMENT '블라인드날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    delDate DATETIME COMMENT '삭제날짜',
    hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '조회수',
    repliesCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '댓글수',
    likeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '좋아요수',
    dislikeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '싫어요수'
);

# 게시물 테스트 데이터 생성
## 1번회원이 1번 게시판에 1번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = '제목1',
`body` = '본문1';

## 1번회원이 1번 게시판에 2번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = '제목2',
`body` = '본문2';

## 1번회원이 1번 게시판에 3번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = '제목3',
`body` = '본문3';

## 2번회원이 1번 게시판에 4번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 2,
title = '제목4',
`body` = '본문4';

## 2번회원이 2번 게시판에 5번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 2,
title = '제목5',
`body` = '본문5';

## 2번회원이 2번 게시판에 6번글 작성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 2,
title = '제목6',
`body` = '본문6';

/*
## 게시물 대량 생성 추
INSERT INTO article
(regDate, updateDate, memberId, title, `body`)
SELECT NOW(), NOW(), FLOOR(RAND() * 2) + 1, CONCAT('제목_', FLOOR(RAND() * 1000) + 1), CONCAT('내용_', FLOOR(RAND() * 1000) + 1)
FROM article;
*/

# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    regDate DATETIME NOT NULL COMMENT '작성날짜',
    updateDate DATETIME NOT NULL COMMENT '수정날짜',
    `code` CHAR(20) NOT NULL UNIQUE COMMENT '코드',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '이름',
    blindStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '블라인드여부',
    blindDate DATETIME COMMENT '블라인드날짜',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제여부',
    delDate DATETIME COMMENT '삭제날짜',
    hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '조회수',
    repliesCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '댓글수',
    likeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '좋아요수',
    dislikeCount INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '싫어요수'
);

# 게시판 테스트 데이터 생성
## 공지사항 게시판 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'NOTICE',
`code` = 'notice';

## 자유 게시판 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'FREE',
`code` = 'free';

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '번호',
    regDate DATETIME NOT NULL COMMENT '작성날짜',
    updateDate DATETIME NOT NULL COMMENT '수정날짜',
    loginId CHAR(20) NOT NULL UNIQUE COMMENT '로그인아이디',
    loginPw VARCHAR(50) NOT NULL COMMENT '로그인비번',
    `name` CHAR(50) NOT NULL COMMENT '이름',
    nickname CHAR(50) NOT NULL COMMENT '별명',
    email CHAR(50) NOT NULL COMMENT '이메일',
    cellphoneNo CHAR(15) NOT NULL COMMENT '휴대전화번호',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부',
    delDate DATETIME COMMENT '탈퇴날짜'
);

# 회원 테스트 데이터 생성
## 1번 회원 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` = '유저1이름',
nickname = '유저1별명',
email = 'brad0135@gmail.com',
cellphoneNo = '01012341234';

# 회원 테스트 데이터 생성
## 2번 회원 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = '유저2이름',
nickname = '유저2별명',
email = 'brad0135@gmail.com',
cellphoneNo = '01012341234';

# 회원 테스트 데이터 생성
## 3번 회원 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user3',
loginPw = 'user3',
`name` = '유저3이름',
nickname = '유저3별명',
email = 'brad0135@gmail.com',
cellphoneNo = '01012341234';



# 댓글 테이블 추가
CREATE TABLE reply (
  id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  regDate DATETIME NOT NULL,
  updateDate DATETIME NOT NULL,
  articleId INT(10) UNSIGNED NOT NULL,
  memberId INT(10) UNSIGNED NOT NULL,
  `body` TEXT NOT NULL
);

INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
articleId = 1,
memberId = 1,
`body` = "내용1 입니다.";

INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
articleId = 1,
memberId = 2,
`body` = "내용2 입니다.";

INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
articleId = 2,
memberId = 2,
`body` = "내용3 입니다.";

# 게시물 전용 댓글에서 범용 댓글로 바꾸기 위해 relTypeCode 추가
ALTER TABLE reply ADD COLUMN `relTypeCode` CHAR(20) NOT NULL AFTER updateDate;

# 현재는 게시물 댓글 밖에 없기 때문에 모든 행의 relTypeCode 값을 article 로 지정
UPDATE reply
SET relTypeCode = 'article'
WHERE relTypeCode = '';

# articleId 칼럼명을 relId로 수정
ALTER TABLE reply CHANGE `articleId` `relId` INT(10) UNSIGNED NOT NULL;

# 고속 검색을 위해서 인덱스 걸기
ALTER TABLE reply ADD KEY (relTypeCode, relId); 
# SELECT * FROM reply WHERE relTypeCode = 'article' AND relId = 5; # O
# SELECT * FROM reply WHERE relTypeCode = 'article'; # O
# SELECT * FROM reply WHERE relId = 5 AND relTypeCode = 'article'; # X

# authKey 칼럼을 추가
ALTER TABLE `member` ADD COLUMN authKey CHAR(80) NOT NULL AFTER loginPw;

# 기존 회원의 authKey 데이터 채우기
UPDATE `member`
SET authKey = 'authKey1__1'
WHERE id = 1;

UPDATE `member`
SET authKey = 'authKey1__2'
WHERE id = 2;

# authKey 칼럼에 유니크 인덱스 추가
ALTER TABLE `member` ADD UNIQUE INDEX (`authKey`);

# 파일 테이블 추가
CREATE TABLE genFile (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, # 번호
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delDate DATETIME DEFAULT NULL, # 삭제날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  relTypeCode CHAR(50) NOT NULL, # 관련 데이터 타입(article, member)
  relId INT(10) UNSIGNED NOT NULL, # 관련 데이터 번호
  originFileName VARCHAR(100) NOT NULL, # 업로드 당시의 파일이름
  fileExt CHAR(10) NOT NULL, # 확장자
  typeCode CHAR(20) NOT NULL, # 종류코드 (common)
  type2Code CHAR(20) NOT NULL, # 종류2코드 (attatchment)
  fileSize INT(10) UNSIGNED NOT NULL, # 파일의 사이즈
  fileExtTypeCode CHAR(10) NOT NULL, # 파일규격코드(img, video)
  fileExtType2Code CHAR(10) NOT NULL, # 파일규격2코드(jpg, mp4)
  fileNo SMALLINT(2) UNSIGNED NOT NULL, # 파일번호 (1)
  fileDir CHAR(20) NOT NULL, # 파일이 저장되는 폴더명
  PRIMARY KEY (id),
  KEY relId (relId,relTypeCode,typeCode,type2Code,fileNo)
);

# 회원 테이블에 권한레벨 필드 추가
ALTER TABLE `member`
ADD COLUMN `authLevel` SMALLINT(2) UNSIGNED
DEFAULT 3 NOT NULL COMMENT '(3=일반,7=관리자)' AFTER `loginPw`; 

# 1번 회원을 관리자로 지정한다.
UPDATE `member`
SET authLevel = 7
WHERE id = 1;

/*
INSERT INTO article
(regDate, updateDate, memberId, title, `body`, boardId)
SELECT NOW(),
NOW(),
FLOOR(RAND() * 2) + 1,
CONCAT('제목_', FLOOR(RAND() * 1000) + 1),
CONCAT('내용_', FLOOR(RAND() * 1000) + 1),
FLOOR(RAND() * 2) + 1
FROM article;
*/