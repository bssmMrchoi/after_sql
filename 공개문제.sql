use shopping;

insert into member_tbl_02 values(100001, '김행복', '010-1111-2222', '서울 동대문 휘경1동', 20151202, 'A', '01');
insert into member_tbl_02 values(100002, '이축복', '010-1111-3333', '서울 동대문 휘경2동', 20151206, 'B', '01');
insert into member_tbl_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', 20151001, 'B', '30');
insert into member_tbl_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', 20151113, 'A', '30');
insert into member_tbl_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', 20151225, 'B', '60');
insert into member_tbl_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 김나무골', 20151211, 'C', '60');

create table money_tbl_02 (
    custno   int(6)     not null ,
    saleno   int(8)     not null,
    pcost    int(8),
    amount   int(4),
    price    int(8),
    pcode    varchar(4),
    sdate    date,
    foreign key (custno) references member_tbl_02(custno),
    primary key (custno, saleno)
);

insert into money_tbl_02 values (100001, 20160001, 500, 5, 2500, 'A001', 20160101);
insert into money_tbl_02 values (100001, 20160002, 1000, 4, 4000, 'A002', 20160101);
insert into money_tbl_02 values (100001, 20160003, 500, 3, 1500, 'A008', 20160101);
insert into money_tbl_02 values (100002, 20160004, 2000, 1, 2000, 'A004', 20160102);
insert into money_tbl_02 values (100002, 20160005, 500, 1, 500, 'A001', 20160103);
insert into money_tbl_02 values (100003, 20160006, 1500, 2, 3000, 'A003', 20160103);
insert into money_tbl_02 values (100004, 20160007, 500, 2, 1000, 'A001', 20160104);
insert into money_tbl_02 values (100004, 20160008, 300, 1, 300, 'A005', 20160104);
insert into money_tbl_02 values (100004, 20160009, 600, 1, 600, 'A006', 20160104);
insert into money_tbl_02 values (100004, 20160010, 3000, 1, 3000, 'A007', 20160106);

# 회원목록조회/수정
select * from member_tbl_02;

update member_tbl_02
set custname = '정현태',
    phone = '010-6954-8852',
    address = '소환사의 협곡',
    joindate = 20180228,
    grade = 'C',
    city = '77'
    where member_tbl_02.custno = 100001;

# 회원매출조회
select member_tbl_02.custno, member_tbl_02.custname, member_tbl_02.grade, sum(price)
from member_tbl_02 join money_tbl_02 m on member_tbl_02.custno = m.custno
group by custno, custname, grade
having sum(price) > 0
order by sum(price) desc;