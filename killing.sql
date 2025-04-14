create database contract;

use contract;

drop table Order_Kill;
drop table Customer;
drop table Target;

create table Customer(
    custid int primary key,
    cname varchar(20) not null,
    phone varchar(8),
    why varchar(30)
);

desc Customer;

create table Target(
    targetid int primary key,
    tname varchar(10) not null,
    address varchar(20) not null,
    gang varchar(10),
    price int not null
)

desc Target;

create table Order_Kill(
    kid int primary key,
    custid int,
    targetid int,
    d_day varchar(10) not null,
    how varchar(30) not null,

    foreign key(custid) references Customer(custid),
    foreign key(targetid) references Target(targetid)
);

desc Order_Kill;

insert into Customer values(117, '야스오', '010-1101', '요네에게 누명 쓰임');
insert into Customer values(917, '도우너 심슨',  '010-2911', '부모의 원수');
insert into Customer values(471, '이민길', '010-3812', '애인과의 결별');
insert into Customer values(999, '농약두봉지', '010-4713', '사기 당함');
insert into Customer values(340, '안드레아스 강', '010-5614', '트롤로 인한 티어강등');

insert into Target values(150, '요네', '소환사의 협곡', '아이오니아', 3150);
insert into Target values(100, 'Lirili', '사막', 'AI gen', 100000);
insert into Target values(200, 'Logitech', '스위스', 'Logitech', 10000);
insert into Target values(300, '잠만보', '관동지방', '태초마을', 30000);
insert into Target values(400, 'Tesla', '미국', '미국', 40000);

insert into Order_Kill values(1, 117, 150, '2025-04-07', '강펀치');
insert into Order_Kill values(2, 917, 200, '2025-02-03', '야스오 콤보');
insert into Order_Kill values(3, 471, 100, '2025-08-11', 'Tung Tung Tung Tung..');
insert into Order_Kill values(4, 999, 200, '2025-09-21', '야스오 콤보');
insert into Order_Kill values(5, 471, 400, '2025-11-13', '저격');

select * from Customer;
select * from Target;
select * from Order_Kill;

--1. 살해 방법이 ‘야스오’로 시작하는 행의 고객 id를 구하시오.
--3. 가격이 20000원 이상인 타겟의 이름을 구하시오.
--4. 고객id가 400이 넘는 고객의 사유를 구하시오.
select * from Order_Kill where how like '야스오 %'
select * from Target where price > 20000
select * from Customer where custid > 400

