
select * from employees;

-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
select
first_name, last_name, job_id
from employees
where job_id = 'IT_PROG';


select
 *
from employees
where last_name = 'King';

-- department_id�� ���ڿ��� �ƴ�. 50���� �ϴ� ���� ����.
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
where hire_date = '04/01/30'; -- ��/��/��


-- �������� �� ���� (BETWEEN, IN, LIKE)
select
*
from employees
where salary between 15000 and 20000; -- 15000 �̻� 20000 ����

SELECT
    *
FROM employees
WHERE hire_date
BETWEEN '03/01/01' and '03/12/31';


-- IN �������� ��� (Ư�� ����� ���� �� ���)
SELECT
    *
FROM employees
WHERE manager_id IN (100, 101, 102);


SELECT
    *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');


-- LIKE ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ǥ���� ��
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


-- IS NULL : null���� ã��
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;

SELECT
    *
FROM employees
WHERE commission_pct IS NOT NULL;


-- AND, OR
-- AND�� OR���� ���� ������ ����.
SELECT
    *
FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000; -- AND�� OR���� ����

SELECT
    *
FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- �������� ���� (SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC : ������(ascending)
-- DESC : ������(descending)
SELECT
    *
FROM employees
ORDER BY hire_date ASC; -- ASC�� default ���̱� ������ ���� ����.

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