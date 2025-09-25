
-- 1번
select DEPTNO, count(*) as 인원수 from EMP group by DEPTNO;


-- 2번
select DEPTNO, sum(sal) as 총급여 from EMP group by DEPTNO order by 총급여 desc ;

-- 3번
select job, trunc(avg(sal),2) as 평균급여 from EMP group by job;

-- 4번
select DEPTNO, max(SAL) as 최고급여, min(sal) as 최저급여 from emp group by DEPTNO;

-- 5번
select DEPTNO, JOB, count(*) from emp group by DEPTNO, JOB having count(*)>=3;

-- 6번
select DEPTNO, count(distinct job) as 직무개수 from emp group by DEPTNO ;

-- 7번
select job, avg(comm) as 평균보너스 from EMP group by job having avg(comm)>0;

-- 8번
select DEPTNO, sum(sal) as 총급여 from emp group by DEPTNO having sum(sal)>=10000;

-- 9번
select to_char(HIREDATE, 'yyyy-mm') as 입사일, count(*) from EMP group by to_char(HIREDATE, 'yyyy-mm') order by 입사일 desc ;

-- 10번
select job, trunc(avg(sal),1) as 급여평균 from EMP group by job having trunc(avg(sal),1)>=2500;

-- 11번
select DEPTNO, sum(sal) as 총급여,
       case
           when sum(sal)>=3000 then '3000 이상'
           else '3000 미만'
       end
from EMP group by DEPTNO;

-- 12번


-- 13번


-- 14번


-- 15번


-- 16번


-- 17번


-- 18번


-- 19번


-- 20번