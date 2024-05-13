-- Active: 1713956067589@@localhost@3306@perusahaan

-- Tugas

CREATE TABLE departemen (
    no_dep INT (2),
    nama VARCHAR (50),
    lokasi VARCHAR (100),
    PRIMARY KEY (no_dep)
);

CREATE TABLE proyek (
    no_pro INT (2),
    nama VARCHAR (50),
    lokasi VARCHAR (100),
    no_dep INT (2),
    PRIMARY KEY (no_pro),
    Foreign Key (no_dep) REFERENCES departemen (no_dep)
);

CREATE TABLE kerja (
    no_ker INT (2),
    no_ktp BIGINT (16),
    no_pro INT (2),
    lama_jam INT (2),
    PRIMARY KEY (no_ker),
    Foreign Key (no_ktp) REFERENCES pegawai (no_ktp),
    Foreign Key (no_pro) REFERENCES proyek (no_pro)
);

CREATE TABLE pegawai (
    no_ktp BIGINT (16),
    nama VARCHAR (50),
    jenis_kel ENUM ('L', 'P'),
    alamat VARCHAR (100),
    tgl_lahir DATE,
    gaji DOUBLE (10,3),
    no_dep INT (2),
    PRIMARY KEY (no_ktp),
    Foreign Key (no_dep) REFERENCES departemen (no_dep)
);

CREATE TABLE tanggungan (
    no_tang INT (2),
    no_ktp BIGINT (16),
    nama VARCHAR (50),
    jenis_kel ENUM ('L', 'P'),
    tgl_lahir DATE,
    hubungan VARCHAR (15),
    PRIMARY KEY (no_tang)
);

INSERT INTO departemen (no_dep, nama, lokasi)
VALUES
(1, 'Keuangan', 'Malang'),
(2, 'Pemasaran', 'Malang'),
(3, 'Produksi', 'Malang'),
(4, 'Tenaga Kerja', 'Malang'),
(5, 'IT', 'Malang');

INSERT INTO pegawai (no_ktp, nama, jenis_kel, alamat, tgl_lahir, gaji, no_dep) VALUES 
(20104260001, 'Dodo', 'L', 'Malang', '1987-12-12', 2000000, 1),
(20104270002, 'Nini', 'P', 'Surabaya', '1989-12-13', 2000000, 2),
(20104280002, 'Norman', 'L', 'Malang', '1979-01-01', 2500000, 2),
(20104290001, 'Lala', 'P', 'Malang', '1990-03-11', 1750000, 5),
(20104300002, 'Dinda', 'P', 'Kediri', '1980-02-15', 2000000, 3),
(20104310001, 'Soni', 'L', 'Tulungagung', '1970-10-29', 3000000, 4),
(20104320002, 'Nono', 'L', 'Surabaya', '1986-09-17', 2600000, 5),
(20104330001, 'Dita', 'P', 'Malang', '1974-03-01', 2000000, 3),
(20104340002, 'Hari', 'L', 'Surabaya', '1969-11-01', 2900000, 5),
(20104350002, 'Nino', 'L', 'Malang', '1972-11-10', 2000000, 1)

INSERT INTO proyek (no_pro, nama, lokasi, no_dep)
VALUES
(1, 'Desain Gambar', 'Malang', 5),
(2, 'Pemasaran Barang', 'Malang', 3),
(3, 'Jaringan Komputer', 'Surabaya', 4);

INSERT INTO kerja (no_ker, no_ktp, no_pro, lama_jam)
VALUES
(1, 20104260001, 1, 36),
(2, 20104340002, 1, 36),
(3, 20104290001, 2, 60),
(4, 20104320002, 1, 60),
(5, 20104270002, 1, 42);

INSERT INTO tanggungan (no_tang, no_ktp, nama, jenis_kel, tgl_lahir, hubungan) VALUES 
(1, 20104350002, 'Hera', 'P', '1972-11-12', 'Istri'),
(2, 20104350002, 'Rahel', 'P', '1992-08-17', 'Anak'),
(3, 20104350002, 'Roki', 'L', '1998-11-12', 'Anak'),
(4, 20104310001, 'Shinta', 'P', '1972-05-20', 'Istri'),
(5, 20104290001, 'Dini', 'P', '1990-07-01', 'Anak');

SELECT * FROM pegawai ORDER BY tgl_lahir DESC LIMIT 1;

DROP TABLE proyek; 
DROP TABLE kerja; 
DROP TABLE pegawai; 
DROP TABLE tanggungan;
DROP TABLE departemen;
DELETE FROM departemen;
SHOW TABLES;