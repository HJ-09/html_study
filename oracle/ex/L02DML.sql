
-- 데이터 소스
--      url⇒  jdbc:oracle:thin@//localhost:1521/XEPDB1
--      user: table_user
--      password: 1234


-- create table TABLE_USER.board(
--     no NUMBER,
--     title VARCHAR2(50),
--     contents varchar2(100)
-- );

create table member(
    name varchar2(10),
    age number
);

-- varchar/varchar2 는 작은따옴표('') 사용
-- NUMBER는 숫자(정수)
-- insert 는 저장, select는 조회
insert into member(name,age) values ('이주헌',31);
insert into member(name,age) values ('남윤수',27);
commit ;
select name, age from member;
select * from member; --전부 보기(*)

insert into BOARD(no,title,CONTENTS) values (1,'타이틀','내용?');
commit ;