use study_1_2;
CREATE TABLE hospital (
    hospital_id INT PRIMARY KEY,   -- 병원 ID
    name VARCHAR(100),             -- 병원명
    department VARCHAR(100),       -- 진료과
    director VARCHAR(100),         -- 병원장
    capacity INT                   -- 층 수
);

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,    -- 환자 ID
    name VARCHAR(100),             -- 이름
    phone VARCHAR(20),             -- 전화번호
    age INT,                       -- 나이
    symptoms TEXT                  -- 증상
);

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,  -- 접수번호 (자동 생성)
    hospital_id INT,           -- 병원 ID (외래키)
    patient_id INT,            -- 환자 ID (외래키)
    reservation_datetime DATETIME, -- 예약일시 (날짜 + 시간)
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

INSERT INTO hospital (hospital_id, name, department, director, capacity) VALUES
(1, '서울 중앙 병원', '내과', '김민수', 100),
(2, '서울 중앙 병원', '정형외과', '이수정', 90),
(3, '서울 중앙 병원', '피부과', '정우성', 80),
(4, '부산 행복 병원', '소아청소년과', '박지훈', 60),
(5, '부산 행복 병원', '치과', '최유진', 50);

INSERT INTO patient (patient_id, name, phone, age, symptoms) VALUES
(101, '홍길동', '010-1234-5678', 34, '기침과 발열'),
(102, '이영희', '010-2345-6789', 29, '무릎 통증'),
(103, '김철수', '010-3456-7890', 7,  '복통'),
(104, '박민호', '010-4567-8901', 42, '충치'),
(105, '정지은', '010-5678-9012', 25, '피부 트러블');

INSERT INTO appointment (hospital_id, patient_id, reservation_datetime) VALUES
(1, 101, '2025-04-22 10:00:00'),
(2, 102, '2025-04-22 11:30:00'),
(3, 103, '2025-04-23 09:00:00'),
(4, 104, '2025-04-23 14:00:00'),
(3, 105, '2025-04-24 13:30:00');

select * from hospital;
select * from patient;
select * from appointment;

#1. 병원 이름과 진료과별로 예약 건수가 몇 건인지 구하고, 예약 건수가 1건 이상인 경우만 출력하되 예약 건수 기준으로 내림차순 정렬하시오.
select h.name, h.department, count(*)
from hospital h join appointment a on h.hospital_id = a.hospital_id
group by h.name, h.department
having count(*) >= 1
order by count(*) desc;

# 6. 30세 이상 환자들의 예약 건수를 병원별로 구하시오.30세 이상 환자들의 예약 건수를 병원별로 구하시오.
select count(*), h.name
from hospital h join appointment a on h.hospital_id = a.hospital_id
    join patient p on a.patient_id = p.patient_id
where p.age >= 30
group by h.name;

# 7번
select p.name, max(a.reservation_datetime)
from appointment a
join patient p on a.patient_id = p.patient_id
group by p.name;

# 12, 14번
# 각 병원별로 가장 나이가 많은 환자의 나이를 출력하시오.
select h.name, max(p.age)
from hospital h join appointment a on h.hospital_id = a.appointment_id
join patient p on a.patient_id = p.patient_id
group by h.name;

#예약이 한 건도 없는 병원의 ID와 이름을 출력하시오.
select h.hospital_id, h.name
from hospital h left join appointment a on h.hospital_id = a.hospital_id
where a.hospital_id is null;


# 5. 예약이 가장 적은 병원의 ID, 이름, 예약 건수를 출력하시오.
select h.hospital_id, h.name, count(*) as cnt
from hospital h join appointment a on h.hospital_id = a.hospital_id
group by h.hospital_id, h.name
order by cnt asc limit 1;

# 15. 병원별 예약된 고유 환자 수를 출력하시오. (같은 환자가 여러 번 예약했어도 1명으로 집계)
select h.name, count(distinct a.patient_id)
from hospital h join appointment a on h.hospital_id = a.hospital_id
group by h.name;

DROP TABLE IF EXISTS tDepartment CASCADE;
DROP TABLE IF EXISTS tRank CASCADE;
DROP TABLE IF EXISTS tReturnReason CASCADE;
DROP TABLE IF EXISTS tItem CASCADE;
DROP TABLE IF EXISTS tCustomer CASCADE;
DROP TABLE IF EXISTS tEmployee CASCADE;
DROP TABLE IF EXISTS tProduction CASCADE;
DROP TABLE IF EXISTS tOrder CASCADE;
DROP TABLE IF EXISTS tReturn CASCADE;


CREATE TABLE tDepartment
(
   DNumber varchar(5) not null
   , DName varchar(10) not null
);


CREATE TABLE tRank
(
   RNumber varchar(5) not null
   , RName varchar(2) not null
);


CREATE TABLE tReturnReason
(
   RRNumber varchar(6) not null
   , RReason varchar(4) not null
);


CREATE TABLE tItem
(
   INumber varchar(5) not null
   , IName varchar(20) not null
   , Price integer not null
   , RegisterDate TIMESTAMP not null
);


CREATE TABLE tCustomer
(
   CNumber varchar(5) not null
   , CName varchar(20) not null
   , CAddr varchar(10) not null
   , ContractDate TIMESTAMP not null
);


CREATE TABLE tEmployee
(
   ENumber varchar(5) not null
   , DNumber varchar(5) null
   , RNumber varchar(5) not null
   , EName varchar(5) not null
   , ERRN varchar(14) not null
   , EAddr varchar(10) not null
   ,  StartDate TIMESTAMP not null
   , ResignationDate TIMESTAMP null
);


CREATE TABLE tProduction
(
   PNumber varchar(5) not null
   , ENumber varchar(5) not null
   , INumber varchar(5) not null
   , PCount integer not null
   , PDate TIMESTAMP not null
);


CREATE TABLE tOrder
(
   ONumber varchar(5) not null
   , CNumber varchar(5) not null
   , PNumber varchar(5) not null
   , ODate TIMESTAMP  not null
);


CREATE TABLE tReturn
(
   RNumber varchar(5) not null
   , ONumber varchar(5) not null
   , RCount integer not null
   , RRNumber varchar(6) not null
   , RDate TIMESTAMP not null
);


ALTER TABLE tDepartment ADD CONSTRAINT PK_tDepartment_DNumber PRIMARY KEY (DNumber);
ALTER TABLE tRank ADD CONSTRAINT PK_tRank_RNumber PRIMARY KEY (RNumber);
ALTER TABLE tReturnReason ADD CONSTRAINT PK_tReturnReason_RRNumber PRIMARY KEY (RRNumber);
ALTER TABLE tItem ADD CONSTRAINT PK_tItem_INumber PRIMARY KEY (INumber);
ALTER TABLE tCustomer ADD CONSTRAINT PK_tCustomer_CNumber PRIMARY KEY (CNumber);
ALTER TABLE tEmployee ADD CONSTRAINT PK_tEmployee_ENumber PRIMARY KEY (ENumber);
ALTER TABLE tProduction ADD CONSTRAINT PK_tProduction_PNumber PRIMARY KEY (PNumber);
ALTER TABLE tOrder ADD CONSTRAINT PK_tOrder_ONumber PRIMARY KEY (ONumber);
ALTER TABLE tReturn ADD CONSTRAINT PK_tReturn_RNumber PRIMARY KEY (RNumber);


ALTER TABLE tEmployee ADD CONSTRAINT FK_tEmployee_DNumber
   FOREIGN KEY (DNumber) REFERENCES tDepartment (DNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tEmployee ADD CONSTRAINT FK_tEmployee_RNumber
   FOREIGN KEY (RNumber) REFERENCES tRank (RNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tProduction ADD CONSTRAINT FK_tProduction_ENumber
   FOREIGN KEY (ENumber) REFERENCES tEmployee (ENumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tProduction ADD CONSTRAINT FK_tProduction_INumber
   FOREIGN KEY (INumber) REFERENCES tItem (INumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tOrder ADD CONSTRAINT FK_tOrder_CNumber
   FOREIGN KEY (CNumber) REFERENCES tCustomer (CNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tOrder ADD CONSTRAINT FK_tOrder_PNumber
   FOREIGN KEY (PNumber) REFERENCES tProduction (PNumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tReturn ADD CONSTRAINT FK_tReturn_ONumber
   FOREIGN KEY (ONumber) REFERENCES tOrder (ONumber) ON DELETE No Action ON UPDATE No Action;
ALTER TABLE tReturn ADD CONSTRAINT FK_tReturn_RRNumber
   FOREIGN KEY (RRNumber) REFERENCES tReturnReason (RRNumber) ON DELETE No Action ON UPDATE No Action;