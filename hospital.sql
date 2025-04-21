use study_1_2;



CREATE TABLE hospital (
    hospital_id INT PRIMARY KEY,   -- 병원 ID
    name VARCHAR(100),             -- 병원명
    department VARCHAR(100),       -- 진료과
    director VARCHAR(100),         -- 병원장
    capacity INT                   -- 총 수
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


select h.name, h.department, count(*)
from hospital h join appointment a on h.hospital_id=a.hospital_id
group by h.name, h.department
having count(*) >= 1
order by count(*) desc;

select h.name, count(*)
from hospital h join appointment a on h.hospital_id=a.hospital_id join patient p on a.patient_id=p.patient_id
where p.age >= 30
group by h.name;