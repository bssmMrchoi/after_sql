
use shopping;

create table member_tbl_02(
     custno int not null
     primary key
     ,custname varchar(10),
     phone varchar(20),
     address varchar(60),
     joindate date,
     grade varchar(1),
     city varchar(2));

insert into member_tbl_02 values(100001,'김행복','010-1111-2222','서울 동대문구 휘경1동',20151202,'A','01');
insert into member_tbl_02 values(100002,'이축복','010-1111-3333','서울 동대문구 휘경2동',20151206,'B','01');
insert into member_tbl_02 values(100003,'장믿음','010-1111-4444','울릉군 울릉읍 독도1리',20151001,'B','30');
insert into member_tbl_02 values(100004,'최사랑','010-1111-5555','울릉군 울릉읍 독도2리',20151113,'A','30');
insert into member_tbl_02 values(100005,'진평화','010-1111-6666','제주도 제주시 외나무골',20151225,'B','60');
insert into member_tbl_02 values(100006,'차공단','010-1111-7777','제주도 제주시 감나무골',20151211,'C','60');
select * from member_tbl_02;

drop table money_tbl_02;

create table money_tbl_02(
    custno int not null,
    salenol int not null,
    pcost int,
    amount int,
    price int,
    pcode varchar(4),
    sdate date,
    foreign key (custno) references member_tbl_02(custno),
    primary key (custno,salenol)
);

desc money_tbl_02;

insert into money_tbl_02 values(100001,20160001,500,5,2500,'A001',20160101);
insert into money_tbl_02 values(100001,20160002,1000,4,4000,'A002',20160101);
insert into money_tbl_02 values(100001,20160003,500,3,1500,'A008',20160101);
insert into money_tbl_02 values(100002,20160004,2000,1,2000,'A004',20160102);
insert into money_tbl_02 values(100002,20160005,500,1,500,'A001',20160103);
insert into money_tbl_02 values(100003,20160006,1500,2,3000,'A003',20160103);
insert into money_tbl_02 values(100004,20160007,500,2,1000,'A001',20160104);
insert into money_tbl_02 values(100004,20160008,300,1,300,'A005',20160104);
insert into money_tbl_02 values(100004,20160009,600,1,600,'A006',20160104);
insert into money_tbl_02 values(100004,20160010,3000,1,3000,'A007',20160106);

select * from money_tbl_02;

select * from member_tbl_02;

desc member_tbl_02;

select mon.custno,mem.custname,mem.grade,sum(mon.price) from member_tbl_02 mem join money_tbl_02 mon on mem.custno=mon.custno group by mem.custno, mon.custno,mem.custname,mem.grade order by sum(mon.price) desc;

update member_tbl_02 set custname='강준석',phone='010-9999-7777',address='부산광역시 강서구 가락대로 1393',joindate=20250623,grade='B',city='10' where custno=100001;