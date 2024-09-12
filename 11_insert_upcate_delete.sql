
-- INSERT
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT�� ù��° ��� (��� �÷� �����͸� �� ���� �����ؼ� ����)
-- ���� -> �÷��� �������� �ʰ� ���� �ִ� ��쿡�� ��� ���� �� ��� �Ѵ�. (NULL ��� ���ο� ��� ����)
INSERT INTO departments
VALUES(300, '���ߺ�');


SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ڷ� �ǵ����� Ű����.

-- INSERT�� �ι�° ��� (���� �÷��� �����ϰ� ����, NOT NULL �÷� Ȯ��!)
INSERT INTO departments
    (department_id, department_name)
VALUES
    (302, 1500);
    

-- �纻 ���̺� ����
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false��(1 = 2) �����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ���� x
-- CTAS���� �÷��� ������ �����͸� ������ ��, ��������(PK, FK...)�� �������� �ʽ��ϴ�. (����Ŭ�� ����)
CREATE TABLE emps AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2); -- WHERE���� false(1=2) ���� �ָ� �����ʹ� ����ȵ�

SELECT * FROM emps;
DROP TABLE emps;

DESC emps;

-- INSERT (��������)
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);

SELECT * FROM emps;


-----------------------------------------------------------------

-- UPDATE
-- UPDATE ���̺��̸� SET �÷�=��, �÷�=��...... WHERE ������ ��������(����)
CREATE TABLE emps AS
(SELECT * FROM employees);


-- UPDATE�� ������ ���� ������ �������� �������� �� �����ؾ� �մϴ�.
-- �׷��� ������ ���� ����� ���̺� ��ü�� �����˴ϴ�.
UPDATE emps
SET salary = 30000;
ROLLBACk;

UPDATE emps
SET salary = 30000
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010-1234-5678',
manager_id = 102,
salary = salary + salary*0.1
WHERE employee_id = 100;


-- UPDATE (��������)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (SELECT
        job_id, salary, manager_id
    FROM emps
    WHERE employee_id = 100)
WHERE employee_id = 101;

SELECT * FROM emps;

----------------------------------------------------------------

-- DELETE
-- DELETE�� WHERE�� �������� ������ ���̺� ��ü ���� ����� �˴ϴ�.
DELETE FROM emps
WHERE employee_id = 103;


-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');