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

create table money_tbl_02 (
   custno int(6),
   salenol int(8) NOT NULL PRIMARY KEY,
   pcost int(8),
   amount int(4),
   price int(8),
   pcode varchar(4),
   sdate date,
    FOREIGN KEY (custno) REFERENCES member_tbl_02(custno)
);