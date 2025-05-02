-- INDEX 생성 전 성능 확인
SET PROFILING = 1;

--쿼리
SELECT * 
FROM employees
WHERE last_name = 'baba'
    AND gender = 'M'
;

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;


SELECT NOW(6);

--쿼리
SELECT * 
FROM employees
WHERE last_name = 'baba'
    AND gender = 'M'
;
SELECT NOW(6);


/* 
2025-05-02 10:56:59.942531
2025-05-02 10:57:26.435742
 */


 /* 
 2025-05-02 11:02:33.485891
 2025-05-02 11:02:33.545178
  */

 -- 인덱스 생성
 CREATE INDEX index_lastname_gender ON employees (last_name, gender);
 DROP INDEX index_lastname_gender ON employees;

 EXPLAIN
 SELECT * FROM employees WHERE last_name = 'Smith' AND gender = 'M';


 DROP INDEX index_lastname_gender ON employees;