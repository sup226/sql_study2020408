
-- ����ȯ �Լ� TO_CHAR, TO_NUMBER, TO_DATE

-- ��¥�� ���ڷ� TO_CHAR(��, ����)
-- ��¥�� ���ڷ� �� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
-- ��¥ ��������: Y - ����, MM - ���ڸ� ��, D - �ϼ�, DY - ����
-- �ð� ��������: HH12 - ��(1~12), HH24 (0-23), MI - ��, SS - ��

SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY AM HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY HH24:MI:SS') FROM dual;


-- ���� ���ڿ� �Բ� ����ϰ� ���� ���ڴ� ""�� ���μ� �����մϴ�.
SELECT
    TO_CHAR(sysdate, 'YYYY"��" MM"��" DD"��" DY HH24:MI:SS')
FROM dual;


-- ���ڸ� ���ڷ� TO_CHAR(��, ����)
-- ���Ŀ��� ����ϴ� 9�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
SELECT TO_CHAR(20000, '99,999') FROM dual;
SELECT TO_CHAR(20000, 'L99,999') FROM dual;
SELECT TO_CHAR(20000.29, '99,999.9') FROM dual;


SELECT
    first_name,
    TO_CHAR(salary, '$99,999') AS salary
FROM employees;


-- ���ڸ� ���ڷ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� �� ��ȯ (���� -> ����)
SELECT '#3,3000' + 2000 FROM dual; -- ����
-- ��ȯ�Ϸ��� ���ڰ� ����� ���� ���°� �ƴ϶��, ���Ĺ��ڸ� �̿��ؼ� �˷���� �մϴ�.
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;


-- ���ڸ� ��¥�� TO_DATE(��, ����)
SELECT TO_DATE('2023-04-13') + 1 FROM dual;

-- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
SELECT TO_DATE('2023-04-14 12:23:50', 'YYYY-MM-DD HH:MI:SS') FROM dual;

SELECT TO_DATE('2023�� 04�� 13��', 'YYYY"��" MM"��" DD"��"') FROM dual;


-- xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�� ������.
-- ��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���.
SELECT '20050102' FROM dual;
SELECT
    TO_CHAR(
            TO_DATE('20050102', 'YYYY-MM-DD'),
            'YYYY"��" MM"��" DD"��"'
            ) AS dateInfo
FROM dual;



----------------------------------------------------------------------------

-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷� Ȥ�� ��, ��ȯ�� Ÿ�ٰ�)
SELECT
    first_name,
    NVL(commission_pct, 0) AS comm_pct
FROM employees;


-- NULL ���¸� ��ȯ�ϴ� �Լ� NVL_2(Ÿ��, null�� �ƴ� ���, null�� ���)
SELECT
    first_name,
    salary,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS pay
FROM employees;


-- NULLIF(expr1, expr2)
-- �� ���� ������ NULL ����, �ٸ��� expr1�� ����

SELECT
    NULLIF('�����', '�����')
FROM dual;


SELECT
    NULLIF('�����', '���̿�')
FROM dual;


-- COALESCE(expr1, ...)
-- ���� ǥ���� �� NULL�� �ƴ� ���� ���ʷ� �߰ߵǸ� �� ���� ����
SELECT
    COALESCE(NULL, NULL, 3000, 4000)
FROM dual;

SELECT
    COALESCE(3000, NULL, NULL, 4000)
FROM dual;



-- comm_pct�� null�� �ֵ��� �ڿ� �ִ� 0�� ����, null�� �ƴ� �ֵ��� �ڱ��� comm_pct�� ����
SELECT
    first_name,
    salary,
    salary + (salary * COALESCE(commission_pct, 0)) AS total
FROM employees;


-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2 ... default)
-- ����Ŭ ���� �Լ�. ���� �񱳸� ����
SELECT
    first_name,
    job_id,
    salary,
    DECODE(
        job_id,
        'IT_PROG', salary * 1.1,
        'FI_MGR', salary * 1.2,
        'AD_VP',  salary * 1.3,
        salary
    ) AS result
FROM employees;


-- CASE WHEN THEN END
-- ANSI ǥ�� ����(�̱� ���� ǥ�� ��ȸ���� ������ ����)
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR'  THEN salary*1.2
        WHEN 'AD_VP'  THEN salary*1.3
        WHEN 'FI_ACCOUNT'  THEN salary*1.4
        ELSE 0
    END) AS result
FROM employees;