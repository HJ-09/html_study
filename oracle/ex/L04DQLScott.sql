select * from emp;

select * from DEPT;

select * from DEPT where DEPTNO=20; --where절 ⇒ 조건
select DNAME from DEPT where DEPTNO=20; --DNAME research
select DNAME as 부서이름 from DEPT where DEPTNO=20; --부서이름 research
select DNAME as "부서 이름" from DEPT where DEPTNO=20; --부서 이름 research
-- as 쓰는 것을 별칭이라고 하고, 별칭을 쓸 때는 큰 따옴표("") 쓰기! ※ 문자열은 작은 따옴표('') ※
select DNAME from DEPT where DEPTNO>=30; --sales, operations

select ENAME,SAL from EMP order by SAL desc ; --정렬 ⇒ order by+정렬대상(+desc하면 내림차순/ 없으면 오름차순)
--order by는 항상 맨 뒤에 작성. 조회 후 정렬하기 때문에
select ENAME,SAL from EMP where SAL>=1000 and SAL<2000 order by SAL desc ;

select * from EMP where ENAME='ALLEN';
update EMP set sal=2000 where EMPNO=7499;

select ENAME,SAL from EMP where SAL between 1000 and 2000 order by SAL desc ; -- 2000도 포함임

--┌─ 거의 대부분의 DB는 날짜를 문자열로 조회 가능(= 자동 형변환 가능)
select ENAME, HIREDATE from EMP where HIREDATE>'1981-09-01';
select ENAME, HIREDATE from EMP where HIREDATE='1987-07-13'; -- scott, adams // 07이나 7이나 똑같음

select ENAME, HIREDATE from EMP where HIREDATE>='1981-09-01' and HIREDATE<'1981-10-01';
-- select ENAME, HIREDATE from EMP where HIREDATE>='1981-09'; //이건 oracle에서 지원하지 않음.

--between a and b ⇒ 숫자
--between date a and date b ⇒ 날짜 //근데 date 생략해도 되기는 함
select ENAME, HIREDATE from EMP where HIREDATE between date '1981-09-01' and date '1981-09-30';


select * from emp where ENAME like 'TU%'; --TU로 시작하는 사람
select * from emp where ENAME like '%NE%'; --NE가 들어가는 사람
select * from emp where ENAME like '____'; --이름이 4글자인 사람
select * from emp where ENAME like '__RD'; --이름 끝자가 RD이고, 4글자인 사람








