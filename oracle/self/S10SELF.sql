
-- 1번
select upper('oracle database') from dual;

-- 2번
select lower('SCOTT') from dual;

-- 3번
select INITCAP('hello world') from dual;

-- 4번
select substr('ORACLE',2,3) from dual;

-- 5번
select length('database') from dual;

-- 6번
select round(123.4567,2) from dual;

-- 7번
select trunc(123.4567,2) from dual;

-- 8번
select mod(10,3) from dual;

-- 9번
select power(2,5) from dual;

-- 10번
select sysdate from dual;

-- 11번
select add_months(sysdate, 2) from dual;

-- 12번
select months_between(sysdate,'2025-01-01') from dual;

-- 13번
select next_day(sysdate, '금요일') from dual;

-- 14번
select to_char(sysdate,'yyyy-mm-dd') from dual;

-- 15번
select to_date('2025-12-31', 'yyyy-mm-dd') from dual;

-- 16번
select to_number('10000') from dual;

-- 17번
select nvl(COMM,0) from EMP;

-- 18번
select ENAME,COMM, nvl2(comm,'yes','no') from EMP;

-- 19번
select ENAME, DEPTNO,
       DECODE(DEPTNO,
       10, 'ACCOUNTING',
       20, 'RESEARCH',
       'OTHER') as 부서이름
from EMP;

-- 20번
select ENAME,SAL, case when SAL>=3000 then 'HIGH' ELSE 'LOW' END from EMP;