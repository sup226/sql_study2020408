
-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT
-- 그룹화를 따로 지정하지 않으면 그룹은 테이블 전체가 됩니다.

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(Salary),
    COUNT(salary)
FROM employees;

SELECT
    COUNT(*) -- 총 행 데이터의 수
FROM employees;

SELECT
    COUNT(first_name)
FROM employees;

SELECT
    COUNT(commission_pct) -- null은 카운트가 안됨.
FROM employees;

SELECT
    COUNT(manager_id)
FROM employees;

SELECT
    *
FROM employees;

-- 부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees;
GROUP 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;


-- GROUP BY를 통해 그룹화 할 때 조건을 지정할 경우 HAVING을 사용
-- WHERE은 일반 조건절. GROUP BY보다 먼저 진행됩니다.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP 
    department_id,
    SUM(salary),
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;


SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;


-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 급여 평균이 5000 이상만 조회
SELECT
    department_id,
    AVG(salary) AS 평균급여
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY 평균급여 DESC;


/*
문제 1.
1-1. 사원 테이블에서 JOB_ID별 사원 수를 구하세요.
1-2. 사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/

SELECT
    job_id,
    COUNT(*) AS 사원수,
    AVG(salary) AS 평균월급
FROM EMPLOYEES
GROUP BY job_id
ORDER BY 평균월급 DESC;

/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/

SELECT
    TO_CHAR(hire_date, 'yy') AS 입사연도,
    count(*)
FROM employees
GROUP BY  TO_CHAR(hire_date, 'yy')
ORDER BY 입사연도;

/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력하세요.
*/

SELECT
    department_id,
    AVG(salary) AS 평균급여
FROM employees
WHERE salary > 5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절사 하세요.
*/

SELECT
    department_id,
    TRUNC(AVG(salary+salary*commission_pct), 2) AS 평균,
    SUM(salary+salary*commission_pct) AS 합계,
    COUNT(*) AS count
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;