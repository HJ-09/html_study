--insert into MEMBER (NAME, AGE) VALUES
-- ┌─ 내용 그대로 추가하는거면 바로 values 써도 됨.
insert into MEMBER VALUES ('이지형',25);

select * from MEMBER;

--ddl create 생성, alter
-- alter table MEMBER add

update MEMBER set AGE=null;

alter table MEMBER modify age number(3);

-- update MEMBER set age=2500 where NAME='남윤수';
-- └─ number(3)은 0~999까지만!
update MEMBER set age=25 where NAME='남윤수';
update MEMBER set age=-100 where NAME='이주헌';

-- 칼럼의 제약조건을 주는 것은 칼럼 수정이 아니고 제약 조건 등록임

alter table MEMBER add constraint age_check check ( age>=0 and age<=200 );
update MEMBER set age=20 where NAME='이주헌';

alter table MEMBER drop constraint age_check; --제약조건 삭제

insert into MEMBER (age) VALUES (39);

delete from MEMBER where age=39;
delete from MEMBER where name='이지형' and age=25;

-- ******* alter를 사용할 일은 별로 없다..!..?
--alter table MEMBER add constraint name_not_null --- 이렇게 쓰지 않음
alter table MEMBER modify (name not null); --이름만 이렇게 등록함
insert into MEMBER values ('최경민',39);
delete from MEMBER where name='최경민' and age=39;
insert into MEMBER (name,age) values ('최경민',39);
insert into MEMBER (name,age) values ('이주헌',20);

alter table MEMBER add id number(5);

delete from MEMBER where name='이주헌';

alter table MEMBER add constraint pk_member primary key (id);

insert into MEMBER values ('이주헌',30,4);
insert into MEMBER values ('이주헌',30,5);

update MEMBER set AGE=28 where id=4;

