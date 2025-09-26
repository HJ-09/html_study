select ENAME, DEPTNO,
       (select DNAME from DEPT where DEPTNO=EMP.DEPTNO) as 부서이름
from EMP;

select
    ENAME,
    emp.DEPTNO,
    DNAME,
    LOC
   --,DEPT.DEPTNO --where절에 조건이 있기 때문에 출력 안해도 댐.
from EMP,DEPT
where EMP.DEPTNO=DEPT.DEPTNO
order by ENAME;


select
    PAY_ID,
    p.EMPNO,
    e.EMPNO,
    ENAME,AMOUNT,
    BONUS
from PAY_HISTORY p, EMP e -- 오라클은 테이블 별칭에 as 못 씀. EMP as a 이런거 안댐.
where p.EMPNO=e.EMPNO
    and AMOUNT>=2000
order by PAY_ID;


-- inner join
select
    PAY_ID,
    p.EMPNO,
    e.EMPNO,
    ENAME,AMOUNT,
    BONUS
from PAY_HISTORY p inner join EMP e
on p.EMPNO=e.EMPNO
where AMOUNT>=2000
order by PAY_ID;

--- 갑분 Tip! about 가명 as
select ENAME as 사원이름 from EMP;
select ENAME 사원이름 from EMP;
select e.ename, e.empno 사원이름 from emp e;
--select e.ename, e.empno 사원이름 from emp as e; --오라클에서는 테이블에 as 를 쓸 수 없음 ~! ~!

select e.*,d.DNAME
from EMP e inner join dept d
on e.DEPTNO=d.DEPTNO;


-- 외부조인
select distinct DEPTNO from EMP;
select * from DEPT;
select * from EMP where DEPTNO is null ;
update EMP set DEPTNO=null where EMPNO in(7698,7782,7788); --deptno가 null인 사람이 없어서 만드는 중~
select count(*) from EMP;
select *
    from EMP e inner join DEPT d
    on e.DEPTNO=d.DEPTNO; --14명에서 11명으로 줄엇슴! 확인 완.

select *
    from EMP e left outer join DEPT d
    on e.DEPTNO=d.DEPTNO; -- 밑에 7698,7782,7788 이 친구들 null로 표기되어 잇슴.

select *
    from EMP e right outer join DEPT d
    on e.DEPTNO=d.DEPTNO; --

select *
    from EMP e full outer join DEPT d
    on e.DEPTNO=d.DEPTNO; 



-- natual join(=inner join) ⇒ 자동으로 on을 생성해줌.
-- pk랑 fk가 같아야 함! pk랑 fk가 지정이 안된 테이블은 당연히 안되겟져!?

select *
from EMP natural join dept;



-- 자기 조인
select EMPNO, ENAME, MGR from EMP; --mgr은 상사번호

-- self join은 자기가 2개라고 생각하면 댐!
select e.EMPNO 사번,
       e.ENAME 사원이름,
       e.MGR 상사번호,
       m.ENAME 상사이름
from EMP e, EMP m
where e.mgr=m.EMPNO;

select e.*, m.ENAME
from EMP e inner join EMP m --근데 self join이라는 명령어는 업슴.. 띄용?
on e.mgr=m.EMPNO;

select e.*, m.ENAME
from EMP e left join EMP m --outer는 생략가능~..!
on e.mgr=m.EMPNO;
