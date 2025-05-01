-- Active: 1745889708778@@127.0.0.1@3306@employees


USE employees;
-- 전체 사원 중 가장 높은 급여를 받는 사원 조회
SELECT emp_no 사원번호,
        (
        SELECT first_name 
        FROM employees e 
        WHERE e.emp_no = s.emp_no 
        ) 이름,
       salary 급여
FROM salaries s
WHERE salary = (SELECT MAX(salary) FROM salaries)
;



USE aloha;
-- 부서 번호가 103 번 부서에 속한 사원 정보 조회
SELECT * 
FROM employees
WHERE emp_no IN(
                    SELECT emp_no
                    FROM departments
                    WHERE dept_no = 103
               );

-- EXISTS 를 사용하여
-- 부서에 속하 ㄴ사원들만 조회하시오.
USE employees;

SELECT * 
FROM employees e
WHERE EXISTS(
                SELECT 1
                FROM departments d
                WHERE d.dept_no = e.dept_no
            )
;

-- 부서가 없는 사람들만 조회하시오.
SELECT * 
FROM employees e
WHERE NOT EXISTS(
                SELECT 1
                FROM departments d
                WHERE d.dept_no = e.dept_no
            )
;

--ANY
-- 부서번호가 102인 부서의 최소 급여보다 높은 급여를 받는 사원 조회
SELECT emp_no, name, salary 
FROM employees
WHERE salary > ANY(
                    SELECT salary 
                    FROM employees
                    WHERE dept_no = 102
                  );


-- ALL
-- 부서번호가 103인 부서의 최대 급여보다 높은 급여를 받는 사원 조회
SELECT emp_no, name, salary 
FROM employees
WHERE salary > ALL(
                    SELECT salary 
                    FROM employees
                    WHERE dept_no = 103
                  );

-- 위의 두 쿼리를 MAX(), MIN() 함수로 사용하여 바꿔보세요

-- 부서번호가 102인 부서의 최소 급여보다 높은 급여를 받는 사원 조회
SELECT emp_no, name, salary 
FROM employees
WHERE salary > (    
                    SELECT MIN(salary) 
                    FROM employees
                    WHERE dept_no = 102
                  );

-- 부서번호가 103인 부서의 최대 급여보다 높은 급여를 받는 사원 조회
SELECT emp_no, name, salary 
FROM employees
WHERE salary > (
                SELECT MAX(salary) 
                FROM employees
                WHERE dept_no = 103
            );

