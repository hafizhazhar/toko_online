-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jul 08, 2024 at 08:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `Id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `Keterangan` varchar(225) NOT NULL,
  `Kategori` varchar(60) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Stok` int(4) NOT NULL,
  `Gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`Id_brg`, `nama_brg`, `Keterangan`, `Kategori`, `Harga`, `Stok`, `Gambar`) VALUES
(1, 'Sepatu', 'Sepatu Merk All Star', 'Pakaian Pria', 300000, 8, 'SEPATU.JPEG'),
(2, 'Kamera', 'Kamera canon eos 700d', 'elektronik', 5900000, 9, 'CAMERA.JPEG'),
(3, 'Samsung Galaxy A20', 'Samsung Galaxy A20', 'Elektronik', 3400000, 27, 'HP.JPEG'),
(5, 'Pakaian', 'Pakaian Wanita', 'Pakaian Wanita', 75000, 3, 'pakaian-wanita3.jpg'),
(6, 'Pakaian', 'Pakaian Wanita', 'Pakaian Wanita', 75000, 5, 'pakaian-wanita22.jpg'),
(8, 'Sepatu Bola', 'Sepatu Bola Berkualitas Tinggi', 'Peralatan Olahraga', 400000, 30, 'peralatan3.jpg'),
(9, 'Pakaian', 'Pakaian Anak-anak usia 1-8thn', 'Pakaian Anak', 400000, 5, 'anak_anak1.jpg'),
(10, 'Pakaian', 'Pakaian Pria', 'Pakaian Pria', 120000, 3, 'pakaian_p2.jpg'),
(12, 'Pakaian', 'Pakaian Wanita', 'Pakaian Wanita', 120000, 11, 'w2.jpg'),
(13, 'Pakaian', 'Pakaian Anak-anak ', 'Pakaian Anak', 75000, 12, 'a.jpg'),
(14, 'Pakaian', 'Pakaian Anak-anak', 'Pakaian Anak', 75000, 30, 'a2.jpg'),
(15, 'Bola Basket', 'Bola Basket Berkualitas', 'Peralatan Olahraga', 400000, 5, 'p.jpg'),
(16, 'Ring Basket Portabel', 'Ring Basket Portabel ', 'Peralatan Olahraga', 700000, 5, 'p2.png'),
(25, 'jam tangan', 'jam tangan asli', 'Pakaian Pria', 120000, 5, 'jam2.jpg'),
(26, 'Pakaian', 'Pakaian Pria', 'Pakaian Pria', 120000, 30, 'Pria.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `Id_brg` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`Id_brg`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'Imam Fauzi Akmal', 'Jln.Muhammad Toha,Perbas Cibiuk Dalam Kp.Sukaluyu', '2024-06-12 14:40:00', '2024-06-13 14:40:00'),
(2, 'Budi', 'Bandung', '2024-06-14 20:30:05', '2024-06-15 20:30:05'),
(9, 'eca', 'bandung', '2024-06-16 12:37:02', '2024-06-17 12:37:02'),
(10, 'adzhar', 'Bandung', '2024-06-16 12:52:54', '2024-06-17 12:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 2, 'Kamera', 1, 5900000, ''),
(2, 1, 3, 'Samsung Galaxy A20', 1, 3400000, ''),
(9, 2, 16, 'Pakaian', 1, 120000, ''),
(10, 2, 17, 'Pakaian', 1, 120000, ''),
(11, 9, 3, 'Samsung Galaxy A20', 1, 3400000, ''),
(12, 9, 5, 'Pakaian', 1, 75000, ''),
(13, 10, 5, 'Pakaian', 1, 75000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET Stok = Stok-NEW.jumlah
    WHERE Id_brg = NEW.Id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`Id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`Id_brg`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `Id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `Id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
