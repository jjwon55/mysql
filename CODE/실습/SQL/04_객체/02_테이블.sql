-- Active: 1745889708778@@127.0.0.1@3306@test_db
-- 테이블 생성

/* 
    CREATE TABLE 데이커베이스. 테이블명 (
        칼럼1       데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명'),
        칼럼2       데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명'),
        칼럼3       데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명') (마지막 , 빼기!!!)
    ) COMMENT '테이블설명';
 */

-- 공통 테이블 생성
 CREATE TABLE common (
    no          BIGINT       AUTO_INCREMENT PRIMARY KEY COMMENT 'PK',
    id          VARCHAR(64)  UNIQUE                     COMMENT 'UK',
    name        VARCHAR(100) NOT NULL                   COMMENT '이름',
    value       INT          NOT NULL DEFAULT 0         COMMENT '값',
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자', 
    updated_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP 
                                        ON UPDATE CURRENT_TIMESTAMP
                                        COMMENT '수정일자'    
 );

USE test_db;

INSERT INTO common  (id, name, value)
VALUES (UUID(), '이름', 10);
SELECT * FROM common;

 -- 기존 테이블을 복사하여 샌선 (백업 테이블 생성)
 DROP TABLE IF EXISTS common_backup;
 CREATE TABLE common_backup
 AS SELECT * FROM common;

 -- 기존 테이블을 일부 데잍터만 복사하여 생성
 CREATE Table common_backup_value
 AS SELECT name, value
 FROM common;

 SELECT * FROM common_backup_value;

 -- 테이블 수정
 -- 컬럼 추가
 ALTER Table common_backup_value ADD COLUMN no BIGINT AUTO_INCREMENT PRIMARY KEY;
 -- 컬럼 수정
 ALTER Table common_backup_value MODIFY COLUMN value BIGINT;
 -- 컬럼 삭제
 ALTER Table common_backup_value DROP COLUMN value;

 DESC common_backup_value;

 -- 테이블 삭제
 TRUNCATE TABLE common_backup_value;

 DROP TABLE common_backup_value;
