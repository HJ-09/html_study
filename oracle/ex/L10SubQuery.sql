-- from 서브쿼리: 조회한 결과를 다시 조회한 대상으로 사용 = Paging

select * from EMP;

select * from (select * from dept);

select DEPTNO, '$'||round(avg(SAL)) 평균급여
    from EMP
    group by DEPTNO
    having avg(SAL)>2000;
-- └─ 집계를 2번 하는거기때문에 성능이 썩 좋지 못해

select g.DEPTNO, g.평균급여
    from (select DEPTNO, round(avg(SAL)) 평균급여
    from EMP
    group by DEPTNO) g
    where 평균급여>2000;
-- └─ 가명을 쓰기 때문에 집계는 1번만..~


--- ROWNUM: 행을 출력할 때 번호 생성
select ROWNUM, EMPNO, ENAME from EMP;

select ROWNUM no, EMPNO, ENAME
    from EMP
    --where no > 5
    order by EMPNO; --rownum의 동작시점은 order by 이후임.. 싱기하죠? 그래서 where절(조건)로 줄 수가 업듬


select r.*
    from (select ROWNUM no, EMPNO, ENAME
        from EMP
        --where no < 5
        order by EMPNO) r
    where r.no < 5; --이렇게 select절로 만들면 where절로 조건을 줄 수 이뜸~~ 쨘~~


select r.*
from (select ROWNUM no, EMPNO, ENAME
      from EMP) r
     order by EMPNO; --rownum을 조건절로 쓰고 싶으면 이렇게 쓰면 안댐뀨


--- where절 단일행 서브쿼리
select avg(sal) from EMP;
select * from EMP where SAL>2073;
--위에 두 줄과 아래 한 줄은 동.일.
select * from EMP where SAL>(select avg(SAL) from EMP);


-- 평균급여가 2000 이상인 부서에 있는 사원을 찾아보자~
select DEPTNO, avg(SAL)
from EMP
group by DEPTNO
having avg(SAL)>=2000;
select * from EMP where DEPTNO in (10,20);

-- where절 다중행 서브쿼리
select *
    from EMP
    where DEPTNO
              in (select DEPTNO
                  from EMP
                  group by DEPTNO
                  having avg(SAL)>=2000);

-- select절 서브쿼리(무조건 "단일행") ⇒ 출력되는 곳에 새로운거 추가. 레쯔고
select e.ENAME, e.DEPTNO, e.SAL,
       (select trunc(avg(SAL),2)
        from EMP g
        where g.DEPTNO=e.DEPTNO) as 부서평균
from EMP e; --조회하면서 조회할게 ~
-- 위아래 같은거임
select e.ENAME, e.DEPTNO, e.SAL, v.부서평균
from EMP e
    inner join (select DEPTNO, trunc(avg(SAL),2) 부서평균 from EMP group by DEPTNO) V
    on e.DEPTNO=v.DEPTNO;