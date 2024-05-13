-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Feb 2024 pada 07.35
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking_hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pemesanan`
--

CREATE TABLE `detail_pemesanan` (
  `id_pengunjung` int(11) NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `durasi` int(11) NOT NULL,
  `nomor_kamar` int(11) NOT NULL,
  `checkin` time NOT NULL,
  `checkout` time NOT NULL,
  `id_resepsionis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_pemesanan`
--

INSERT INTO `detail_pemesanan` (`id_pengunjung`, `tanggal_pemesanan`, `durasi`, `nomor_kamar`, `checkin`, `checkout`, `id_resepsionis`) VALUES
(1, '2024-02-20', 2, 101, '16:19:17', '00:00:00', 1),
(2, '2024-02-21', 1, 201, '17:21:41', '11:21:41', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas_pengunjung`
--

CREATE TABLE `identitas_pengunjung` (
  `id_pengunjung` int(11) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `nama_pengunjung` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan','','') NOT NULL,
  `status_perkawinan` enum('Kawin','Belum Kawin','','') NOT NULL,
  `no_handphone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `identitas_pengunjung`
--

INSERT INTO `identitas_pengunjung` (`id_pengunjung`, `NIK`, `nama_pengunjung`, `jenis_kelamin`, `status_perkawinan`, `no_handphone`) VALUES
(1, '33251246839216', 'Jono', 'Laki-laki', 'Kawin', '086432684932'),
(2, '332432474324243', 'Tono', 'Laki-laki', 'Belum Kawin', '086532638293');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas_resepsionis`
--

CREATE TABLE `identitas_resepsionis` (
  `id_resepsionis` int(11) NOT NULL,
  `nama_resepsionis` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `identitas_resepsionis`
--

INSERT INTO `identitas_resepsionis` (`id_resepsionis`, `nama_resepsionis`) VALUES
(1, 'Ajeng'),
(2, 'Tanto');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `nomor_kamar` int(11) NOT NULL,
  `kelas_kamar` tinytext NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`nomor_kamar`, `kelas_kamar`, `harga`) VALUES
(101, 'Deluxe', 560000),
(201, 'Luxury', 780000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD KEY `id_pengunjung` (`id_pengunjung`),
  ADD KEY `id_resepsionis` (`id_resepsionis`),
  ADD KEY `nomor_kamar` (`nomor_kamar`);

--
-- Indeks untuk tabel `identitas_pengunjung`
--
ALTER TABLE `identitas_pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`);

--
-- Indeks untuk tabel `identitas_resepsionis`
--
ALTER TABLE `identitas_resepsionis`
  ADD PRIMARY KEY (`id_resepsionis`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`nomor_kamar`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD CONSTRAINT `detail_pemesanan_ibfk_1` FOREIGN KEY (`nomor_kamar`) REFERENCES `kamar` (`nomor_kamar`),
  ADD CONSTRAINT `detail_pemesanan_ibfk_2` FOREIGN KEY (`id_resepsionis`) REFERENCES `identitas_resepsionis` (`id_resepsionis`),
  ADD CONSTRAINT `detail_pemesanan_ibfk_3` FOREIGN KEY (`id_pengunjung`) REFERENCES `identitas_pengunjung` (`id_pengunjung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
