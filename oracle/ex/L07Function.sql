--- 문자함수
select lower(ENAME) from EMP;
select initcap(ENAME) from EMP;

--to_char, to_number, to_cast ...
select substr(ENAME,0,1) from EMP;
select substr('oracle',2,3) from dual;
--오라클의 인덱스는 1부터 시작 !!

select length(ENAME) from EMP;
select concat(ENAME,' 님') from EMP;
select ENAME||' 님,'||' 안녕하세요' from EMP;


--- 숫자함수

-- 올림
select round(1234.567) from dual; --1235
select round(1234.567,2) from dual; --1234.57

-- 내림
select floor(1234.567) from dual; --1234
--select floor(1234.567,1) from dual; --내림은 자리수 지정 x

-- 버림
select trunc(1234.567) from dual; --1234
select trunc(1234.567,2) from dual; --1234.56

select trunc(-0.1) from dual; --0
select floor(-0.1) from dual; -- -1
--floor는 더 가까운 숫자로 레츠고

-- 제곱
--select 2**3 from dual; --불가눙~
select power(2,3) from dual;

-- 나머지
--select 10%4 from dual; --불가눙~
select mod(10,4) from dual; --2


select 10/3 from Dual;
-- select 10/0 from dual; --불가눙~

-- 동등비교
--select 10=10 from dual; --불가눙~
--select 10==10 from dual; --불가눙~
select * from EMP where SAL=800;
select * from EMP where SAL!=800; -- ==select * from EMP where SAL<>800; //근데 이거는 지원 안 하는 언어도 있을 수 있으니 사용권장 x


--- 날짜함수

-- os의 시간
select sysdate from dual; --2025-09-25 02:52:46
select systimestamp from dual; --2025-09-25 02:52:57.557469 +00:00

-- oracle의 시간
select current_date from dual; --2025-09-25 02:53:44
select current_timestamp from dual; --2025-09-25 02:54:08.116343 +00:00

alter session set time_zone ='asia/seoul';
select current_date from dual;
select current_timestamp from dual;

select add_months(sysdate,3) from dual; --2025-12-25 02:55:54
select add_months(sysdate,-8) from dual; --2025-01-25 02:56:19
select add_months('2025-05-05',4) from dual; --2025-09-05

select sysdate-'2025-01-25 02:45:51' from dual; --불가눙~
select sysdate-to_date('2025-01-25') from dual; --243.125092592592592592592592592592592593
select sysdate-date '2025-01-25' from dual; --243.125347222222222222222222222222222222
select sysdate-cast('2025-01-25' as date) from dual; --243.125717592592592592592592592592592593

select months_between(sysdate, '2025-01-25') from dual; --8
select next_day(sysdate, '금요일') from dual; --2025-09-26 03:04:09
select next_day(sysdate, '일요일') from dual; --2025-09-28 03:04:28


--- 일반함수

-- NVL ⇒ Null Value
-- Null+수=Null ...?!
select ENAME,SAL,COMM, sal+nvl(comm,0) 총급여 from EMP;
-- NVL2(comm,'y','n') ⇒ 커미션(comm)을 받으면 yes, 아니면 no!
select ENAME,nvl2(comm,'y','n') 커미션유무 from EMP;

-- DECODE
select ENAME,DEPTNO from EMP;
-- 10,ACCOUNTING,NEW YORK
-- 20,RESEARCH, DALLAS
-- 30,SALES, CHICAGO
-- 40,OPERATIONS, BOSTON

-- switch(deptno){
-- case 10 : 'ACCOUNTING'
-- }
select ENAME,
       DECODE(DEPTNO,
              10,'ACCOUNTING',
              20,'RESEARCH',
              30,'SALES',
              40,'OPERATIONS') as 부서이름
from EMP;

