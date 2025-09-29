
--- 페이징 연습문제

-- 1번
select *
from (select ROWNUM rnum, e.*
from EMP e
where ROWNUM<=5)
where rnum between 1 and 5;

-- 2번
select *
from (select ROWNUM rnum, e.*
from EMP e)
where rnum between 6 and 10;


-- 3번
select *
from (select ROWNUM no, emp.*
from EMP
join PAY_HISTORY
on emp.EMPNO=PAY_HISTORY.EMPNO
where DEPTNO=10)
where no between 1 and 5;

--ROWNUM으로 정렬해봄 ㅋ..
select *
from (
    select ROWNUM rnum, p.*
    from (select ENAME, p.*
          from PAY_HISTORY p
            join EMP e
    on e.EMPNO=p.EMPNO --사번 기준으로 연결한다!
            where DEPTNO=10
            order by AMOUNT desc ) p
    )
where rnum between 1 and 5;


-- 4번
select *
from (select p.*,
       row_number() over (order by PAY_DATE) rnum
        from PAY_HISTORY p)
where rnum between 1 and 5;


-- 5번
select *
from (select p.*,
       row_number() over (order by AMOUNT desc) r
from PAY_HISTORY p)
where r between 6 and 10;


-- 6번
select *
from (select p.*,
         row_number() over (order by PAY_DATE desc ) rank
        from PAY_HISTORY p
        where BONUS>0)
where rank between 1 and 5;


-- 7번
select *
from PAY_HISTORY
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ;


-- 8번
select *
from PAY_HISTORY
order by AMOUNT desc
offset 5 rows fetch next 5 rows only ;


-- 9번
select p.*
from PAY_HISTORY p
join emp e
on p.EMPNO=e.EMPNO
where e.JOB='SALESMAN'
order by p.PAY_DATE desc
offset 5 rows fetch next 5 rows only ;


-- 10번
select *
from PAY_HISTORY
where PAY_DATE>=sysdate-30
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ; --오늘 기준으로 최근 30일 이내가 없어서 출력되는게 업슴..!

-- pay_history의 마지막 날짜 기준으로 30일 이내 데이터 출력 해봄ㅋ
select *
from PAY_HISTORY
where PAY_DATE>= (select max(PAY_DATE) from PAY_HISTORY) -30
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ;


-- OFFSET/FETCH 와 ROW_NUMBER() 같이 쓰기! 쥐피티가 조곰 도와줌~
select t.*, row_number() over (order by PAY_DATE desc) as rank
from (
         select p.*
         from PAY_HISTORY p
                  join EMP e on p.empno = e.empno
         order by p.pay_date desc
         offset 1 rows fetch next 5 rows only
     ) t;



