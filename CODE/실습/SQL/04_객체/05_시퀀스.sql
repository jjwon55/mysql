-- MySql 에서는 SEQUENCE 직접 지원 안됨
-- AUTO_INCREAMENT 로 간접적으로 사용
-- MariaDB 10.3 버전 부터 SEQUENCE 적용됨

CREATE TABLE test (
    no BIGINT AUTO_INCREMENT PRIMARY KEY
);

-- 간접적으로 시쿼스 사용
CREATE TABLE student (
    stu_no BIGINT PRIMARY key,
    NAME VARCHAR(100) NOT NULL 
);
CREATE TABLE seq_stuno (
    no BIGINT AUTO_INCREMENT PRIMARY KEY,
);

-- 시퀀스 증가
INSERT INTO seq_stuno VALUES (1);

-- 다음 시퀀스 증가

UPDATE seq_stuno SET no = LAST_INSERT_ID();
