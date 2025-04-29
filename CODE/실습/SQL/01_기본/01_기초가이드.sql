-- Active: 1745889708778@@127.0.0.1@3306@aloha
-- 계정 생성
CREATE USER 'test'@'localhost' IDENTIFIED by '123456';

-- 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' WITH GRANT OPTION;

-- 데이터베이스 생성
-- 식별자가 키워드(예약어)와 같은 경우 `이름` 형태로 정의할 수 있다.
CREATE DATABASE `test`;

-- 테이블 생성
DROP TABLE IF EXISTS `board`;
CREATE Table `board` (
    `no`            INT              AUTO_INCREMENT PRIMARY KEY     COMMENT '번호',
    `id`            VARCHAR(64)      UNIQUE                         COMMENT '아이디',
    `title`         VARCHAR(100)     NOT NULL                       COMMENT '제목',
    `writer`        VARCHAR(45)      NOT NULL                       COMMENT '작성자',
    `content`       TEXT             NULL                           COMMENT '내용',
    `created_at`    TIMESTAMP        NOT NULL DEFAULT now()         COMMENT '등록일자',
    `updated_at`    TIMESTAMP        NOT NULL DEFAULT now()         COMMENT '수정일자'
) COMMENT '게시판';
-- 데이터 베이스에서는 대소문자 구문이 없어서 스네이크케이스(_); 언더스코어 케이스를 쓴다.

-- 데이터 추가
INSERT INTO board (no, id, title, writer, content, created_at, updated_at)
VALUES ( 1, UUID(), '제목01', '작성자01', '내용01', now(), now());

-- AUTO_INCREMENT, DEFAULT 적용된 컬럼은 생략하고 추가 가능
INSERT INTO board (no, id, title, writer, content)
VALUES ( 2, UUID(), '제목02', '작성자02', '내용02');

-- 모든 컬럼 생략 시, 모든 값을 다 지정해야한다.
INSERT INTO board
VALUES(3, UUID(), '제목03', '작성자03', '내용03', now(), now() );


-- 데이터 조회
SELECT * 
FROM board;
WHERE title = '제목02';

SELECT * 
FROM board
ORDER BY created_at DESC;

-- 데이터 수정
UPDATE board
set title = '수정',
    writer = '수정',
    content = '수정',
    updated_at = now()
    WHERE no = 1;

SELECT * FROM board;

-- 데이터 삭제
DELETE FROM board
WHERE no = 1;

SELECT * FROM board;

-- 테이블 수정 
-- 컬럼 수정
ALTER Table board ADD COLUMN `views` INT NOT NULL DEFAULT 0 COMMENT '조회수';
-- 컬럼 삭제
ALTER TABLE board DROP COLUMN `views`;
-- 테이블 구조 확인
DESC board;

SELECT * FROM board;

-- 테이블 데이터 전체 삭제
-- * 되돌리기 불가
TRUNCATE Table board;

-- TCL 실습

--트랜잭션 시작
START TRANSACTION;

-- 게시글 데이터 추가 - 제목001
INSERT INTO board (id, title, writer, content)
VALUES(UUID(), '제목001','작성자', '내용');
-- 잘못된 데이터 추가 - 잘못된 글
INSERT INTO board (id, title, writer, content)
VALUES(UUID(), '잘못된 글','작성자2', '잘못된 내용');


-- 트랜잭션 수행 변경사항 취소 
ROLLBACK

START TRANSACTION;

-- 게시글 데이터 추가 = 제목 001
INSERT INTO board (id, title, writer, content)
VALUES(UUID(), '제목001','작성자', '내용');

-- * COMMIT: 트랜잭션 수행 변경사항 적용

COMMIT