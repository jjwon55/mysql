-- Active: 1745889708778@@127.0.0.1@3306@community



-- DROP DATABASE IF EXISTS `community`;
-- CREATE DATABASE `community`
--     DEFAULT CHARACTER SET = 'utf8mb4';



DROP TABLE IF EXISTS `File`;
DROP TABLE IF EXISTS `COMMENTS`;

DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;


CREATE TABLE `user` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT '회원번호',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`uesername`	VARCHAR(100)	NOT NULL	COMMENT '아이디',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`name`	VARCHAR(50)	NOT NULL	COMMENT '이름',
	`email`	VARCHAR(200)	NOT NULL	COMMENT '이메일',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자'
) COMMENT '회원';



CREATE TABLE `posts` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT '게시글번호',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`user_no`	BIGINT	NOT NULL	COMMENT '회원번호',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP 	COMMENT '수정일자',
	 FOREIGN KEY (`user_no`) REFERENCES `user` (`no`)
)COMMENT '게시글';





CREATE TABLE `COMMENTS` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT '댓글번호',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`post_no`	BIGINT	NOT NULL	COMMENT '게시글번호',
	`user_no`	BIGINT	NOT NULL	COMMENT '회원번호',
	`content`	VARCHAR(64)	NOT NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP  COMMENT '수정일자',
	 FOREIGN KEY (`post_no`) REFERENCES `posts`(`no`),
	 FOREIGN KEY (`user_no`) REFERENCES `user`(`no`)
) COMMENT '댓글';


CREATE TABLE `File` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT '파일번호',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`post_no`	BIGINT	NOT NULL	COMMENT '게시글 번호',
	`file_name`	VARCHAR(100)	NOT NULL	COMMENT '파일명',
	`file_path`	VARCHAR(255)	NOT NULL	COMMENT '파일경로',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	FOREIGN KEY (`post_no`) REFERENCES `posts`(`no`)
) COMMENT '파일';

