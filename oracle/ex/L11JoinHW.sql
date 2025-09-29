
--- S13Join 연습문제

-- 1. EMP와 DEPT를 내부 조인하여 모든 사원의 이름(ENAME)과 소속 부서명(DNAME)을 조회하라.
select ENAME, DNAME from EMP e, DEPT d where e.DEPTNO=d.DEPTNO;

select ENAME, DNAME
    from EMP e
        inner join DEPT d
            on e.DEPTNO=d.DEPTNO;

select ENAME, DNAME
    from EMP e natural join DEPT d;


-- 2. 모든 사원의 이름과 소속 부서를 출력하되, 소속이 없는 사원도 포함되도록 LEFT JOIN을 사용하라.
select e.ENAME, e.EMPNO, d.DNAME, d.LOC
    from EMP e inner join DEPT d
        on e.DEPTNO=d.DEPTNO;

select e.ENAME, e.EMPNO, d.DNAME, d.LOC
    from EMP e left join DEPT d
          on e.DEPTNO=d.DEPTNO;


-- 3. 모든 부서명을 출력하되, 사원이 없는 부서도 포함되도록 RIGHT JOIN을 사용하라.
    select e.EMPNO, e.ENAME, d.DEPTNO, d.DNAME, d.LOC
        from emp e right join dept d
            on e.DEPTNO=d.DEPTNO;


-- 4. EMP와 DEPT를 FULL OUTER JOIN하여 사원 또는 부서가 없어도 모두 조회하라.
    select e.EMPNO, e.ENAME, d.DEPTNO, d.DNAME, d.LOC
        from emp e full join dept d
            on e.DEPTNO=d.DEPTNO;



-- 5. EMP 테이블에서 사원 이름과 같은 부서에 속한 다른 사원의 이름을 SELF JOIN으로 조회하라.




-- 6. EMP와 DEPT를 CROSS JOIN하여 모든 가능한 조합을 조회하라.
select *
from EMP,DEPT order by EMPNO,dept.DEPTNO;

select *
from EMP cross join DEPT order by EMPNO,dept.DEPTNO;


-- 7. 사번의 DEPTNO와 부서의 DEPTNO가 일치하는 데이터만 INNER JOIN으로 조회하고, DEPTNO 순으로 정렬하라.
select *
from EMP natural join dept order by DEPTNO;


-- 8. 사원의 이름, 부서명을 출력하되, 부서명이 없는 경우 "NO DEPT"로 표시하라. (LEFT JOIN + NVL/COALESCE 활용)
select e.ENAME, nvl(d.DNAME,'NO DEPT')
from EMP e left join DEPT d
    on e.deptno=d.DEPTNO
order by d.DEPTNO;


-- 9. EMP에서 ENAME, DEPT에서 DNAME을 INNER JOIN으로 조회하되, 부서명이 'SALES'인 사원만 출력하라.
select *
from EMP e natural join DEPT d
where d.DNAME='SALES';


-- 10. 관리자는 job이 Manager인 사람입니다. 사원이 속한 부서의 관리자를 SELF JOIN을 사용해 출력하세요. 매니저가 아닌 사원만 표시하고 매니저는 "관리자"로 표시하세요.
select *
from EMP where JOB='MANAGER';
select e.ENAME,e.DEPTNO,m.ENAME,m.JOB
from EMP e inner join emp m
    on e.DEPTNO=m.DEPTNO
where m.job='MANAGER' and e.EMPNO!=m.EMPNO
order by e.EMPNO;