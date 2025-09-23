
-- 데이터 소스
--      url⇒  jdbc:oracle:thin@//localhost:1521/XEPDB1
--      user: system
--      password: oracle


-- select 7*8 from dual;

create user table_user identified by "1234"
default tablespace USERS
temporary tablespace TEMP
quota unlimited on USERS;

grant connect, resource to table_user;

create table TABLE_USER.board(
    no NUMBER,
    title VARCHAR2(50),
    contents varchar2(100)
)