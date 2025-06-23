create database shopping;
use shopping;

create table member_tbl_02(
    custno int(6) not null primary key,
    custname varchar(20),
    phone varchar(13),
    address varchar(60),
    joindate date,
    grade char(1),
    city char(2)
);

create table money_tbl_02(
    custno int(6) not null,
    salenol int(8) not null,
    pcost int(8),
    amount int(4),
    price int(8),
    pcode varchar(4),
    sdate date,
    foreign key(custno) references member_tbl_02(custno),
    primary key(custno, salenol)
);

insert into member_tbl_02 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '2015-12-02', 'A', '01');
insert into member_tbl_02 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '2015-12-06', 'B', '01');
insert into member_tbl_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '2015-10-01', 'B', '30');
insert into member_tbl_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '2015-11-13', 'A', '30');
insert into member_tbl_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '2015-12-25', 'B', '60');
insert into member_tbl_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '2015-12-11', 'C', '60');

insert into money_tbl_02 values(100001, 20160001, 500, 5, 2500, 'A001', '2016-01-01');
insert into money_tbl_02 values(100001, 20160002, 1000, 4, 4000, 'A002', '2016-01-01');
insert into money_tbl_02 values(100001, 20160003, 500, 3, 1500, 'A008', '2016-01-01');
insert into money_tbl_02 values(100002, 20160004, 2000, 1, 2000, 'A004', '2016-01-02');
insert into money_tbl_02 values(100002, 20160005, 500, 1, 500, 'A001', '2016-01-03');
insert into money_tbl_02 values(100003, 20160006, 1500, 2, 3000, 'A003', '2016-01-03');
insert into money_tbl_02 values(100004, 20160007, 500, 2, 1000, 'A001', '2016-01-04');
insert into money_tbl_02 values(100004, 20160008, 300, 1, 300, 'A005', '2016-01-04');
insert into money_tbl_02 values(100004, 20160009, 600, 1, 600, 'A006', '2016-01-04');
insert into money_tbl_02 values(100004, 20160010, 3000, 1, 3000, 'A007', '2016-01-06');

# 회원정보 조회
select * from member_tbl_02;

# 회원매출조회
select member_tbl_02.custno, member_tbl_02.custname, member_tbl_02.grade, sum(m.price) from member_tbl_02
join money_tbl_02 m on member_tbl_02.custno = m.custno
group by member_tbl_02.custno, member_tbl_02.custname, member_tbl_02.grade
order by sum(price) desc;

# update 사용해보기
update member_tbl_02
set address = '부산 사상구 엄궁동', city = '44'
where custno = 100001;
update member_tbl_02
set address = '울산 태화동', city = '66'
where custno = 100005;
select * from member_tbl_02;



























