-- select * from member;
-- drop table member;
CREATE TABLE member(
       id VARCHAR2(15),
       pass VARCHAR2(10),
       name VARCHAR2(15),
       age NUMBER,
       gender VARCHAR2(10),
       email VARCHAR2(30),
       status NUMBER default 0,
       PRIMARY Key(id)
   );
   
insert into member(id, pass, name, age, gender, email, status ) 
       values('kbs','1111','케이비',44,'여자','kbs@naver.com', 0);
       
insert into member(id, pass, name, age, gender, email, status ) 
       values('mbc','1111','엠비시',44,'남자','mbc@naver.com', 0);
select * from MEMBER;
delete from member where id='kbs';
update member set gender='남자'  where gender='1';

update member set id='kbs',pass='1111' where id='kbs';



-- 가입 날자같은건 default sysdate식으로 해준다.