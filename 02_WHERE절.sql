
select * from employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
select
first_name, last_name, job_id
from employees
where job_id = 'IT_PROG';


select
 *
from employees
where last_name = 'King';

-- department_id는 문자열이 아님. 50으로 하는 것이 옳음.
select
*
from employees
where department_id = '50';


select
*
from employees
where salary >= 15000
and salary < 20000;


select
*
from employees
where hire_date = '04/01/30'; -- 년/월/일


-- 데이터의 행 제한 (BETWEEN, IN, LIKE)
select
*
from employees
where salary between 15000 and 20000; -- 15000 이상 20000 이하

SELECT
    *
FROM employees
WHERE hire_date
BETWEEN '03/01/01' and '03/12/31';


-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
SELECT
    *
FROM employees
WHERE manager_id IN (100, 101, 102);


SELECT
    *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');


-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 때
SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';


-- IS NULL : null값을 찾음
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;

SELECT
    *
FROM employees
WHERE commission_pct IS NOT NULL;


-- AND, OR
-- AND가 OR보다 연산 순서가 빠름.
SELECT
    *
FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000; -- AND가 OR보다 빠름

SELECT
    *
FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- 데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC : 오름차(ascending)
-- DESC : 내림차(descending)
SELECT
    *
FROM employees
ORDER BY hire_date ASC; -- ASC는 default 값이기 때문에 생략 가능.

SELECT
    *
FROM employees
ORDER BY hire_date DESC;


SELECT
    *
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;


SELECT
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay DESC;