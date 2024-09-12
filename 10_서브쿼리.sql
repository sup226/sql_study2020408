
/*
# �������� 
: SQL ���� �ȿ� �Ǵٸ� SQL�� �����ϴ� ���.
 ���� ���� ���Ǹ� ���ÿ� ó���� �� �ֽ��ϴ�.
 WHERE, SELECT, FROM ���� �ۼ��� �����մϴ�.

- ���������� ������� () �ȿ� �����.
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �˴ϴ�.
*/

-- �̸��� 'Nancy'�� ������� �޿��� ���� ����� ��ȸ�ϱ�
SELECT salary FROM employees
WHERE first_name = 'Nancy';

SELECT first_name FROM employees
WHERE salary > 12008;


-- ���������� Ȱ���� ����
SELECT first_name FROM employees
WHERE salary > (SELECT salary FROM employees
                WHERE first_name = 'Nancy');
                
                
-- employee_id�� 103���� ����� job_id�� ������ job_id�� ���� ����� ��ȸ.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE employee_id = 103);
                

-- ���� ������ ���������� �����ϴ� ���� ���� ���� ���� �� �����ڸ� ����� �� �����ϴ�.
-- ���� �� ������ : �ַ� �� ������(=, >, <, >=, <=, <>(�����ʴ�))�� ����ϴ� ��� �ϳ��� �ุ ��ȯ�ؾ�
-- �̷� ��쿡�� ���� �� �����ڸ� ����ؾ� �մϴ�.
SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees
                WHERE last_name = 'King'); -- ����


-- ���� �� ������(IN, ANY, ALL, EXIST)

-- IN: ��ȸ�� ����� � ���� �������� ��.
SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees
                WHERE last_name = 'King');
                
               
-- first_name�� Davide�� ������� �޿��� ���� �޿��� �޴� ������� ��ȸ 
SELECT * FROM employees
WHERE salary IN (SELECT salary FROM employees
                WHERE first_name = 'Davide');
                

-- ANY, SOME: ���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- �ϳ��� �����ϸ� ��ȸ ��� ���Ե˴ϴ�.
-- ex) salary > ANY (200, 300, 400)
--                     250-> true
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees
                WHERE first_name = 'Davide');

SELECT * FROM employees
WHERE salary > SOME (SELECT salary FROM employees
                WHERE first_name = 'Davide');

-- ALL :���� ���������� ���� ���ϵ� ������ ���� ���ؼ�
-- ���� �� ��ġ�ؾ� ��ȸ��� ���Ե˴ϴ�.
-- ex) salary > ALL (200, 300, 400)
--     250 -> false, 200qheksms zmwlaks 300, 400���ٴ� ũ�� �����Ƿ�.)
SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees
                WHERE first_name = 'David');
  
                
-- EXISTS: ���������� �ϳ� �̻��� ���� ��ȯ�ϸ� ������ ����
-- job_history�� �����ϴ� ������ employees���� �����Ѵٸ� ��ȸ ��� ����
-- �������� ������ jh�� �ִ� id�� edp dlTsms id�� ��ġ�� ������ 1�̶�� ���� ��ȸ
-- EIXIST �����ڰ� 1�� ��ȸ�� �� �� �����Ͱ� �����Ѵٴ� ���� �Ǵ��Ͽ�
-- employees���� �ش� ����� ��� �÷��� ��ȸ
SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM job_history jh
              WHERE e.employee_id = jh.employee_id);
              
SELECT 1 FROM job_history jh
    WHERE jh.employee_id = 104;
    
    
------------------------------------------------------------------------------

-- SELECT ���� �������� ���̱�.
-- ��Į�� �������� ��� Ī�մϴ�.
-- ��Į�� ��������: ���� ����� ���� ���� ��ȯ�ϴ� ��������. �ַ� SELECT, WHERE ������ ����.

SELECT
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.first_name;


SELECT
    e.first_name,
    (
        SELECT
            d.department_name
        FROM departments d
        WHERE d.department_id = e.employee_id
    )
FROM employees e
ORDER BY e.first_name;

SELECT * FROM employees;

/*
# ��Į�� �������� vs LEFT JOIN
a. ������ ��Ȳ���� ����ϸ� ������ �������̰� �����մϴ�.
b. ���� ���� ��ȯ�ϴ� ���������� ����
c. �뷮 �����Ͱ� �ƴ� ��쳪, ���������� ���⵵�� ���� ��� ����

1. �뷮 �����͸� ó���ϰų�, ���� �÷��� �ٿ��� �� �� �����մϴ�.
2. ���� ���̺��� �� ���� �����ؾ� �� ���.
3. ���߰� ó�� �� �ߺ� �����Ͱ� �ִ� ��� ������ ���ɻ� ���� �� ����.
*/


-- �� �μ� �� ����� �̱� (�μ���, �����)
SELECT
    d.department_name,
    COUNT(*) AS �����
FROM departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY ����� DESC;

SELECT
    d.department_name,
    (SELECT COUNT(*)
    FROM employees e
    WHERE e.department_id = d.department_id
    GROUP BY department_id) AS �����
FROM departments d;

------------------------------------------------------------------------
-- FROM�� �������� (�ζ��� ��)
-- Ư�� ���̺� ��ü�� �ƴ� SELECT�� ���� �Ϻ� �����͸� ��ȸ�� ���� ���� ���̺�� ����ϰ� ���� ��
-- ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ���

/*
���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� ����.
�ٱ��� SELECT ������ ROWNUM�� �ٿ��� �ٽ� ��ȸ
���� �ٱ��� SELECT �������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.

** SQL�� ���� ����
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/
SELECT *
FROM
    (
    SELECT
        ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT
            employee_id, first_name, salary
        FROM employees
        ORDER BY salary DESC
        ) tbl
    )
WHERE rn > 10 AND rn <= 20;

SELECT
    e.employee_id,
    salary,
    average_salary
FROM employees e JOIN
(SELECT
    department_id,
    TRUNC(AVG(salary)) AS average_salary
FROM employees
GROUP BY department_id) tbl
ON e.department_id = tbl.department_id;