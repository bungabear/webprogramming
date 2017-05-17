Create Table QUIZ
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- 문제
  Q_EX1 varchar2(20) ,             --  보기
  Q_EX2 varchar2(20) ,             --  보기
  Q_EX3 varchar2(20) ,            --  보기
  Q_EX4 varchar2(20) ,            --  보기
  Q_ANSWER varchar2(20)      --  정답
 );
alter table quiz add(
  Q_TYPE varchar2(5) ,   
     -- TT (문제 T 보기 T ) , TI (문제 T 보기 I )  , IT (문제 I 보기 T )
  Q_IMAGE varchar2(50)
);

Create Table SCORE
(
  S_NUM varchar2(100)  primary key,   --  학번
  S_Name varchar2(100) ,                  --  이름
  S_GRADE varchar2(10) ,                  --  점수
  Q_INDATE   date default sysdate    -- 시험날짜
);
select * from score;
drop table score;

insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, 'C# 프로그램의 기본 단위는 무엇인가  ?', 'TT', '클래스', '메소드', '패키지', '라이브러리', '클래스');



 IT173.gif 강아지가 몇마리인지 5마리
 307 강아지가 하고있는것. 잠자기, 춤추기-, 밥먹기, TV보기
 
 TI265, 271, 275, 285중 고양이는? 271
 TI223, 314, 332, 341중 고양이 한마리인거 341
 19, 57, 64, 391중 색이 다른것. 57
delete from quiz where Q_IMAGE is null;
select * from quiz;
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (1,'IT','그림의 강아지는 몇마리인가', '173.gif','2','3','5','7','5');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (2,'IT','그림의 강아지가 하고 있는것은?', '307.gif','잠자기', '춤추기', '밥먹기', 'TV보기','춤추기');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (3,'TI','다음중 고양이는?', null,'265.gif','271.gif','275.gif','285.gif','271.gif');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (4,'TI','다음중 고양이가 한마리인 그림은?', null,'223.gif','314.gif','332.gif','341.gif','341.gif');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (5,'TI','다음중 색이 다른그림은?', null,'19.gif','57.gif','64.gif','391.gif','57.gif');

insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(6, 'TT', '1+1= 무엇인가  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(7, 'TT', '3+9= 무엇인가  ?', null, '10', '11', '12', '16', '12');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(8, 'TT', '4x9= 무엇인가  ?', null, '1', '10', '25', '36', '36');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(9, 'TT', '72-19= 무엇인가  ?', null, '32', '45', '53', '66', '53');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(10, 'TT', '8/2= 무엇인가  ?', null, '1', '2', '3', '4', '4');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, 'TT', '9+(-8)= 무엇인가  ?', null, '1', '2', '3', '4', '1');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(12, 'TT', '10x(0.2)= 무엇인가  ?', null, '1', '2', '3', '4', '2');

insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(13, 'TT', '4-3= 무엇인가  ?', null, '1', '2', '3', '4', '1');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(14, 'TT', '99-97= 무엇인가  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(15, 'TT', '72/36= 무엇인가  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(16, 'TT', '7-4= 무엇인가  ?', null, '1', '2', '3', '4', '3');
update QUIZ set Q_IMAGE = '173.gif' where Q_NUM = 1;
select * from (select * from quiz order by DBMS_RANDOM.RANDOM) where rownum <= 10 order by Q_NUM;