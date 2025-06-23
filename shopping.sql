use shopping

create table hospital (
    hospital_id INT PRIMARY KEY,   -- 병원 ID
    name VARCHAR(100),             -- 병원명
    department VARCHAR(100),       -- 진료과
    director VARCHAR(100),         -- 병원장
    capacity INT                   -- 층 수
);