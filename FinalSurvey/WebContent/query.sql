create table member
(
	 id  varchar(100) primary key,
	 password varchar(100)
);

create table survey(
	id varchar(100) primary key,
	answer int
);

insert into SURVEY values('5',1);

select * from member;
select * from survey;

drop table member;
drop table survey;