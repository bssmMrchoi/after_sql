create database team_1_2;

use team_1_2;

# customer 생성
create table Customer(
	custid int primary key,
	cname varchar(10) not null,
	phone varchar(8),
	why varchar(30)
);
desc Customer;
#Target
create table Target(
	targetid int primary key,
	tname varchar(10) not null,
	address varchar(20) not null,
	gang varchar(10),
	price int not null
);
desc Target;

# Order_kill 생성
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


insert into Customer values(117, '야스오', '010-1101', '요네에게 누명쓰임요');
insert into Customer values(917, '도우너 심슨', '010-2911', '부모의 원수');
insert into Customer values(471, '이민길', '010-3812', '애인과의 결별');
insert into Customer values(999, '농약두봉지', '010-4713', '사기 당함');
insert into Customer values(340, '안드레아스 강', '010-5614', '트롤로 인한 티어 강등');

insert into Target values(150, '요네', '소환사의 협곡', '아이오니아', 3150);
insert into Target values(100, 'Lirili', '사막', 'AI gen', 100000);
insert into Target values(200, 'Logitech', '스위스', 'Logitech', 10000);
insert into Target values(300, '잠만보', '관동지방', '태초마을', 30000);
insert into Target values(400, 'Tesla', '미국', '미국', 40000);

insert into Order_Kill values(1, 117, 150, '2025-04-07', '강펀치');
insert into Order_Kill values(2, 917, 200, '2025-02-03', '야스오 콤보');
insert into Order_Kill values(3, 471, 100, '2025-08-11', 'tung tung tung tung tung sahur');
insert into Order_Kill values(4, 999, 200, '2025-09-21', '야스오 콤보(e-q플-e-q-궁');
insert into Order_Kill values(5, 471, 400, '2025-11-13', '저격');

select * from Customer;
select * from Target;
select * from Order_Kill;


select custid from Order_Kill where how like '야스오%';
select * from Target t join Order_Kill ok on t.targetid = ok.targetid join Customer c on ok.custid = c.custid
where t.price >= 20000;
select tname from Target where price >= 20000;
select why from Customer where custid >= 400;


#1. target의 가격이 비싼 순으로 정렬하여 검색하세요.
select price from Target order by price desc;

#2. 날짜와 청부 이유를 내림차순으로 정렬한 결과를 출력하시오
select c.why, ok.d_day
from Order_Kill ok join Customer c on ok.custid=c.custid
order by ok.d_day  desc;

#3. 살해방법을 날짜순(오름차순)으로 정렬한 결과를 출력하시오.
select how,d_day from Order_Kill order by how ;

#4. 타겟을 이름순으로 검색하시오.
select tname from Target order by tname;


#1.청구비용이 가장 비싼 것과 가장 싼 가격을 검색하시오.
select min(price), max(price) from Target;

#2. 가장 큰 현상금을 가진 타겟의 고객의 이름과 이유를 구하시오
select c.cname, c.why
from Customer c join Order_Kill OK on c.custid = OK.custid
join Target T on OK.targetid = T.targetid
where T.price =100000 = (select max(price) from Target);

#3. 고객번호가 471인 고객의 타겟의 가격 평균
select avg(price) from Target where targetid in (select targetid from Order_Kill where custid = 471);

#4. 청구비용이 가장 싼 타겟을 찾으시오.
select price from Target where price = (select min(price) from Target);


