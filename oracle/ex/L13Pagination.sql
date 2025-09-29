
-- 사원관리 페이지에서 페이징이 되어 있음
-- 한 페이지당 5명씩 출력
select ROWNUM no, e.* from EMP e order by e.HIREDATE; --오라클에서는 rownum이랑 쓸려면 *의 별칭이 있어야 함
--└ 번호 뒤죽박죽

select ROWNUM no, emp.*
from
    (select * from EMP order by HIREDATE) emp;
--└ 번호 정렬
-- → rownum은 order by 이후에 붙여야 함!

select *
from (select ROWNUM no, emp.*
      from
          (select * from EMP order by HIREDATE) emp)
where no between 6 and 10;
-- row 5
-- 1페이지 1~5
-- 2페이지 6~10
-- 3페이지 11~15
-- 공식발견?! ⇒ (page-1)*5+1 ~ page*5


select ROWNUM, e.* from EMP e;
select ROWNUM, e.* from EMP e order by SAL;

--- over ⇒ 정렬필요?~! ↓↓↓

select ROW_NUMBER() over (order by SAL) no, e.* from EMP e;

-- select ROW_NUMBER() over (order by SAL) no, e.* from EMP e
-- where no between 1 and 5;
--└
select *
from (select ROW_NUMBER() over (order by SAL) no, e.* from EMP e)
where no between 6 and 10;
--└ 출력할 친구 먼저 괄호 안에 쀼?

--- offset/fetch

select *
    from EMP
    order by SAL
    offset 5 rows fetch next 5 rows only ;


