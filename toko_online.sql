-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2019 at 08:53 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis_berita` varchar(20) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `keywords` text DEFAULT NULL,
  `status_berita` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id_gambar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `judul_gambar` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id_gambar`, `id_produk`, `judul_gambar`, `gambar`, `tanggal_update`) VALUES
(1, 1, 'TEss', '10.png', '2019-03-11 08:39:28'),
(2, 1, 'Bunga Dahlia', '8.png', '2019-03-11 11:00:24'),
(8, 3, 'tes', '4.png', '2019-03-15 14:19:17'),
(9, 3, 'aa', '9.png', '2019-03-15 14:19:25'),
(16, 19, '1', 'pb_xiaomi_10rb_mah,_150rb.jpg', '2019-07-05 23:42:44'),
(26, 17, '`', '6__11.jpg', '2019-07-05 23:51:39'),
(27, 16, '7', '7_.jpg', '2019-07-05 23:53:14'),
(29, 13, '1', '10_.jpg', '2019-07-05 23:58:05'),
(30, 22, 'Biru', 'IMG-20190721-WA00231.jpg', '2019-07-22 05:56:54'),
(31, 22, 'Cream', 'IMG-20190721-WA0024.jpg', '2019-07-22 05:57:05'),
(32, 18, 'Maroon', 'IMG-20190721-WA00221.jpg', '2019-07-22 05:57:47'),
(33, 18, 'Cream', 'IMG-20190721-WA00241.jpg', '2019-07-22 05:58:00'),
(34, 24, '16', 'IMG-20190721-WA0052.jpg', '2019-07-22 06:42:02'),
(35, 20, 'Blue', 'IMG-20190721-WA00232.jpg', '2019-07-22 06:54:51'),
(36, 20, 'Red', 'IMG-20190721-WA00222.jpg', '2019-07-22 06:55:02'),
(37, 14, 'Oren', 'IMG-20190721-WA0044.jpg', '2019-07-22 07:00:11'),
(38, 14, 'Hijau Muda', 'IMG-20190721-WA0041.jpg', '2019-07-22 07:00:53'),
(39, 14, 'merah', 'IMG-20190721-WA0043.jpg', '2019-07-22 07:01:10'),
(40, 14, 'Biru', 'IMG-20190721-WA0042.jpg', '2019-07-22 07:01:27'),
(41, 13, 'a', 'IMG-20190721-WA0048.jpg', '2019-07-22 07:02:48'),
(42, 28, 'biru', 'IMG-20190721-WA00233.jpg', '2019-07-22 20:54:43'),
(43, 29, 'PuBG', 'IMG-20190721-WA0026.jpg', '2019-07-22 21:56:15'),
(44, 31, '2', 'IMG-20190721-WA0028.jpg', '2019-07-22 22:07:22'),
(45, 43, '2', 'IMG-20190721-WA0055.jpg', '2019-07-23 01:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `header_transaksi`
--

CREATE TABLE `header_transaksi` (
  `id_header_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `status_bayar` varchar(20) NOT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL,
  `rekening_pembayaran` varchar(255) DEFAULT NULL,
  `rekening_pelanggan` varchar(255) DEFAULT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `id_rekening` int(11) DEFAULT NULL,
  `tanggal_bayar` varchar(255) DEFAULT NULL,
  `nama_bank` varchar(255) DEFAULT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header_transaksi`
--

INSERT INTO `header_transaksi` (`id_header_transaksi`, `id_user`, `id_pelanggan`, `nama_pelanggan`, `email`, `telepon`, `alamat`, `kode_transaksi`, `tanggal_transaksi`, `jumlah_transaksi`, `status_bayar`, `jumlah_bayar`, `rekening_pembayaran`, `rekening_pelanggan`, `bukti_bayar`, `id_rekening`, `tanggal_bayar`, `nama_bank`, `tanggal_post`, `tanggal_update`) VALUES
(1, 0, 5, 'yoayo', 'kamubisa@yahoo.com', '085770859752', 'Perum Pangulah Permai', '31032019RSYJDPOF', '2019-03-31 00:00:00', 139000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-31 04:57:44', '2019-03-31 02:57:44'),
(2, 0, 5, 'yoayo', 'kamubisa@yahoo.com', '085770859752', 'Perum Pangulah Permai', '31032019GQWASLV7', '2019-03-31 00:00:00', 75000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-31 06:00:06', '2019-03-31 04:00:06'),
(5, 0, 7, 'harun arrashid', 'harun_arrashid14@yahoo.com', '081574276385', 'Perum Pangulah Permai', '26042019NQVJUZAR', '2019-04-26 00:00:00', 243500, 'Konfirmasi', 243500, '374629234432', 'Harun Arrashid', '11.png', 3, '16-07-2019', 'Bank Mandiri', '2019-04-26 15:22:53', '2019-07-16 02:23:52'),
(6, 0, 7, 'harun arrashid', 'harun_arrashid14@yahoo.com', '081574276385', 'Perum Pangulah Permai', '27042019X34PYTSK', '2019-04-27 00:00:00', 105000, 'Konfirmasi', 105000, '123454', 'Farid', 'koala.png', 1, '06-05-2019', 'BANK BCA', '2019-04-27 03:14:02', '2019-05-06 14:37:00'),
(7, 0, 7, 'Gozuken14', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah Blok B NO.16 RT 03 RW 09, Desa Pangulah Selatan, Kec Kotabaru,  Kab Karawang', '08052019KTYQGN5F', '2019-05-08 00:00:00', 180000, 'Konfirmasi', 180000, '9761934618', 'Daerun Yasin', 'vivi1.png', 1, '08-05-2019', 'Bank BRI', '2019-05-08 05:41:55', '2019-05-08 03:55:51'),
(8, 0, 7, 'Gozuken14', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah ', '04072019BL3CMVLH', '2019-07-04 00:00:00', 55000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-04 04:07:28', '2019-07-04 02:07:28'),
(9, 0, 7, 'Gozuken14', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah ', '05072019JM1ZBFHC', '2019-07-05 00:00:00', 70000, 'Konfirmasi', 70000, '7583727', 'Harun Arrashid', NULL, 4, '22-07-2019', 'Bank Mandiri', '2019-07-05 15:56:05', '2019-07-22 20:56:12'),
(10, 0, 8, 'Mba Windi', 'windi@gmail.com', '08673451', 'Perum Kotabaru', '06072019ZVE42ZJU', '2019-07-06 00:00:00', 172000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-06 02:21:11', '2019-07-06 00:21:11'),
(11, 0, 8, 'Mba Windi', 'windi@gmail.com', '08673451', 'Perum Kotabaru', '08072019UEK5R8R4', '2019-07-08 00:00:00', 632000, 'Konfirmasi', 632000, '7638127364', 'Teguh Didin', '8__tg_Redmi_note71.jpg', 1, '08-07-2019', 'Bank Mandiri', '2019-07-08 05:53:34', '2019-07-08 06:29:06'),
(12, 0, 9, 'Difa', 'difablank@gmail.com', '089676948548', 'cikampek', '09072019NZSHZVX1', '2019-07-09 00:00:00', 15000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-09 07:56:34', '2019-07-09 05:56:34'),
(13, 0, 9, 'Difa', 'difablank@gmail.com', '089676948548', 'cikampek', '09072019ROLSXOE3', '2019-07-09 00:00:00', 250000, 'Konfirmasi', 250000, '3432432432', 'Difa', NULL, 1, '09-07-2019', 'BRI', '2019-07-09 07:57:49', '2019-07-09 05:59:28'),
(14, 0, 7, 'Gozuken14', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah ', '13072019TIUWUFP4', '2019-07-13 00:00:00', 25000, 'Konfirmasi', 25000, '531234', 'Harun Arrashid', NULL, 4, '24-07-2019', 'Bank Mandiri', '2019-07-13 04:56:35', '2019-07-24 06:15:22'),
(15, 0, 7, 'Harun Ar-Rashid', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah Permai Blok B.2 No.16 RT03 RW09, Desa Pangulah Selatan, Kec. Kotabaru, Kab. Karawang', '16072019DLUTZF4V', '2019-07-16 00:00:00', 340000, 'Konfirmasi', 340000, '354546742', 'Harun Arrashid', '2_(2).png', 3, '16-07-2019', 'Bank Mandiri', '2019-07-16 04:17:17', '2019-07-16 02:31:03'),
(16, 0, 7, 'Harun Ar-Rashid', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah Permai Blok B.2 No.16 RT03 RW09, Desa Pangulah Selatan, Kec. Kotabaru, Kab. Karawang', '16072019HYXS7BMO', '2019-07-16 00:00:00', 250000, 'Konfirmasi', 250000, '984717', 'Harun', NULL, 3, '18-07-2019', 'Bank Mandiri', '2019-07-16 09:46:07', '2019-07-21 03:26:45'),
(17, 0, 7, 'Harun Ar-Rashid', 'harun_arrashid14@yahoo.com', '085770851112', 'Perum Pangulah Permai Blok B.2 No.16 RT03 RW09, Desa Pangulah Selatan, Kec. Kotabaru, Kab. Karawang', '23072019YLANOGN7', '2019-07-23 00:00:00', 85000, 'Belum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-23 03:23:00', '2019-07-23 01:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `slug_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `slug_kategori`, `nama_kategori`, `urutan`, `tanggal_update`) VALUES
(4, 'cassing', 'Cassing', 1, '2019-07-05 23:36:59'),
(5, 'tempered-glass', 'Tempered Glass', 2, '2019-07-05 23:36:49'),
(6, 'power-bank', 'Power Bank', 5, '2019-07-05 23:36:39'),
(7, 'kabel-data', 'Kabel Data', 3, '2019-07-05 23:37:11'),
(8, 'earphone', 'Earphone', 4, '2019-07-05 23:37:25'),
(9, 'memory-card', 'Memory Card', 6, '2019-07-05 23:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int(11) NOT NULL,
  `namaweb` varchar(255) NOT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `metatext` text DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `rekening_pembayaran` varchar(255) DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_konfigurasi`, `namaweb`, `tagline`, `email`, `website`, `keywords`, `metatext`, `telepon`, `alamat`, `facebook`, `instagram`, `deskripsi`, `logo`, `icon`, `rekening_pembayaran`, `tanggal_update`) VALUES
(1, 'Suzaki Cell Store', '9 Dari 10 Pintu Rezeki Adalah Berdagang', 'harun_arrashid14@yahoo.com', 'http://suzaki.com', 'Suzaki Cell Cikampek', '41374', '08577-0859-752', 'Jln Ahmad Yani No.18A Dibawah Fly Over Cikampek', 'https://www.facebook.com/suzaki.cel', 'https://www.instagram.com/harun.arrasyid14/', 'Toko Aksesoris Handphone Terlengkap dan Termurah', 'Jasa-Bimbingan-Skripsi-Teknik-Informatika-Ilmu-Komputer-Sistem-Informasi1.jpg', 'tahapan-skripsi.jpg', 'BCA BNI BRI MANDIRI', '2019-07-21 13:38:34'),
(2, 'Toko Dahlia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-17 11:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `tanggal_daftar` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `id_user`, `status_pelanggan`, `nama_pelanggan`, `email`, `password`, `telepon`, `alamat`, `tanggal_daftar`, `tanggal_update`) VALUES
(1, 0, 'Pending', 'Farid Gilang', 'farid@gmail.com', '1b9faaf1f3dac6a8d82a26f3469f70a1288136e2', '085770859752', 'Perum Pangulah Permai', '2019-03-30 07:48:12', '2019-03-30 06:48:12'),
(2, 0, 'Pending', 'tes', 'tes@yahoo.com', '7446716e86b7c4984b6244a1a5b49a57a1009b4d', '09123132123', '123123', '2019-03-30 07:48:59', '2019-03-30 06:48:59'),
(3, 0, 'Pending', 'asdasd', 'asdasdasd@yahoo.com', '88ea39439e74fa27c09a4fc0bc8ebe6d00978392', '123123123', 'asfdasdasdasd', '2019-03-30 07:49:41', '2019-03-30 06:49:41'),
(4, 0, 'Pending', 'fajar', 'fajar@yahoo.com', '7c222fb2927d828af22f592134e8932480637c0d', '085770859752', 'Peasdasdasdasd', '2019-03-30 11:44:08', '2019-03-30 10:44:08'),
(5, 0, 'Pending', 'yoayo', 'kamubisa@yahoo.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '085770859752', 'Perum Pangulah Permai', '2019-03-31 04:55:34', '2019-03-31 02:55:34'),
(7, 0, 'Pending', 'Harun Ar-Rashid', 'harun_arrashid14@yahoo.com', 'b44de8230db52885ce22430770fc4e810c2c2257', '085770851112', 'Perum Pangulah Permai Blok B.2 No.16 RT03 RW09, Desa Pangulah Selatan, Kec. Kotabaru, Kab. Karawang', '2019-04-03 05:37:55', '2019-07-16 02:03:39'),
(8, 0, 'Pending', 'Mba Windi doang', 'windi@gmail.com', 'b44de8230db52885ce22430770fc4e810c2c2257', '086734511', 'Perum Kotabaru PErmai', '2019-07-06 02:20:16', '2019-08-18 06:47:28'),
(9, 0, 'Pending', 'Difa', 'difablank@gmail.com', '8486bbae87fcaf3b7c5ae355e0801118b1b1665b', '089676948548', 'cikampek', '2019-07-09 07:56:02', '2019-07-09 05:56:02'),
(10, 0, 'Pending', 'heykamu', 'heykamu@yahoo.com', '1b9faaf1f3dac6a8d82a26f3469f70a1288136e2', '01284828314', 'fdsfwer', '2019-08-18 08:50:15', '2019-08-18 06:50:15'),
(11, 0, 'Pending', 'tes', 'tes1@yahoo.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '23432', 'asdasd', '2019-08-18 08:51:56', '2019-08-18 06:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kode_produk` varchar(20) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `slug_produk` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `keywords` text DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `berat` float DEFAULT NULL,
  `ukuran` varchar(255) DEFAULT NULL,
  `status_produk` varchar(20) NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_user`, `id_kategori`, `kode_produk`, `nama_produk`, `slug_produk`, `keterangan`, `keywords`, `harga`, `stok`, `gambar`, `berat`, `ukuran`, `status_produk`, `tanggal_post`, `tanggal_update`) VALUES
(13, 1, 9, 'MCS16', 'M-Card Sandisk 16GB', 'm-card-sandisk-16gb-mcs16', '<p>Ready</p>\r\n', 'Sandisk 16Gb', 65000, 10, '10__Sandik_16gb_55rb1.jpg', 111, '10x10', 'Publish', '2019-03-18 05:03:01', '2019-07-05 23:57:35'),
(14, 1, 7, 'KDV', 'Kabel Data Vivan ', 'kabel-data-vivan-kdv', '<p>Ready Warna apa aja</p>\r\n', 'Kabel Data Vivan', 15000, 53, '9__Kabel_data_Vivan_15rb.png', 1, '10cm', 'Publish', '2019-03-18 05:04:09', '2019-07-05 23:56:06'),
(15, 1, 5, 'TGXRN7', 'TG Xiaomi Redmi Note 7', 'tg-xiaomi-redmi-note-7-tgxrn7', '<p>Anti Gores</p>\r\n', 'TG Xiaomi Redmi Note 7', 15000, 85, '8__tg_Redmi_note7.jpg', 500, '10x10', 'Publish', '2019-03-18 05:05:28', '2019-07-05 23:54:12'),
(16, 1, 5, 'TGXM8', 'TG Xiaomi Mi8', 'tg-xiaomi-mi8-tgxm8', '<p>Anti Gores</p>\r\n', 'TG Xiaomi Mi8', 15000, 3, '7__TG_Xiaomi_Mi8.png', 100, '5cm', 'Publish', '2019-03-18 05:07:03', '2019-07-05 23:52:56'),
(18, 2, 4, 'SCR4B', 'Iron Case Xiaomi Redmi 4X Biru', 'iron-case-xiaomi-redmi-4x-biru-scr4b', '<p>Ready</p>\r\n', 'Iron Case Redmi 4X Biru', 35000, 4, 'IMG-20190721-WA0023.jpg', 0, '-', 'Publish', '2019-03-18 05:10:40', '2019-07-22 05:58:17'),
(19, 1, 6, 'PBX10', 'Power Bank Xiaomi 10.000mAh', 'power-bank-xiaomi-10000mah-pbx10', '<p>Power Bank</p>\r\n', 'PB Xiaomi', 170000, 101, '1__pb_xiaomi_10rb_mah,_150rb.jpg', 1000, '10x123', 'Publish', '2019-03-18 05:12:18', '2019-07-05 23:41:18'),
(20, 2, 4, 'ICR41', 'Iron Case Xiaomi Redmi 4X Cream', 'iron-case-xiaomi-redmi-4x-cream-icr41', '<p>Iron Case</p>\r\n', 'Iron Case Redmi 4X', 35000, 2, 'IMG-20190721-WA00244.jpg', 0, '-', 'Publish', '2019-03-18 05:13:32', '2019-07-22 06:55:29'),
(21, 2, 6, 'PBR10', 'Power Bank ROBOT 10.000mAH', 'power-bank-robot-10000mah-pbr10', '<p>Ready Power Bank ROBOT dengan kapasitas 10rb mAh Hanya di Suzaki Cell</p>\r\n', 'Power Bank ROBOT 10.000mAH', 180000, 5, 'IMG-20190721-WA0054.jpg', 0, '-', 'Publish', '2019-07-06 01:44:19', '2019-07-22 06:46:18'),
(22, 2, 4, 'ICXR4', 'Iron Case Xiaomi Redmi 4X MAroon', 'iron-case-xiaomi-redmi-4x-maroon-icxr4', '<p>Ready</p>\r\n', 'Softcase Iron Case Redmi 4X', 35000, 10, 'IMG-20190721-WA0022.jpg', 0, '-', 'Publish', '2019-07-06 01:46:10', '2019-07-22 05:56:26'),
(24, 1, 9, 'MCV17', 'M-Card V-Gen 16GB', 'm-card-v-gen-16gb-mcv17', '<p>Ready</p>\r\n', 'a', 57000, 100, '11__vgen_16gb_49rb1.jpg', 111, '1000', 'Publish', '2019-07-06 01:59:32', '2019-07-05 23:59:32'),
(25, 2, 8, 'EPRRE', 'Earphone Robot RE 101', 'earphone-robot-re-101-eprre', '<p>Earphone Murah Berkualitas... Ready Hanya di Suzaki Cell</p>\r\n', 'Earphone Robot RE 101', 25000, 5, 'IMG-20190721-WA0061.jpg', 0, '-', 'Publish', '2019-07-16 09:17:36', '2019-07-22 06:33:48'),
(26, 1, 8, 'EPXPG', 'EarPhone Xiaomi MI PISTON GEN 4', 'earphone-xiaomi-mi-piston-gen-4-epxpg', '<p>Ready Gan...</p>\r\n', 'EarPhone Xiaomi MI PISTON GEN 3 ', 35000, 4, 'IMG-20190721-WA0063.jpg', 0, '-', 'Publish', '2019-07-16 09:19:24', '2019-07-22 07:16:38'),
(27, 1, 9, 'MCV32', 'Memory V-Gen 32GB', 'memory-v-gen-32gb-mcv32', '<p>Ready</p>\r\n', 'Memory V-Gen 32GB', 75000, 4, 'IMG-20190721-WA0053.jpg', 0, '-', 'Publish', '2019-07-22 03:08:21', '2019-07-22 01:08:21'),
(29, 1, 4, 'SCA3S', 'Oppo A3S One Piece', 'oppo-a3s-one-piece-sca3s', '<p>Ready</p>\r\n', '', 25000, 3, 'IMG-20190721-WA0025.jpg', 0, '-', 'Publish', '2019-07-22 23:55:57', '2019-07-24 06:30:34'),
(31, 1, 4, 'XMN4X', 'Xiaomi Mi Note 4X', 'xiaomi-mi-note-4x-xmn4x', '<p>Ready</p>\r\n', 'Xiaomi Mi Note $x', 25000, 3, 'IMG-20190721-WA0027.jpg', 0, '-', 'Publish', '2019-07-23 00:06:24', '2019-07-24 10:32:06'),
(32, 1, 4, 'SCOSID', 'Oppo F9 SID', 'oppo-f9-sid-scosid', '<p>- Ready...</p>\r\n', 'Oppo F9 Rossi', 25000, 3, 'IMG-20190721-WA0030.jpg', 0, '-', 'Publish', '2019-07-23 01:53:05', '2019-07-24 10:34:09'),
(33, 1, 4, 'SCOF9R', 'Softcase Oppo F9 ', 'softcase-oppo-f9-scof9r', '<p>Ready Gann...</p>\r\n', 'Sofcase Oppo F9', 25000, 4, 'IMG-20190721-WA00291.jpg', 0, '-', 'Publish', '2019-07-23 01:55:44', '2019-07-22 23:55:44'),
(34, 1, 4, 'SCV91', 'Softcase VIVO Y91', 'softcase-vivo-y91-scv91', '<p>Ready..</p>\r\n', 'Softcase VIVO Y91', 25000, 4, 'IMG-20190721-WA0033.jpg', 0, '-', 'Publish', '2019-07-23 02:00:04', '2019-07-24 10:31:18'),
(35, 1, 4, 'SCVY91', 'Softcase VIVO Y91', 'softcase-vivo-y91-scvy91', '<p>Ready...</p>\r\n', 'Softcase VIVO Y91', 25000, 4, 'IMG-20190721-WA0034.jpg', 0, '-', 'Publish', '2019-07-23 02:02:11', '2019-07-23 00:02:11'),
(36, 1, 4, 'SCY91', 'Softcase VIVO Y91', 'softcase-vivo-y91-scy91', '<p>Ready Gan..</p>\r\n', 'Softcase VIVO Y91', 25000, 10, 'IMG-20190721-WA0035.jpg', 0, '-', 'Publish', '2019-07-23 02:03:35', '2019-07-23 00:03:35'),
(37, 1, 4, 'XRD5A ', 'Xiaomi Redmi 5A', 'xiaomi-redmi-5a-xrd5a', '<p>Ready....</p>\r\n', 'Xiaomi Redmi 5A', 25000, 4, 'IMG-20190721-WA0037.jpg', 0, '-', 'Publish', '2019-07-23 02:16:55', '2019-07-23 00:16:55'),
(38, 1, 4, 'SCXR5', 'Softcase Xiaomi Redmi 5A Bebek', 'softcase-xiaomi-redmi-5a-bebek-scxr5', '<p>Ready Gan..</p>\r\n', 'Softcase Xiaomi Redmi 5A Bebek', 25000, 4, 'IMG-20190721-WA0038.jpg', 0, '-', 'Publish', '2019-07-23 02:19:15', '2019-07-24 06:31:20'),
(39, 1, 6, 'PBDC9', 'Power Bank DellCell 9000mAh', 'power-bank-dellcell-9000mah-pbdc9', '<p>Ready..</p>\r\n', 'Power Bank DellCell 9000mAh', 100000, 4, 'IMG-20190721-WA0062.jpg', 0, '-', 'Publish', '2019-07-23 02:21:57', '2019-07-23 00:21:57'),
(40, 1, 6, 'PBDC10', 'Power Bank DellCell 10.000mAh', 'power-bank-dellcell-10000mah-pbdc10', '<p>Ready</p>\r\n', 'Power Bank DellCell 10.000mAh', 120000, 2, 'IMG-20190721-WA0060.jpg', 0, '-', 'Publish', '2019-07-23 02:36:16', '2019-07-23 00:36:16'),
(41, 1, 8, 'EPR11', 'Earphone Oppo R11', 'earphone-oppo-r11-epr11', '<p>Ready....</p>\r\n', 'Earphone Oppo R11', 25000, 4, 'IMG-20190721-WA0059.jpg', 0, '-', 'Publish', '2019-07-23 02:41:50', '2019-07-23 00:41:50'),
(42, 1, 6, 'PBR6K', 'Power Bank Robot 6600mAh', 'power-bank-robot-6600mah-pbr6k', '<p>Ready</p>\r\n', 'Power Bank Robot 6600mAh', 120000, 4, 'IMG-20190721-WA0058.jpg', 0, '-', 'Publish', '2019-07-23 03:11:39', '2019-07-23 01:11:39'),
(43, 1, 8, 'RE501', 'Earphone Robot RE501', 'earphone-robot-re501-re501', '<p>Ready..</p>\r\n', 'Earphone Robot RE501', 50000, 4, 'IMG-20190721-WA0056.jpg', 0, '-', 'Publish', '2019-07-23 03:18:06', '2019-07-23 01:18:06'),
(44, 1, 6, 'PBR100', 'Power Bank Robot 10.000mAh', 'power-bank-robot-10000mah-pbr100', '<p>Ready...a</p>\r\n', 'Power Bank Robot 10.000mAh', 180000, 3, 'IMG-20190721-WA00541.jpg', 0, '-', 'Publish', '2019-07-23 03:26:02', '2019-07-24 06:29:35'),
(45, 1, 7, 'KDVM', 'Kabel Data Vivan Merah', 'kabel-data-vivan-merah-kdvm', '<p>Ready...</p>\r\n', 'Kabel Data Vivan', 15000, 7, 'IMG-20190721-WA00431.jpg', 0, '-', 'Publish', '2019-07-24 08:07:48', '2019-07-24 06:07:48'),
(46, 1, 7, 'KDVH', 'Kabel Data Vivan Hijau', 'kabel-data-vivan-hijau-kdvh', '<p>Ready</p>\r\n', 'Kabel Data Vivan Hijau', 15000, 8, 'IMG-20190721-WA00411.jpg', 0, '-', 'Publish', '2019-07-24 08:09:34', '2019-07-24 06:09:34'),
(47, 1, 7, 'KDVO', 'Kabel Data Vivan Oren', 'kabel-data-vivan-oren-kdvo', '<p>Ready</p>\r\n', 'Kabel Data Vivan Oren', 15000, 7, 'IMG-20190721-WA00441.jpg', 0, '-', 'Publish', '2019-07-24 08:10:46', '2019-07-24 06:10:46'),
(48, 1, 7, 'KDVB', 'Kabel Data Vivan Biru', 'kabel-data-vivan-biru-kdvb', '<h2 style=\"font-style:italic;\">Ready Gan... Order Saja</h2>\r\n', 'Kabel Data Vivan Biru', 15000, 7, 'IMG-20190721-WA00421.jpg', 0, '-', 'Publish', '2019-07-24 08:21:42', '2019-07-24 06:21:42'),
(49, 1, 9, 'MCS32', 'Memory Card Sandisk 32GB', 'memory-card-sandisk-32gb-mcs32', '<p>Ready</p>\r\n', '-', 80000, 4, 'IMG-20190721-WA0050.jpg', 0, '-', 'Publish', '2019-07-24 08:33:11', '2019-07-24 06:33:11'),
(50, 2, 9, 'tes1234', 'TEs', 'tes-tes1234', '<p>Hey</p>\r\n', 'Tes', 200000, 1, 'Untitled.png', 10, '100', 'Publish', '2019-08-18 08:45:42', '2019-08-18 06:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` int(11) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `nomor_rekening` varchar(20) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal_post` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`id_rekening`, `nama_bank`, `nomor_rekening`, `nama_pemilik`, `gambar`, `tanggal_post`) VALUES
(1, 'Bank BCA', '746282637', 'Cahyo Handoko', NULL, '2019-07-12 10:19:06'),
(3, 'Bank Mandiri', '5412345234', 'Cahyo Handoko', NULL, '2019-07-12 10:18:41'),
(4, 'Bank BNI', '4123945718', 'Cahyo Handoko', NULL, '2019-07-21 03:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_pelanggan`, `kode_transaksi`, `id_produk`, `harga`, `jumlah`, `total_harga`, `tanggal_transaksi`, `tanggal_update`) VALUES
(13, 0, 7, '26042019NQVJUZAR', 20, 45000, 2, 90000, '2019-04-26 00:00:00', '2019-04-26 13:22:54'),
(14, 0, 7, '26042019NQVJUZAR', 19, 25000, 5, 125000, '2019-04-26 00:00:00', '2019-04-26 13:22:54'),
(15, 0, 7, '26042019NQVJUZAR', 18, 5000, 1, 5000, '2019-04-26 00:00:00', '2019-04-26 13:22:54'),
(16, 0, 7, '26042019NQVJUZAR', 15, 23000, 1, 23000, '2019-04-26 00:00:00', '2019-04-26 13:22:54'),
(17, 0, 7, '26042019NQVJUZAR', 16, 500, 1, 500, '2019-04-26 00:00:00', '2019-04-26 13:22:54'),
(18, 0, 7, '27042019X34PYTSK', 18, 5000, 2, 10000, '2019-04-27 00:00:00', '2019-04-27 01:14:02'),
(19, 0, 7, '27042019X34PYTSK', 19, 25000, 2, 50000, '2019-04-27 00:00:00', '2019-04-27 01:14:02'),
(20, 0, 7, '27042019X34PYTSK', 20, 45000, 1, 45000, '2019-04-27 00:00:00', '2019-04-27 01:14:02'),
(21, 0, 7, '08052019KTYQGN5F', 18, 5000, 3, 15000, '2019-05-08 00:00:00', '2019-05-08 03:41:55'),
(22, 0, 7, '08052019KTYQGN5F', 17, 25000, 2, 50000, '2019-05-08 00:00:00', '2019-05-08 03:41:55'),
(23, 0, 7, '08052019KTYQGN5F', 19, 25000, 1, 25000, '2019-05-08 00:00:00', '2019-05-08 03:41:55'),
(24, 0, 7, '08052019KTYQGN5F', 20, 45000, 2, 90000, '2019-05-08 00:00:00', '2019-05-08 03:41:55'),
(25, 0, 7, '04072019BL3CMVLH', 18, 5000, 1, 5000, '2019-07-04 00:00:00', '2019-07-04 02:07:29'),
(26, 0, 7, '04072019BL3CMVLH', 17, 25000, 1, 25000, '2019-07-04 00:00:00', '2019-07-04 02:07:29'),
(27, 0, 7, '04072019BL3CMVLH', 19, 25000, 1, 25000, '2019-07-04 00:00:00', '2019-07-04 02:07:29'),
(28, 0, 7, '05072019JM1ZBFHC', 20, 45000, 1, 45000, '2019-07-05 00:00:00', '2019-07-05 13:56:06'),
(29, 0, 7, '05072019JM1ZBFHC', 19, 25000, 1, 25000, '2019-07-05 00:00:00', '2019-07-05 13:56:06'),
(30, 0, 8, '06072019ZVE42ZJU', 14, 15000, 1, 15000, '2019-07-06 00:00:00', '2019-07-06 00:21:12'),
(31, 0, 8, '06072019ZVE42ZJU', 20, 25000, 1, 25000, '2019-07-06 00:00:00', '2019-07-06 00:21:12'),
(32, 0, 8, '06072019ZVE42ZJU', 22, 25000, 3, 75000, '2019-07-06 00:00:00', '2019-07-06 00:21:12'),
(33, 0, 8, '06072019ZVE42ZJU', 24, 57000, 1, 57000, '2019-07-06 00:00:00', '2019-07-06 00:21:12'),
(34, 0, 8, '08072019UEK5R8R4', 22, 25000, 2, 50000, '2019-07-08 00:00:00', '2019-07-08 03:53:34'),
(35, 0, 8, '08072019UEK5R8R4', 20, 25000, 1, 25000, '2019-07-08 00:00:00', '2019-07-08 03:53:34'),
(36, 0, 8, '08072019UEK5R8R4', 21, 250000, 2, 500000, '2019-07-08 00:00:00', '2019-07-08 03:53:34'),
(37, 0, 8, '08072019UEK5R8R4', 24, 57000, 1, 57000, '2019-07-08 00:00:00', '2019-07-08 03:53:34'),
(38, 0, 9, '09072019NZSHZVX1', 16, 15000, 1, 15000, '2019-07-09 00:00:00', '2019-07-09 05:56:34'),
(39, 0, 9, '09072019ROLSXOE3', 21, 250000, 1, 250000, '2019-07-09 00:00:00', '2019-07-09 05:57:49'),
(40, 0, 7, '13072019TIUWUFP4', 20, 25000, 1, 25000, '2019-07-13 00:00:00', '2019-07-13 02:56:35'),
(41, 0, 7, '16072019DLUTZF4V', 21, 250000, 1, 250000, '2019-07-16 00:00:00', '2019-07-16 02:17:17'),
(42, 0, 7, '16072019DLUTZF4V', 20, 25000, 1, 25000, '2019-07-16 00:00:00', '2019-07-16 02:17:17'),
(43, 0, 7, '16072019DLUTZF4V', 13, 65000, 1, 65000, '2019-07-16 00:00:00', '2019-07-16 02:17:17'),
(44, 0, 7, '16072019HYXS7BMO', 19, 170000, 1, 170000, '2019-07-16 00:00:00', '2019-07-16 07:46:08'),
(45, 0, 7, '16072019HYXS7BMO', 26, 50000, 1, 50000, '2019-07-16 00:00:00', '2019-07-16 07:46:08'),
(46, 0, 7, '16072019HYXS7BMO', 16, 15000, 2, 30000, '2019-07-16 00:00:00', '2019-07-16 07:46:08'),
(47, 0, 7, '23072019YLANOGN7', 28, 35000, 1, 35000, '2019-07-23 00:00:00', '2019-07-23 01:23:00'),
(48, 0, 7, '23072019YLANOGN7', 43, 50000, 1, 50000, '2019-07-23 00:00:00', '2019-07-23 01:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `akses_level` varchar(20) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `username`, `password`, `akses_level`, `tanggal_update`) VALUES
(1, 'Harun Ar-Rasyid', 'harun_arrashid@gmail.com', 'harun', 'bf73d5c5b0e7c0ee0251a3faa3d2b8e5a316ad85', 'Admin', '2019-07-12 11:34:54'),
(2, 'Cahyo Handoko', 'cahyo_handoko@yahoo.com', 'cahyo', '1b9faaf1f3dac6a8d82a26f3469f70a1288136e2', 'Admin', '2019-07-12 11:37:51'),
(3, 'farid', 'farid@yahoo.com', 'farid', '1b9faaf1f3dac6a8d82a26f3469f70a1288136e2', 'Admin', '2019-08-18 06:44:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indexes for table `header_transaksi`
--
ALTER TABLE `header_transaksi`
  ADD PRIMARY KEY (`id_header_transaksi`),
  ADD UNIQUE KEY `kode_transaksi` (`kode_transaksi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_konfigurasi`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rekening`),
  ADD UNIQUE KEY `nomor_rekening` (`nomor_rekening`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `header_transaksi`
--
ALTER TABLE `header_transaksi`
  MODIFY `id_header_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_konfigurasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
