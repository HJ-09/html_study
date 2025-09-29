
--- S14SubQuery 연습문제

-- 1. 전체 평균 급여보다 많은 급여를 받는 사원들의 이름과 급여를 조회하라.
select avg(sal)
from EMP;
-- +
select *
from EMP where SAL>2073.214;
-- =
select *
from EMP where SAL>(select avg(sal) from EMP);


-- 2. 이름이 'JONES'인 사원과 동일한 직무를 가진 사원을 조회하라.
select JOB
from EMP where ENAME='JONES';
-- +
select *
from EMP where JOB='MANAGER';
-- =
select *
from EMP where JOB=(select JOB from EMP where ENAME='JONES');
-- 서브쿼리는 2개의 쿼리를 묶는 것!~


-- 3. 20번 부서에서 근무하는 사원과 +동일한 급여를 받는 사원들의 이름과 급여를 조회하라.
select distinct SAL
from EMP where DEPTNO=20;
-- +
select *
from EMP where SAL in (2975.0, 3000.0, 1100.0, 800.0);
-- =
select *
from EMP
where SAL in
    (select SAL from EMP where DEPTNO=20);


-- 4. 30번 부서 사원 중 한명이라도 급여가 더 높은 ...사원들을 조회하라.
select *
    from EMP
    where SAL > any (select SAL from EMP where DEPTNO=30);


-- 5. 10번 부서 사원 전원보다 급여가 높은 사원을 조회하라.
select *
from EMP
where SAL > all (select SAL from EMP where DEPTNO=10);


-- 6. 20번 부서의 (직무, 급여) 조합과 같은 조건을 가진 사원들을 조회하라.
select JOB, SAL
from EMP where DEPTNO=20;
-- +
select *
from EMP
where (JOB='MANAGER'
and SAL=2975)
or (JOB='ANALYST' and SAL=3000)
or (JOB='CLERK' and SAL=1100)
or (JOB='CLERK' and SAL=800);
-- =
select *
from EMP
where (JOB, SAL) in (select job,sal from EMP where DEPTNO=20);


-- 7. 각 부서별 최고 급여를 받는 사원 정보를 조회하라.
select DEPTNO, max(SAL)
from EMP group by DEPTNO;
-- +
select *
from EMP where (DEPTNO=10 and SAL=5000)
            or (DEPTNO=20 and SAL=3000)
            or (DEPTNO=30 and SAL=2850);
-- =
select *
from EMP
where (DEPTNO, SAL) in (select DEPTNO, max(SAL) from EMP group by DEPTNO);


-- 8. 자기 부서의 평균 급여보다 높은 급여를 받는 사원들의 이름, 부서번호, 급여를 조회하라.
select *
from EMP e where SAL>(select avg(sal) from emp m where m.DEPTNO=e.DEPTNO);

--서브쿼리는 다 join으로 가능 ↓↓↓
select DEPTNO, avg(SAL)
from EMP group by DEPTNO;
-- select *
-- from EMP e,
--      (select DEPTNO,avg(SAL) from EMP group by DEPTNO) m
-- where e.DEPTNO=m.DEPTNO
-- order by e.EMPNO;
select *
from EMP e inner join
     (select DEPTNO, trunc(avg(SAL),2) avg from EMP group by DEPTNO) m
on e.DEPTNO=m.DEPTNO
where e.SAL>m.avg
order by e.EMPNO;


-- 9. 사원이 존재하는 부서만 조회하라.
select * from DEPT;
-- +
select distinct DEPTNO from EMP; --distinct를 굳이 쓰지 않아도 되지만, 연산적으로 봤을 땐 이게 효율적임..~
-- =
select *
from DEPT where DEPTNO in (select distinct DEPTNO from EMP);

select *
from EMP where DEPTNO=10;

select *
from DEPT
where exists(select * from EMP where emp.DEPTNO=DEPT.DEPTNO);


-- 10. 각 사원의 이름, 급여와 함께 해당 사원 부서의 평균 급여를 같이 출력하라.
select *
from EMP e;