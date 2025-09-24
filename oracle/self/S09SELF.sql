----- SCOTT 스키마 SQL 질의 문제 (15)

-- 1번
select * from scott.EMP;

-- 2번
select ENAME,SAL from SCOTT.EMP;

-- 3번
select ENAME,JOB from SCOTT.EMP where DEPTNO=10;

-- 4번
select ENAME,SAL from EMP where SAL>=2000;

-- 5번
select * from EMP where JOB='CLERK';

-- 6번
select ENAME,DEPTNO from EMP where ENAME like 'S%';

-- 7번
select ENAME,JOB from EMP where ENAME like '%T';

-- 8번
select ENAME,SAL from EMP where COMM is null;

-- 9번
select ENAME,JOB from EMP where MGR is null ;

-- 10번
select ENAME,SAL from EMP where SAL>=1500 and SAL<=3000;
select ENAME,SAL from EMP where SAL between 1500 and 3000;

-- 11번
select ENAME,HIREDATE from EMP where HIREDATE>='1981-01-01' and HIREDATE<='1981-12-31';
select ENAME,HIREDATE from EMP where HIREDATE between '1981-01-01' and '1981-12-31';

-- 12번
select DNAME,LOC from DEPT;

-- 13번
select ENAME,DEPTNO from EMP where DEPTNO between 20 and 30;
select ENAME,DEPTNO from EMP where DEPTNO in (20,30);

-- 14번
select ENAME,SAL,COMM from EMP where COMM>0;

-- 15번
select ENAME,DEPTNO,HIREDATE from EMP where JOB='MANAGER';




----- 형변환 SQL 문제 (5)

-- 1번
select HIREDATE from EMP;
select ENAME, to_char(HIREDATE, 'YYYY"년" MM"월" DD"일"') as hire_str from SCOTT.EMP;

-- 2번
select to_date('2025-01-15','yyyy-mm-dd') from dual;
select to_date('2025-01-15','yyyy-mm-dd') as converted_date from dual;

-- 3번
select to_char(SAL, 'L9,999') from EMP; --L 붙으면 통화표시(￦)
select ENAME, to_char(sal, '9,999') as sal_fmt from EMP;

-- 4번
select to_number('1,234','9g999')+10 as n from dual;
select to_number('1,234','9,999')+10 as num_result from dual;

-- 5번
select to_char(SAL, '9999') from EMP;
select ename, cast(SAL as varchar2(10)) as sal_str from SCOTT.EMP;

SELECT TO_CHAR(12345.6, 'FM9,999,990.00') FROM dual;


