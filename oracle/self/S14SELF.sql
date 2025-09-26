
--- 조인 연습문제

-- 1번
select ENAME, SAL
    from EMP
    where sal > (select avg(SAL) from EMP);

-- 2번
select ENAME, JOB
    from EMP
    where JOB=(select JOB from EMP where ENAME='KING');

-- 3번
select ENAME 사원이름,
       SAL 급여
    from EMP
    where SAL in (select SAL from EMP where DEPTNO=20);

-- 4번
select ENAME 사원이름,
       SAL 급여
    from EMP
    where SAL > all (select SAL from EMP where DEPTNO=30);

-- 5번
select ENAME,
       SAL
    from EMP
    where sal > all (select SAL from EMP where DEPTNO=10);

-- 6번
select ENAME, JOB, SAL
    from EMP
    where (job, sal) in (
        select job, SAL
        from EMP
        where DEPTNO=20
        );

-- 7번
select ENAME 사원이름,
       SAL 급여,
       DEPTNO 부서번호
    from EMP
    where (DEPTNO, SAL)
              in (select DEPTNO, max(SAL)
                  from EMP e
                  group by DEPTNO);

-- 8번
select ENAME 이름,
       DEPTNO 부서번호,
       SAL 급여
    from EMP e
    where sal > (select avg(SAL) from EMP m where e.DEPTNO=m.DEPTNO)
    order by SAL desc ;

-- 9번
select DEPTNO, DNAME
from DEPT d
where exists(
    select 1
    from EMP e
    where d.DEPTNO=e.DEPTNO);

-- 10번
select e.ENAME 이름,
       e.SAL 급여,
       e.DEPTNO 부서번호,
        (select round(avg(p.sal),2) from emp p where p.DEPTNO=e.DEPTNO) 평균급여
    from EMP e;

