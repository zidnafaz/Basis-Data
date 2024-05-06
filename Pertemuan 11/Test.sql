-- Active: 1713956067589@@localhost@3306@test
create table mahasiswa (
    no_mhs varchar(8) not null primary key,
    nama_mhs varchar(30) not null,
    jurusan varchar(10) not null);

create table mata_kuliah (
    kd_mk varchar(5) not null primary key,
    nama_mk varchar(30) not null);

create table dosen (
    kd_dosen char(5) not null primary key,
    nama_dosen varchar(30) not null);

alter table mata_kuliah add kd_dosen char(5);

ALTER TABLE mata_kuliah
    ADD CONSTRAINT fk_kd_dosen
    FOREIGN KEY (kd_dosen)
    REFERENCES dosen(kd_dosen);

create table detail_nilai (
    nilai_angka char(3) not null primary key,
    nilai_huruf char(1) not null);

create table nilai (
    no_mhs varchar(8),
    kd_mk varchar(5),
    nilai varchar(3),
    foreign key (no_mhs) references mahasiswa(no_mhs),
    foreign key (kd_mk) references mata_kuliah(kd_mk),
    foreign key (nilai) references detail_nilai(nilai_angka));

insert into mahasiswa
    (no_mhs, nama_mhs, jurusan)
    values
    ('1921001', 'Aminah', 'MI'),
    ('1921002', 'Budiman', 'MI'),
    ('1921003', 'Carina', 'MI'),
    ('1921004', 'Della', 'TI'),
    ('1921005', 'Firda', 'TI');

insert into dosen
    (kd_dosen, nama_dosen)
    values
    ('B104', 'Ati'),
    ('B105', 'Dita'),
    ('C102', 'Leo');

insert into mata_kuliah
    (kd_mk, nama_mk, kd_dosen)
    values
    ('MI350', 'Basis Data', 'B104'),
    ('MI465', 'Pemrograman', 'B105'),
    ('TI201', 'Mobile', 'C102');

insert into detail_nilai (
    nilai_angka, nilai_huruf)
    values
    ('85', 'A'),
    ('87', 'A'),
    ('78', 'B'),
    ('80', 'A');

INSERT INTO nilai (no_mhs, kd_mk, nilai)
    VALUES
    ('1921001', 'MI350', '85'),
    ('1921002', 'MI465', '87'),
    ('1921003', 'MI465', '85'),
    ('1921004', 'TI201', '78'),
    ('1921005', 'TI201', '80');