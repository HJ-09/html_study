
--- 조인 연습문제

-- 1번
select ENAME, DNAME
    from EMP e
    inner join DEPT d
    on e.DEPTNO=d.DEPTNO;


-- 2번
select ENAME 사원이름,
       DNAME 소속부서
    from EMP e
    left outer join DEPT d
    on e.DEPTNO=d.DEPTNO;


-- 3번
select ENAME 사원이름,
    DNAME 부서명
    from EMP e
    right outer join DEPT d
    on d.DEPTNO=e.DEPTNO;


-- 4번
select ENAME, DNAME
    from EMP e
    full outer join DEPT d
    on e.DEPTNO=d.DEPTNO;


-- 5번
select e.ENAME 사원,
       m.ENAME 동료
    from EMP e
    join EMP m
    on e.DEPTNO=m.DEPTNO
    and e.EMPNO<>m.EMPNO;


-- 6번
select e.*,d.*
    from EMP e
    cross join DEPT d;


-- 7번
select *
    from EMP e
    inner join DEPT d
    on e.DEPTNO=d.DEPTNO
    order by e.DEPTNO;


-- 8번
select ENAME 사원,
        nvl(DNAME,'NO DEPT') 부서
    from EMP e
    left join DEPT d
    on e.DEPTNO=d.DEPTNO;

select ENAME 사원,
        coalesce(d.DNAME, 'NO DEPT') 부서
    from EMP e
    left join DEPT d
    on e.DEPTNO=d.DEPTNO;


-- 9번
select ENAME 사원,
       DNAME 부서명
    from EMP e
    inner join DEPT d
    on e.DEPTNO=d.DEPTNO
    where d.DNAME='SALES';

select ENAME 사원,
       DNAME 부서명
    from EMP e
    inner join DEPT d
    on e.DEPTNO=d.DEPTNO
    and d.DNAME='SALES';


-- 10번
select e.ENAME 이름,
       d.ENAME 관리자
    from EMP e
    left join EMP d
    on e.DEPTNO=d.DEPTNO
    and e.EMPNO<>d.EMPNO;




--- 조인 문제

-- 1번
select ENAME 사원이름,
       DNAME 부서이름
    from EMP e
    cross join DEPT d
    where e.DEPTNO=d.DEPTNO;


select ENAME 사원이름,
       DNAME 부서이름
from EMP e
         join DEPT d
 on e.DEPTNO=d.DEPTNO;

-- 2번
select ENAME 사원이름,
       JOB 직무
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
and LOC='DALLAS';

-- 3번
select ENAME 사원이름,
       SAL 급여,
       DNAME 부서이름
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
and sal>=2000
order by 급여;

-- 번


-- 번


-- 번


-- 번