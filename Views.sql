create table employees_copy as select * from employees;

CREATE OR REPLACE VIEW v_sal_dept_100_high
(matricula, sobrenome, email, data_contrato, funcao, salario, departamento)
AS
SELECT employee_id, last_name, email, hire_date, job_id, salary, department_id
FROM employees_COPY
WHERE SALARY > (SELECT AVG (SALARY)
FROM employees_copy)
AND department_id = 100
WITH CHECK OPTION CONSTRAINT v_sal_dept_high;

insert into v_sal_dept_100_high(matricula, sobrenome, email, data_contrato, funcao, salario, departamento)
    values(5678, 'bruno', 'tigerMike@mail.uk', '12/12/2019', 10, 7000, 100);
    
    insert into v_sal_dept_100_high(matricula, sobrenome, email, data_contrato, funcao, salario, departamento)
    values(4321, 'Bryan', 'sputinick@mail.jp', '21/03/2020', 20, 9000, 200);

SELECT VIEW_NAME, TEXT_LENGTH, TEXT
FROM USER_VIEWS
ORDER BY VIEW_NAME;

CREATE OR REPLACE VIEW V_SAL_DEPTO
AS
SELECT
    department_id,
    to_char(AVG(salary), '9999.00')sal_medio,
    MIN(salary) menor_sal,
    MAX(salary) maior_sal
    from employees_copy
    group by department_id;
    

CREATE OR REPLACE VIEW EMPVU80
AS
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY
    FROM employees_copy
    WHERE department_id = 80;
    
    DESCRIBE EMPVU80;
    
    SELECT
    *
    FROM empvu80
    ORDER BY salary DESC;

--1    
CREATE OR REPLACE VIEW EMPLOYEES_VU
(NUMERO_DO_FUNCIONARIO, EMPLOYEE, NUMERO_DO_DEPARTAMENTO)
AS
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    DEPARTMENT_ID
    FROM employees_copy;

--2    
 SELECT
    EMPLOYEE, numero_do_departamento
    FROM employees_vu
    ORDER BY numero_do_departamento;


-- 3    
CREATE OR REPLACE VIEW DEPT50
(EMPNO, EMPLOYEE, DEPTNO)
AS
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    DEPARTMENT_ID
    FROM employees_copy
    WHERE department_id = 50
    WITH READ ONLY;
    
    SELECT
        *
    FROM DEPT50;
    
    
--4
    DESCRIBE DEPT50;
    
    SELECT VIEW_NAME, TEXT_LENGTH, TEXT
    FROM USER_VIEWS
    WHERE view_name = 'DEPT50';
    