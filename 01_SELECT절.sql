-- ����Ŭ �ּ��Դϴ�.

/*
���� �� �ּ��Դϴ�.

������.
*/

-- SELECT [�÷���(���� �� ����)] FROM [���̺� �̸�]

SELECT
*
FROM
employees;

SELECT
    employee_id, first_name, last_name
FROM
    employees;
    
SELECT email, phone_number, hire_date
FROM employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� ��� ������ �����մϴ�.
SELECT
employee_id,
first_name,
last_name,
salary,
salary+salary*0.1 as �������Ա޿�
FROM employees;

-- NULL ���� Ȯ�� (���� 0�� ���� null�� �ٸ� �����Դϴ�.)
SELECT
    department_id, commission_pct
FROM employees;

-- alias (�÷���� ���̺���� �̸��� �����ؼ� ��ȸ�մϴ�.)
select
first_name as �̸�, last_name as ��, salary as �޿�
from employees;

/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ Ư����ȣ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�.
���ڿ� �����ȣ�� || �Դϴ�. ���ڿ��� ���� ������ ������� �ʽ��ϴ�.
*/
-- ���ڿ� ����
select
    first_name || ' ' || last_name || '''s salary is $' || salary as �ϼ���_����
from employees;

-- distinct (�ߺ� ���� ����)
select distinct
department_id
from employees;

-- rownum, rowid
-- **rownum(�ο��) : ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ǥ��
-- rowid(�ο���̵�) : �����ͺ��̽� ���� ���� �ּҸ� ��ȯ
select
rownum, rowid, employee_id
from employees;