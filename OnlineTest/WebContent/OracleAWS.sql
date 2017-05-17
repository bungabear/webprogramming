Create Table QUIZ
(
  Q_NUM int  primary key,
  Q_QUESTION varchar2(200) ,  -- ����
  Q_EX1 varchar2(20) ,             --  ����
  Q_EX2 varchar2(20) ,             --  ����
  Q_EX3 varchar2(20) ,            --  ����
  Q_EX4 varchar2(20) ,            --  ����
  Q_ANSWER varchar2(20)      --  ����
 );
alter table quiz add(
  Q_TYPE varchar2(5) ,   
     -- TT (���� T ���� T ) , TI (���� T ���� I )  , IT (���� I ���� T )
  Q_IMAGE varchar2(50)
);

Create Table SCORE
(
  S_NUM varchar2(100)  primary key,   --  �й�
  S_Name varchar2(100) ,                  --  �̸�
  S_GRADE varchar2(10) ,                  --  ����
  Q_INDATE   date default sysdate    -- ���賯¥
);
select * from score;
drop table score;

insert into Quiz(Q_NUM, Q_QUESTION, Q_TYPE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, 'C# ���α׷��� �⺻ ������ �����ΰ�  ?', 'TT', 'Ŭ����', '�޼ҵ�', '��Ű��', '���̺귯��', 'Ŭ����');



 IT173.gif �������� ������� 5����
 307 �������� �ϰ��ִ°�. ���ڱ�, ���߱�-, ��Ա�, TV����
 
 TI265, 271, 275, 285�� ����̴�? 271
 TI223, 314, 332, 341�� ����� �Ѹ����ΰ� 341
 19, 57, 64, 391�� ���� �ٸ���. 57
delete from quiz where Q_IMAGE is null;
select * from quiz;
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (1,'IT','�׸��� �������� ����ΰ�', '173.gif','2','3','5','7','5');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (2,'IT','�׸��� �������� �ϰ� �ִ°���?', '307.gif','���ڱ�', '���߱�', '��Ա�', 'TV����','���߱�');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (3,'TI','������ ����̴�?', null,'265.gif','271.gif','275.gif','285.gif','271.gif');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (4,'TI','������ ����̰� �Ѹ����� �׸���?', null,'223.gif','314.gif','332.gif','341.gif','341.gif');
insert into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values (5,'TI','������ ���� �ٸ��׸���?', null,'19.gif','57.gif','64.gif','391.gif','57.gif');

insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(6, 'TT', '1+1= �����ΰ�  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(7, 'TT', '3+9= �����ΰ�  ?', null, '10', '11', '12', '16', '12');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(8, 'TT', '4x9= �����ΰ�  ?', null, '1', '10', '25', '36', '36');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(9, 'TT', '72-19= �����ΰ�  ?', null, '32', '45', '53', '66', '53');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(10, 'TT', '8/2= �����ΰ�  ?', null, '1', '2', '3', '4', '4');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(11, 'TT', '9+(-8)= �����ΰ�  ?', null, '1', '2', '3', '4', '1');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(12, 'TT', '10x(0.2)= �����ΰ�  ?', null, '1', '2', '3', '4', '2');

insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(13, 'TT', '4-3= �����ΰ�  ?', null, '1', '2', '3', '4', '1');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(14, 'TT', '99-97= �����ΰ�  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(15, 'TT', '72/36= �����ΰ�  ?', null, '1', '2', '3', '4', '2');
insert  into quiz(Q_NUM, Q_TYPE, Q_QUESTION, Q_IMAGE, Q_EX1, Q_EX2, Q_EX3, Q_EX4, Q_ANSWER) Values(16, 'TT', '7-4= �����ΰ�  ?', null, '1', '2', '3', '4', '3');
update QUIZ set Q_IMAGE = '173.gif' where Q_NUM = 1;
select * from (select * from quiz order by DBMS_RANDOM.RANDOM) where rownum <= 10 order by Q_NUM;