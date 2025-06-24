use study_1_2;

create table test(id integer primary key);

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