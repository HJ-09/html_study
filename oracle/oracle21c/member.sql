CREATE USER hyeji IDENTIFIED BY hyeji1;

-- 2. 권한 부여
GRANT CONNECT, RESOURCE TO hyeji;
ALTER USER hyeji QUOTA UNLIMITED ON users;


CREATE TABLE hyeji.MEMBER (
                        MEMBER_ID NUMBER PRIMARY KEY,              -- 회원 고유 번호 (PK)
                        USER_ID VARCHAR2(30) UNIQUE NOT NULL,      -- 로그인용 아이디
                        USER_PW VARCHAR2(100) NOT NULL,            -- 비밀번호
                        USER_NAME VARCHAR2(50) NOT NULL,           -- 이름
                        EMAIL VARCHAR2(100),                       -- 이메일
                        PHONE VARCHAR2(20),                        -- 전화번호
                        GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')), -- 성별 (M/F만 가능)
                        BIRTHDATE DATE,                            -- 생년월일
                        REGDATE DATE DEFAULT SYSDATE               -- 가입일 (자동 입력)
);

CREATE SEQUENCE hyeji.SEQ_MEMBER
    START WITH 1
    INCREMENT BY 1
    NOCACHE
NOCYCLE;

INSERT INTO hyeji.MEMBER (
    MEMBER_ID, USER_ID, USER_PW, USER_NAME, EMAIL
) VALUES (
             hyeji.SEQ_MEMBER.NEXTVAL, 'hyj123', 'pw1234', '김혜지', 'hyj@naver.com'
         );

INSERT INTO hyeji.MEMBER (MEMBER_ID, USER_ID, USER_PW, USER_NAME, EMAIL, PHONE, GENDER, BIRTHDATE, REGDATE) VALUES
    (hyeji.SEQ_MEMBER.NEXTVAL, 'user01', '1234', '김민수', 'minsu01@example.com', '010-1111-0001', 'M', TO_DATE('1995-03-12','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user02', '1234', '이하나', 'hana02@example.com', '010-1111-0002', 'F', TO_DATE('1998-07-25','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user03', '1234', '박진우', 'jinu03@example.com', '010-1111-0003', 'M', TO_DATE('1992-11-05','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user04', '1234', '최예린', 'yerin04@example.com', '010-1111-0004', 'F', TO_DATE('1999-01-20','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user05', '1234', '정도윤', 'doyun05@example.com', '010-1111-0005', 'M', TO_DATE('1990-06-10','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user06', '1234', '오수빈', 'subin06@example.com', '010-1111-0006', 'F', TO_DATE('2000-02-15','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user07', '1234', '한지훈', 'jihoon07@example.com', '010-1111-0007', 'M', TO_DATE('1993-09-30','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user08', '1234', '김하은', 'haeun08@example.com', '010-1111-0008', 'F', TO_DATE('1997-12-08','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user09', '1234', '이승현', 'seunghyun09@example.com', '010-1111-0009', 'M', TO_DATE('1994-04-22','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user10', '1234', '박서연', 'seoyeon10@example.com', '010-1111-0010', 'F', TO_DATE('1996-05-17','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user11', '1234', '조현우', 'hyunwoo11@example.com', '010-1111-0011', 'M', TO_DATE('1991-02-28','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user12', '1234', '서유리', 'yuri12@example.com', '010-1111-0012', 'F', TO_DATE('1999-08-09','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user13', '1234', '장도현', 'dohyun13@example.com', '010-1111-0013', 'M', TO_DATE('1989-10-03','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user14', '1234', '문예지', 'yeji14@example.com', '010-1111-0014', 'F', TO_DATE('2001-03-26','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user15', '1234', '김현성', 'hyunsung15@example.com', '010-1111-0015', 'M', TO_DATE('1992-01-05','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user16', '1234', '양서연', 'seoyeon16@example.com', '010-1111-0016', 'F', TO_DATE('1998-06-14','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user17', '1234', '유재민', 'jaemin17@example.com', '010-1111-0017', 'M', TO_DATE('1997-11-22','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user18', '1234', '홍지수', 'jisu18@example.com', '010-1111-0018', 'F', TO_DATE('1996-09-19','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user19', '1234', '배정우', 'jungwoo19@example.com', '010-1111-0019', 'M', TO_DATE('1995-07-27','YYYY-MM-DD'), DEFAULT);
INSERT INTO hyeji.MEMBER VALUES (hyeji.SEQ_MEMBER.NEXTVAL, 'user20', '1234', '정하늘', 'haneul20@example.com', '010-1111-0020', 'F', TO_DATE('2000-10-11','YYYY-MM-DD'), DEFAULT);
commit;