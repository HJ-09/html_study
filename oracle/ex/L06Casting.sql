
-- 출력만 해보는건 가상테이블에서 해야해~
-- MySQL은 select SYSDATE;만 해도 되는데 오라클은 안댐.
select sysdate from dual; --dual이 가상테이블
select to_char(sysdate) from dual; --25/09/25
select to_char(sysdate,'HH24/MI/SS') from dual; --01/15/13 --> 세계표준시간
select to_char(sysdate,'HH24"시" MI"분" SS"초"') from dual; --01시 16분 56초


ALTER SESSION SET TIME_ZONE = 'Asia/Seoul'; --오라클은 한국시간을 가리킴. 근데 데이터베이스 바뀌면 다시 국제시간 가르킴. 오라클 전체를 한국시간으로 바꾸고 싶으면 시스템권한으로 설정 바꿔야 함.
--SELECT SESSIONTIMEZONE FROM DUAL;

--영향 안 받는 것 ▽
SELECT SYSDATE FROM DUAL; --2025-09-25 06:12:03
SELECT SYSTIMESTAMP FROM DUAL; --2025-09-25 06:12:08.799983 +00:00
SELECT TO_CHAR(SYSDATE,'HH24/MI/SS') FROM DUAL; --06/12/50
SELECT TO_CHAR(SYSDATE,'HH24"시" MI"분" SS"초"') FROM DUAL; --06시 12분 57초

SELECT CURRENT_TIMESTAMP FROM DUAL; --2025-09-25 15:12:15.942790 +09:00
SELECT TO_CHAR(SYSDATE) FROM DUAL; --25-9월 -25
SELECT SYSTIMESTAMP AT TIME ZONE 'Asia/Seoul' FROM DUAL; --2025-09-25 15:12:31.226218 +09:00
-- └─ AT TIME ZONE은 session이 무엇이던지간에 'Asis/Seoul'로 바꿀 수 잇음
--SELECT SYSDATE AT TIME ZONE 'Asia/Seoul' FROM DUAL; --근데 얘는 안됨. 왜? 밀리초를 포함하는 친구만 AT TIME ZONE으로 바꿀 수 있음!


select to_number('12345') from dual; --12345
select '12345'*2 from dual; --24690 //자동형변환
-- select '12,345'*2 from dual; --12345 //얘는 자동형변환 x
select to_number('12,345','99g999')*2 from dual; --24690

--select SAL+'$' from EMP; --숫자랑 문자열 더하기 x
--select ENAME+'님' from EMP; --숫자랑 문자열 더하기 x
select ENAME||'님' from EMP;
select concat(ENAME,' 님') from EMP;

select SAL+10 from EMP; --숫자끼리 더하는건 구냥 잘됨
select SAL||'$' from EMP; --이렇게 형변환하면 소수점 날아감..!

alter session set nls_territory ='AMERICA'; --통화단위를 달러로 하려고 지역을 미국으로 바꿈
select to_char(SAL, 'FML999,999,999,999.00') from EMP;

