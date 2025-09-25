select * from EMP where COMM=null;
-- null은 없는 데이터이기 때문에 동등비교연산 불가

select * from EMP where COMM is null ; --comm이 null인 것
select * from EMP where COMM is not null ; --comm이 null이 아닌 것

select to_number('13','999g999') from dual;