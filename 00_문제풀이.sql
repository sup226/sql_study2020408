--1. 모든 사원의 사원번호, 이름, 입사일, 급여를 출력하세요.
SELECT
    employee_id, first_name, hire_date, salary
FROM employees;

--2. 모든 사원의 이름과 성을 붙여 출력하세요. 열 별칭은 name으로 하세요.
SELECT
    first_name || ' ' || last_name AS name
FROM employees;

--3. 50번 부서 사원의 모든 정보를 출력하세요.
SELECT
    *
FROM employees
WHERE department_id = 50;

--4. 50번 부서 사원의 이름, 부서번호, 직무아이디를 출력하세요.
SELECT
    first_name, department_id, job_id
FROM employees
WHERE department_id = 50;

--5. 모든 사원의 이름, 급여 그리고 300달러 인상된 급여를 출력하세요.
SELECT
    first_name, salary, salary + 300
FROM employees;

--6. 급여가 10000보다 큰 사원의 이름과 급여를 출력하세요.
SELECT
    first_name, salary
FROM employees
WHERE salary > 10000;

--7. 보너스를 받는 사원의 이름과 직무, 보너스율을 출력하세요.
SELECT
    first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--8. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(BETWEEN 연산자 사용)
SELECT
    first_name, hire_date, salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--9. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(LIKE 연산자 사용)
SELECT
    first_name, hire_date, salary
FROM employees
WHERE hire_date LIKE '03%';

--10. 모든 사원의 이름과 급여를 급여가 많은 사원부터 적은 사원 순서로 출력하세요.
SELECT
    first_name, salary
FROM employees
ORDER BY salary DESC;

--11. 위 질의를 60번 부서의 사원에 대해서만 질의하세요. (컬럼: department_id)
SELECT
    first_name, salary, department_id
FROM employees
WHERE department_id = '60'
ORDER BY salary DESC;

--12. 직무아이디가 IT_PROG 이거나, SA_MAN인 사원의 이름과 직무아이디를 출력하세요.
SELECT
    first_name, job_id
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'SA_MAN';

--13. Steven King 사원의 정보를 “Steven King 사원의 급여는 24000달러 입니다” 형식으로 출력하세요.
SELECT
    first_name || ' ' || last_name || ' 사원의 급여는 ' || salary || '달러 입니다'
FROM employees
WHERE first_name = 'Steven' AND last_name = 'King';

--14. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 출력하세요. (컬럼:job_id)
SELECT
    first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN%';

--15. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 직무아이디 순서대로 출력하세요.
SELECT
    first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id ASC;

/*
문제 1.

EMPLOYEES 테이블에서 이름, 입사일자 컬럼으로 변경(별칭)해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다. (CONCAT)
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다. (REPLACE)
*/
SELECT
    CONCAT(first_name, last_name) AS 이름,
    REPLACE(hire_date, '/', '') AS 입사일자
FROM employees
ORDER BY first_name ASC;

/*
문제 2.

EMPLOYEES 테이블에서 phone_number컬럼은 ###.###.####형태로 저장되어 있다
여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 
전화 번호를 출력하도록 쿼리를 작성하세요. (CONCAT, SUBSTR 사용)
*/
SELECT
    CONCAT('(02)', SUBSTR(phone_number,5,12))
FROM employees;

/*
문제 3. 

EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
조건 1) 비교하기 위한 값은 소문자로 비교해야 합니다.(힌트 : lower 이용)
조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다. 
이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
*/
SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
    LPAD(salary,10, '*') AS salary,
    job_id
FROM employees
WHERE LOWER(job_id) = 'it_prog';

/*
문제 1.
현재일자를 기준으로 employees테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 

조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
*/
SELECT
    first_name, hire_date, (sysdate - hire_date) / 365 AS 근속년수
FROM employees
WHERE (sysdate - hire_date) / 365 >= 17
ORDER BY 근속년수 DESC;

/*
문제 2.
EMPLOYEES 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
100이라면 ‘임원’, 
120이라면 ‘과장’
121이라면 ‘대리’
122라면 ‘주임’
나머지는 ‘사원’ 으로 출력합니다.
조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
*/
SELECT
    manager_id
FROM employees
WHERE department_id = 50
GROUP BY manager_id;

/*
문제 1.
1-1. 사원 테이블에서 JOB_ID별 사원 수를 구하세요.
1-2. 사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/
SELECT
    job_id,
    count(first_name),
    SUM(salary)/count(first_name) AS 월급
FROM employees
GROUP BY job_id
ORDER BY 월급 DESC;

/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/
SELECT
    TO_CHAR(hire_date, 'yy') AS 입사년도,
    count(first_name)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy');

/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력하세요.
*/
SELECT
    department_id,
    TRUNC(SUM(salary)/COUNT(first_name), 3) AS 평균급여
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING SUM(salary)/COUNT(first_name) >= 7000;

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절사 하세요.
*/
SELECT
    department_id,
    TRUNC(SUM(salary+salary*commission_pct)/COUNT(first_name),2) AS 평균,
    SUM(salary+salary*commission_pct) AS 합계,
    COUNT(first_name) AS count
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

/*
문제 1.
-EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
-EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 주석으로 작성)
*/



/*
문제 2.
-EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
조건)employee_id가 200인 사람의 이름, department_name를 출력하세요
조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다
*/



/*
문제 3.
-EMPLOYEES, JOBS테이블을 INNER JOIN하세요
조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
HINT) 어떤 컬럼으로 서로 연결되어 있는지 확인
*/


/*
문제 4.
--JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
*/



/*
문제 5.
--Steven King의 부서명을 출력하세요.
*/



/*
문제 6.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
*/



/*
문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 
급여, 부서명, 근무지를 출력하세요. (Alias를 사용)
*/



/*
문제 8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 
직원 정보만 출력하세요.
*/



/*
문제 9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용
*/



/*
문제 10. 
-join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.
*/



/*
문제 11. 
-- EMPLOYEES 테이블에서 left join하여 관리자(매니저)id와, 매니저의 이름, 매니저의 급여 까지 출력하세요.
-- 매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 정렬하세요.
*/