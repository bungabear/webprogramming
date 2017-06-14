
   
   
   CREATE TABLE members(
   id varchar(20),
   pw varchar(20),
   name varchar(20),
   eMail varchar(20),
   rDate date,
   address varchar(200)
   );
   
 
    insert into members(id,pw,name,eMail, rDate,address) 
       values('aaaa','1111','AAAA','aaa@aaa.com','2017-01-28 ','인천 연수구');
       
       
       insert into members(id,pw,name,eMail, rDate,address) 
       values('aaaaaa','1111','AAAA','aaa@aaa.com','2017-01-28 ','인천 연수구');
       
       insert into members(id,pw,name,eMail, rDate,address) 
       values('a234aaa','1111','bb','aaa@aaa.com','2017-01-28 ','인천 연수구');
       
       insert into members(id,pw,name,eMail, rDate,address) 
       values('342432','1111','bbbbawe','aaa@aaa.com','2017-01-28 ','인천 연수구');

   select * From members ; 
 select * From student;  
 
 -- drop table members;
   
--   select * From members order by id ASC; 
    
    
  --    UPDATE members SET  pw='1111' WHERE id='aaaa';


  