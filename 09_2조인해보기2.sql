
SELECT * FROM info;
SELECT * FROM auth;

-- �̳�(����) ����(ANSI)
SELECT
    *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;


SELECT
    title, content, name, a.auth_id
FROM info i
INNER JOIN auth a -- JOIN�̶�� ���� �⺻�� INNER JOIN��
ON i.auth_id = a.auth_id
WHERE a.name = '�̼���';

SELECT
    title, content, name, a.auth_id
FROM info i
INNER JOIN auth a -- JOIN�̶�� ���� �⺻�� INNER JOIN��
ON i.auth_id = a.auth_id -- ���� ����
WHERE a.name = '�̼���'; -- �Ϲ� ����


-- �ƿ���(�ܺ�) ����(ANSI)
SELECT
    *
FROM info i RIGHT OUTER JOIN auth a -- OUTER�� �Ƚᵵ ���� ����
ON i.auth_id = a.auth_id;

-- ���� ���̺�� ���� ���̺� �����͸� ��� �о� ǥ���ϴ� �ܺ� ����(Ǯ �ƿ��� ����)
-- ����Ŭ�� ���� ���
SELECT
    *
FROM info i FULL OUTER JOIN auth a -- OUTER�� �Ƚᵵ ���� ����
ON i.auth_id = a.auth_id;


SELECT * FROM info
info, auth; -- ����Ŭ


-- CROSS JOIN�� JOIN������ �������� �ʱ� ������
-- �ܼ��� ��� �÷��� ���� JOIN�� �����մϴ�.( ���� ��� : �� ���̺��� ���� �����ָ� ��.)
-- �����δ� ���� ������� �ʽ��ϴ�.
SELECT * FROM
info CROSS JOIN auth;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���.
*/

SELECT
    i.id, i.title, i.content, a.job
FROM auth a
LEFT JOIN info i
ON a.auth_id = i.auth_id
WHERE a.job = 'scientist';


-- SELF JOIN�̶� ���� ���̺� ������ ������ ���մϴ�.
-- ���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����մϴ�.

-- �� ����� �Ŵ����� �̸��� ��ȸ
SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
FROM employees e1
INNER JOIN employees e2
ON e1.manager_id = e2.employee_id;


-- �� �Ŵ����� ����ϴ� ����� ���
SELECT
    m.employee_id AS manager_id,
    m.first_name AS manager_name,
    COUNT(e.employee_id) AS �����
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.first_name;


-- NATURAL JOIN
-- ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER JOIN�� �����մϴ�.
-- ���εǴ� ���� �̸��� �÷��� Ÿ���� ���ƾ� �ϸ�,
-- ���� �̸��� �÷��� ALIAS(��Ī)�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- ��ȸ�Ϸ��� �÷��� *�� ���̸�, ���� �÷��� �� ���� ǥ��˴ϴ�.
SELECT
    *
FROM employees e
NATURAL JOIN departments d;

-- USING JOIN
-- NATURAL JOIN���� �ٸ���, USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���� ������
-- �ο��� �� �ֽ��ϴ�.
-- USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.
SELECT
    e.employee_id, e.first_name, department_id,
    d.department_name
FROM employees e
JOIN departments d USING(department_id);
