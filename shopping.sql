use shopping

create table member_tbl_02 (
   custno int(6) NOT NULL PRIMARY KEY,
   custname varchar(20),
   phone varchar(13),
   address varchar(60),
   joindate date,
   grade char(1),
   city char(1)
);