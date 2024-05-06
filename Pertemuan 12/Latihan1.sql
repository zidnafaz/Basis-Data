-- Active: 1713956067589@@localhost@3306@latihan1
CREATE DATABASE akademik;

USE akademik;

CREATE TABLE mahasiswa (
    NIM INT (2),
    nama VARCHAR (255),
    nomor_telepon VARCHAR (20),
    PRIMARY KEY (NIM)
);

CREATE TABLE mata_kuliah (
    kode VARCHAR (3),
    nama VARCHAR (255),
    sks INT (1),
    PRIMARY KEY (kode)
);

CREATE TABLE nilai (
    id INT AUTO_INCREMENT,
    NIM INT (2),
    kode_mata_kuliah CHAR (3),
    nilai_huruf CHAR (2),
    PRIMARY KEY (id)
);

INSERT INTO nilai (NIM, kode_mata_kuliah, nilai_huruf) VALUES
    (1, 'KCB', 'B+'),
    (2, 'ASD', 'A'),
    (3, 'MMT', 'B'),
    (4, 'PBO', 'A'),
    (4, 'KCB', 'C');

UPDATE nilai SET id = 0;

INSERT INTO mahasiswa (NIM, nama) VALUES /* Menambahkan data pada TIDAK pada semua kolom */
(1, 'Ani Rahmawati');

UPDATE mahasiswa SET nomor_telepon = '0857550234'
    WHERE NIM = 1;

INSERT INTO mahasiswa (NIM, nama, nomor_telepon) VALUES /* Menambahkan data pada semua kolom */
(2, 'Budi Raharjo', '0858776453'),
(3, 'Charlie Setiabudi', '0859767553'),
(4, 'Diandra Paramita', '0858998745');

INSERT INTO mata_kuliah (kode, nama) VALUES
('BDD', 'Basis Data Dasar'),
('PBO', 'Pemrograman Berorientasi Objek'),
('MMT', 'Multimedia Terapan'),
('SPK', 'Sistem Pendukung Keputusan'),
('KCB', 'Kecerdasan Buatan'),
('ASD', 'Algortima dan Struktur Data');

DROP Table mata_kuliah;

DROP Table nilai;

UPDATE mata_kuliah SET
    nama = 'Multimdia Terapan Tingkat Lanjut',
    sks = 3
    WHERE kode = 'MMT';

UPDATE mata_kuliah SET
    sks = 2
    WHERE kode <> 'MMT';

DELETE FROM mata_kuliah WHERE
    kode = 'BDD';

DELETE FROM mata_kuliah WHERE
    nama = 'Sistem Pendukung Keputusan';

ALTER TABLE nilai
    ADD FOREIGN KEY nim_idxfk (nim) REFERENCES mahasiswa (nim);

ALTER TABLE nilai
    ADD FOREIGN KEY kode_mata_kuliah_idxfk (kode_mata_kuliah) REFERENCES mata_kuliah (kode);

SELECT * FROM mata_kuliah;

SELECT * FROM nilai;

SELECT * FROM mahasiswa;

SELECT nim, nilai_huruf
FROM nilai
WHERE nilai_huruf = 'A';

SELECT DISTINCT nilai_huruf FROM nilai;

SELECT * FROM nilai WHERE nilai_huruf IN ('A', 'B');

SELECT * FROM nilai WHERE nilai_huruf BETWEEN 'B+' AND 'C';

SELECT * FROM mahasiswa WHERE nama LIKE '%an%';

SELECT kode FROM mata_kuliah UNION ALL SELECT kode_mata_kuliah FROM nilai;

SELECT kode FROM mata_kuliah INTERSECT SELECT kode_mata_kuliah FROM nilai;

SELECT kode FROM mata_kuliah EXCEPT SELECT kode_mata_kuliah FROM nilai;

SELECT nim, kode_mata_kuliah, nilai_huruf
FROM nilai
WHERE nilai_huruf > ALL
(SELECT nilai_huruf FROM nilai WHERE nilai_huruf = 'A');

SELECT nim, kode_mata_kuliah, nilai_huruf
FROM nilai
WHERE nilai_huruf IN
(SELECT nilai_huruf FROM nilai WHERE nilai_huruf > 'A');

SELECT nim,(SELECT nama FROM mahasiswa WHERE nilai.NIM=mahasiswa.NIM)
nama,(SELECT nama FROM mata_kuliah mk WHERE mk.kode = nilai.kode_mata_kuliah) mk,nilai_huruf
FROM nilai
WHERE NIM=1;

SELECT COUNT(nilai_huruf) FROM nilai;