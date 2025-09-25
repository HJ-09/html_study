
select sum(sal) from emp; --29025
--select ENAME,sum(sal) from emp; //그룹함수는 그룹함수끼리만 사용할 수 있음

select sum(sal), round(avg(sal)) from EMP; --29025, 2073
select sum(sal) as 급여총합, round(avg(sal)) "급여 평균" from EMP; --별칭 써주는게 조음. 띄어쓰기 하고싶으면 큰 따옴표 쓰셍요~
-- 집계함수를 작성하면 필드는 꼭 직계함수만 작성 가능! 직계함수는 뭐지?

-- distinct ⇒ 중복제거(집계함수 아님)
select DEPTNO from EMP; --
select distinct DEPTNO from EMP; --단일행이 아니라 중복을 제거 하는거임

select count(*) from emp; --14
update EMP set COMM=null where COMM=0;
select count(*),MAX(SAL),max(COMM),min(SAL),min(COMM) from emp; --14, 5000, 1400, 800, 0
select count(*),MAX(SAL),max(COMM),min(SAL),min(COMM) from emp where DEPTNO=30; --3, 2850, 1400, 950, 0
-- └─ 부서번호가 30번인 곳의 명수, 최고급여, 최고커미션, 최저급여, 최저커미션
select stddev(SAL) from emp; --1182.503223516271699458653359613061928508

-- 집계를 그룹간 group by...?
select DEPTNO from EMP group by DEPTNO; --distinct랑 결과가 비슷함 뀨. 근데 얘는 중복되는 것들끼리 묶은거.
select DEPTNO, sum(sal) from EMP group by DEPTNO; --부서간의 급여의 합. 부서번호 10: 8750, 부서번호 20: 10875, 부서번호 30: 9400

-- select DEPTNO, sum(sal), round(avg(sal)) from EMP group by DEPTNO where sal>=1000;
select DEPTNO, sum(sal), round(avg(sal)) from EMP where sal>=1000 group by DEPTNO;
-- 조회가 먼저 발생해야 해서 where절이 집계(group by) 앞에 있어야 함!

-- 그런데, 집계된 결과를 조건(where)에 주고 싶다면..?! (근데 이제 코드 정렬을 곁들인..)
select DEPTNO,
       sum(sal) as total,
       round(avg(sal)) as average
    from EMP
    where sal>1000
    group by DEPTNO
    having sum(sal)>8500
    order by total desc ; --오라클은 가명(as total, as average) 사용 못함. MySQL은 가명 쓸 수 잇슴!
    --order by ⇒ 결과 다 나오고서, 오름차순(빈칸이거나 asc)인지 내림차순(desc)인지. 그래서 맨 마지막에 있어야 함~~
-- WHERE는 그룹화 이전의 행에 조건을 주고, HAVING은 그룹화 이후의 집계 결과에 조건을 준다!