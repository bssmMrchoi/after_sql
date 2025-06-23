use shopping;
create table member_tbl_02(
  custno INT(6) NOT NULL primary key,
  custname varchar(20),
  phone varchar(13),
  address varchar(60),
  joindate date,
  grade char(1),
  city char(2)
);
create table money_tbl_02(
  custno INT(6),
  salenol INT(8) NOT NULL primary key,
  pcost INT(8),
  amount INT(4),
  price INT(8),
  pcode varchar(4),
  sdate date,
  foreign key (custno) references member_tbl_02(custno)
);
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) VALUES
(100001,'김행복','010-1111-2222','서울 동대문구 휘경1동',20151202,'A',01),
(100002,'이축복','010-1111-3333','서울 동대문구 휘경2동',20151206,'B',01),
(100003,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리',20151001,'B',30),
(100004,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리',20151113,'A',30),
(100005,'진평화','010-1111-6666','제주도 제주시 외나무골',20151225,'B',60),
(100006,'차공단','010-1111-7777','제주도 제주시 감나무골',20151211,'C',60);

INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) VALUES
(100001,20160001,500,5,2500,'A001', 20160101),
(100001,20160002,1000,4,4000,'A002',20160101),
(100001,20160003,500,3,1500,'A008',20160101),
(100002,20160004,2000,1,2000,'A004',20160102),
(100002,20160005,500,1,500,'A001',20160103),
(100003,20160006,1500,2,3000,'A003',20160103),
(100004,20160007,500,2,1000,'A001',20160104),
(100004,20160008,300,1,300,'A005',20160104),
(100004,20160009,600,1,600,'A006',20160104),
(100004,20160010,3000,1,3000,'A007',20160106);
select * from member_tbl_02;

update member_tbl_02
set
    custname='이민길',
    phone = '010-1313-1221',
    address = '경남 김해시 금관대로 688',
    joindate = 20250623,
    grade='A',
    city=26
where custno=100001;

select m.custno,m.custname,m.grade,sum(t.price) as sum from member_tbl_02 m join money_tbl_02 t on m.custno = t.custno group by m.custno,m.custname,m.grade order by sum desc;