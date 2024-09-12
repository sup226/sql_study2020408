--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT
    employee_id, first_name, hire_date, salary
FROM employees;

--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT
    first_name || ' ' || last_name AS name
FROM employees;

--3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT
    *
FROM employees
WHERE department_id = 50;

--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT
    first_name, department_id, job_id
FROM employees
WHERE department_id = 50;

--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT
    first_name, salary, salary + 300
FROM employees;

--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT
    first_name, salary
FROM employees
WHERE salary > 10000;

--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT
    first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
SELECT
    first_name, hire_date, salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT
    first_name, hire_date, salary
FROM employees
WHERE hire_date LIKE '03%';

--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��� ������ ����ϼ���.
SELECT
    first_name, salary
FROM employees
ORDER BY salary DESC;

--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
SELECT
    first_name, salary, department_id
FROM employees
WHERE department_id = '60'
ORDER BY salary DESC;

--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT
    first_name, job_id
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'SA_MAN';

--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT
    first_name || ' ' || last_name || ' ����� �޿��� ' || salary || '�޷� �Դϴ�'
FROM employees
WHERE first_name = 'Steven' AND last_name = 'King';

--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
SELECT
    first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN%';

--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
SELECT
    first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id ASC;

/*
���� 1.

EMPLOYEES ���̺��� �̸�, �Ի����� �÷����� ����(��Ī)�ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. (CONCAT)
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�. (REPLACE)
*/
SELECT
    CONCAT(first_name, last_name) AS �̸�,
    REPLACE(hire_date, '/', '') AS �Ի�����
FROM employees
ORDER BY first_name ASC;

/*
���� 2.

EMPLOYEES ���̺��� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� 
��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���. (CONCAT, SUBSTR ���)
*/
SELECT
    CONCAT('(02)', SUBSTR(phone_number,5,12))
FROM employees;

/*
���� 3. 

EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� ���ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/
SELECT
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
    LPAD(salary,10, '*') AS salary,
    job_id
FROM employees
WHERE LOWER(job_id) = 'it_prog';

/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 

���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/
SELECT
    first_name, hire_date, (sysdate - hire_date) / 365 AS �ټӳ��
FROM employees
WHERE (sysdate - hire_date) / 365 >= 17
ORDER BY �ټӳ�� DESC;

/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� ���ӿ���, 
120�̶�� �����塯
121�̶�� ���븮��
122��� �����ӡ�
�������� ������� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/
SELECT
    manager_id
FROM employees
WHERE department_id = 50
GROUP BY manager_id;

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
SELECT
    job_id,
    count(first_name),
    SUM(salary)/count(first_name) AS ����
FROM employees
GROUP BY job_id
ORDER BY ���� DESC;

/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
SELECT
    TO_CHAR(hire_date, 'yy') AS �Ի�⵵,
    count(first_name)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy');

/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/
SELECT
    department_id,
    TRUNC(SUM(salary)/COUNT(first_name), 3) AS ��ձ޿�
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING SUM(salary)/COUNT(first_name) >= 7000;

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
SELECT
    department_id,
    TRUNC(SUM(salary+salary*commission_pct)/COUNT(first_name),2) AS ���,
    SUM(salary+salary*commission_pct) AS �հ�,
    COUNT(first_name) AS count
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

/*
���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� �ּ����� �ۼ�)
*/



/*
���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_name�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�
*/



/*
���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��
*/


/*
���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
*/



/*
���� 5.
--Steven King�� �μ����� ����ϼ���.
*/



/*
���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
*/



/*
���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
*/



/*
���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� 
���� ������ ����ϼ���.
*/



/*
���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
*/



/*
���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
*/



/*
���� 11. 
-- EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)id��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���.
-- �Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� �����ϼ���.
*/