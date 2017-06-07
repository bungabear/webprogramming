  CREATE TABLE DAO_member(
   name varchar(10),
   id varchar(20),
   pw varchar(20),
   phone1 varchar(10),
   phone2 varchar(10),
   phone3 varchar(10),
   gender varchar(10)
   );

 insert into DAO_member(name,id,pw,phone1, phone2, phone3, gender)  values('KBS','aaaa','1111','010','1234 ','5678','남자');

 update DAO_member set name='송동현', pw='1234', phone1='010', phone2='1324', phone3='6422', gender='밍재' where id = 'sdj';
select * From DAO_member ; 

  