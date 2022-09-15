-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2022 at 06:54 PM
-- Server version: 5.7.37-log
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlite_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan_pakai`
--

CREATE TABLE `aturan_pakai` (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kode_brng` varchar(15) NOT NULL DEFAULT '',
  `aturan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bahasa_pasien`
--

CREATE TABLE `bahasa_pasien` (
  `id` int(11) NOT NULL,
  `nama_bahasa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `bahasa_pasien`
--

INSERT INTO `bahasa_pasien` (`id`, `nama_bahasa`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `bangsal`
--

CREATE TABLE `bangsal` (
  `kd_bangsal` char(5) NOT NULL,
  `nm_bangsal` varchar(30) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bangsal`
--

INSERT INTO `bangsal` (`kd_bangsal`, `nm_bangsal`, `status`) VALUES
('-', '-', '1'),
('ANG', 'Anggrek', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `namabank` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`namabank`) VALUES
('-'),
('T');

-- --------------------------------------------------------

--
-- Table structure for table `barcode`
--

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL,
  `barcode` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `beri_obat_operasi`
--

CREATE TABLE `beri_obat_operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kd_obat` varchar(15) NOT NULL,
  `hargasatuan` double NOT NULL,
  `jumlah` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berkas_digital_perawatan`
--

CREATE TABLE `berkas_digital_perawatan` (
  `no_rawat` varchar(17) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `lokasi_file` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bidang`
--

CREATE TABLE `bidang` (
  `nama` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang`
--

INSERT INTO `bidang` (`nama`) VALUES
('-');

-- --------------------------------------------------------

--
-- Table structure for table `booking_operasi`
--

CREATE TABLE `booking_operasi` (
  `no_rawat` varchar(17) DEFAULT NULL,
  `kode_paket` varchar(15) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `status` enum('Menunggu','Proses Operasi','Selesai') DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa`
--

CREATE TABLE `booking_periksa` (
  `no_booking` varchar(17) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telp` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kd_poli` varchar(5) DEFAULT NULL,
  `tambahan_pesan` varchar(400) DEFAULT NULL,
  `status` enum('Diterima','Ditolak','Belum Dibalas') NOT NULL,
  `tanggal_booking` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa_balasan`
--

CREATE TABLE `booking_periksa_balasan` (
  `no_booking` varchar(17) NOT NULL,
  `balasan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_periksa_diterima`
--

CREATE TABLE `booking_periksa_diterima` (
  `no_booking` varchar(17) NOT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_registrasi`
--

CREATE TABLE `booking_registrasi` (
  `tanggal_booking` date DEFAULT NULL,
  `jam_booking` time DEFAULT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `tanggal_periksa` date NOT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `kd_poli` varchar(5) DEFAULT NULL,
  `no_reg` varchar(8) DEFAULT NULL,
  `kd_pj` char(3) DEFAULT NULL,
  `limit_reg` int(1) DEFAULT NULL,
  `waktu_kunjungan` datetime DEFAULT NULL,
  `status` enum('Terdaftar','Belum','Batal','Dokter Berhalangan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bpjs_prb`
--

CREATE TABLE `bpjs_prb` (
  `no_sep` varchar(40) NOT NULL,
  `prb` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_sep`
--

CREATE TABLE `bridging_sep` (
  `no_sep` varchar(40) NOT NULL DEFAULT '',
  `no_rawat` varchar(17) DEFAULT NULL,
  `tglsep` date DEFAULT NULL,
  `tglrujukan` date DEFAULT NULL,
  `no_rujukan` varchar(40) DEFAULT NULL,
  `kdppkrujukan` varchar(12) DEFAULT NULL,
  `nmppkrujukan` varchar(200) DEFAULT NULL,
  `kdppkpelayanan` varchar(12) DEFAULT NULL,
  `nmppkpelayanan` varchar(200) DEFAULT NULL,
  `jnspelayanan` enum('1','2') DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `diagawal` varchar(10) DEFAULT NULL,
  `nmdiagnosaawal` varchar(400) DEFAULT NULL,
  `kdpolitujuan` varchar(15) DEFAULT NULL,
  `nmpolitujuan` varchar(50) DEFAULT NULL,
  `klsrawat` enum('1','2','3') DEFAULT NULL,
  `klsnaik` enum('','1','2','3','4','5','6','7') NOT NULL,
  `pembiayaan` enum('','1','2','3') NOT NULL,
  `pjnaikkelas` varchar(100) NOT NULL,
  `lakalantas` enum('0','1','2','3') DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `nomr` varchar(15) DEFAULT NULL,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `peserta` varchar(100) DEFAULT NULL,
  `jkel` enum('L','P') DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tglpulang` datetime DEFAULT NULL,
  `asal_rujukan` enum('1. Faskes 1','2. Faskes 2(RS)') NOT NULL,
  `eksekutif` enum('0. Tidak','1.Ya') NOT NULL,
  `cob` enum('0. Tidak','1.Ya') NOT NULL,
  `notelep` varchar(40) NOT NULL,
  `katarak` enum('0. Tidak','1.Ya') NOT NULL,
  `tglkkl` date NOT NULL,
  `keterangankkl` varchar(100) NOT NULL,
  `suplesi` enum('0. Tidak','1.Ya') NOT NULL,
  `no_sep_suplesi` varchar(40) NOT NULL,
  `kdprop` varchar(10) NOT NULL,
  `nmprop` varchar(50) NOT NULL,
  `kdkab` varchar(10) NOT NULL,
  `nmkab` varchar(50) NOT NULL,
  `kdkec` varchar(10) NOT NULL,
  `nmkec` varchar(50) NOT NULL,
  `noskdp` varchar(40) NOT NULL,
  `kddpjp` varchar(10) NOT NULL,
  `nmdpdjp` varchar(100) NOT NULL,
  `tujuankunjungan` enum('0','1','2') NOT NULL,
  `flagprosedur` enum('','0','1') NOT NULL,
  `penunjang` enum('','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `asesmenpelayanan` enum('','1','2','3','4','5') NOT NULL,
  `kddpjplayanan` varchar(10) NOT NULL,
  `nmdpjplayanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_sep_internal`
--

CREATE TABLE `bridging_sep_internal` (
  `no_sep` varchar(40) NOT NULL DEFAULT '',
  `no_rawat` varchar(17) DEFAULT NULL,
  `tglsep` date DEFAULT NULL,
  `tglrujukan` date DEFAULT NULL,
  `no_rujukan` varchar(40) DEFAULT NULL,
  `kdppkrujukan` varchar(12) DEFAULT NULL,
  `nmppkrujukan` varchar(200) DEFAULT NULL,
  `kdppkpelayanan` varchar(12) DEFAULT NULL,
  `nmppkpelayanan` varchar(200) DEFAULT NULL,
  `jnspelayanan` enum('1','2') DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `diagawal` varchar(10) DEFAULT NULL,
  `nmdiagnosaawal` varchar(400) DEFAULT NULL,
  `kdpolitujuan` varchar(15) DEFAULT NULL,
  `nmpolitujuan` varchar(50) DEFAULT NULL,
  `klsrawat` enum('1','2','3') DEFAULT NULL,
  `klsnaik` enum('','1','2','3','4','5','6','7') NOT NULL,
  `pembiayaan` enum('','1','2','3') NOT NULL,
  `pjnaikkelas` varchar(100) NOT NULL,
  `lakalantas` enum('0','1','2','3') DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `nomr` varchar(15) DEFAULT NULL,
  `nama_pasien` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `peserta` varchar(100) DEFAULT NULL,
  `jkel` enum('L','P') DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tglpulang` datetime DEFAULT NULL,
  `asal_rujukan` enum('1. Faskes 1','2. Faskes 2(RS)') NOT NULL,
  `eksekutif` enum('0. Tidak','1.Ya') NOT NULL,
  `cob` enum('0. Tidak','1.Ya') NOT NULL,
  `notelep` varchar(40) NOT NULL,
  `katarak` enum('0. Tidak','1.Ya') NOT NULL,
  `tglkkl` date NOT NULL,
  `keterangankkl` varchar(100) NOT NULL,
  `suplesi` enum('0. Tidak','1.Ya') NOT NULL,
  `no_sep_suplesi` varchar(40) NOT NULL,
  `kdprop` varchar(10) NOT NULL,
  `nmprop` varchar(50) NOT NULL,
  `kdkab` varchar(10) NOT NULL,
  `nmkab` varchar(50) NOT NULL,
  `kdkec` varchar(10) NOT NULL,
  `nmkec` varchar(50) NOT NULL,
  `noskdp` varchar(40) NOT NULL,
  `kddpjp` varchar(10) NOT NULL,
  `nmdpdjp` varchar(100) NOT NULL,
  `tujuankunjungan` enum('0','1','2') NOT NULL,
  `flagprosedur` enum('','0','1') NOT NULL,
  `penunjang` enum('','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `asesmenpelayanan` enum('','1','2','3','4','5') NOT NULL,
  `kddpjplayanan` varchar(10) NOT NULL,
  `nmdpjplayanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_surat_kontrol_bpjs`
--

CREATE TABLE `bridging_surat_kontrol_bpjs` (
  `no_sep` varchar(40) DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) NOT NULL,
  `tgl_rencana` date DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bridging_surat_pri_bpjs`
--

CREATE TABLE `bridging_surat_pri_bpjs` (
  `no_rawat` varchar(17) DEFAULT NULL,
  `no_kartu` varchar(25) DEFAULT NULL,
  `tgl_surat` date NOT NULL,
  `no_surat` varchar(40) NOT NULL,
  `tgl_rencana` date DEFAULT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL,
  `kd_poli_bpjs` varchar(15) DEFAULT NULL,
  `nm_poli_bpjs` varchar(40) DEFAULT NULL,
  `diagnosa` varchar(130) NOT NULL,
  `no_sep` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cacat_fisik`
--

CREATE TABLE `cacat_fisik` (
  `id` int(11) NOT NULL,
  `nama_cacat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cacat_fisik`
--

INSERT INTO `cacat_fisik` (`id`, `nama_cacat`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `catatan_perawatan`
--

CREATE TABLE `catatan_perawatan` (
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `no_rawat` varchar(17) DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `catatan` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `databarang`
--

CREATE TABLE `databarang` (
  `kode_brng` varchar(15) NOT NULL DEFAULT '',
  `nama_brng` varchar(80) DEFAULT NULL,
  `kode_satbesar` char(4) NOT NULL,
  `kode_sat` char(4) DEFAULT NULL,
  `letak_barang` varchar(50) DEFAULT NULL,
  `dasar` double NOT NULL,
  `h_beli` double DEFAULT NULL,
  `ralan` double DEFAULT NULL,
  `kelas1` double DEFAULT NULL,
  `kelas2` double DEFAULT NULL,
  `kelas3` double DEFAULT NULL,
  `utama` double DEFAULT NULL,
  `vip` double DEFAULT NULL,
  `vvip` double DEFAULT NULL,
  `beliluar` double DEFAULT NULL,
  `jualbebas` double DEFAULT NULL,
  `karyawan` double DEFAULT NULL,
  `stokminimal` double DEFAULT NULL,
  `kdjns` char(4) DEFAULT NULL,
  `isi` double NOT NULL,
  `kapasitas` double NOT NULL,
  `expire` date DEFAULT NULL,
  `status` enum('0','1') NOT NULL,
  `kode_industri` char(5) DEFAULT NULL,
  `kode_kategori` char(4) DEFAULT NULL,
  `kode_golongan` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databarang`
--

INSERT INTO `databarang` (`kode_brng`, `nama_brng`, `kode_satbesar`, `kode_sat`, `letak_barang`, `dasar`, `h_beli`, `ralan`, `kelas1`, `kelas2`, `kelas3`, `utama`, `vip`, `vvip`, `beliluar`, `jualbebas`, `karyawan`, `stokminimal`, `kdjns`, `isi`, `kapasitas`, `expire`, `status`, `kode_industri`, `kode_kategori`, `kode_golongan`) VALUES
('B000000001', 'Amoxicillin 500mg', '-', '-', '-', 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 0, '-', 0, 500, '2024-07-16', '1', '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `dep_id` char(4) NOT NULL,
  `nama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`dep_id`, `nama`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemberian_obat`
--

CREATE TABLE `detail_pemberian_obat` (
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kode_brng` varchar(15) NOT NULL,
  `h_beli` double DEFAULT NULL,
  `biaya_obat` double DEFAULT NULL,
  `jml` double NOT NULL,
  `embalase` double DEFAULT NULL,
  `tuslah` double DEFAULT NULL,
  `total` double NOT NULL,
  `status` enum('Ralan','Ranap') DEFAULT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa_lab`
--

CREATE TABLE `detail_periksa_lab` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `id_template` int(11) NOT NULL,
  `nilai` varchar(60) NOT NULL,
  `nilai_rujukan` varchar(30) NOT NULL,
  `keterangan` varchar(60) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_item` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_pasien`
--

CREATE TABLE `diagnosa_pasien` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_penyakit` varchar(10) NOT NULL,
  `status` enum('Ralan','Ranap') NOT NULL,
  `prioritas` tinyint(4) NOT NULL,
  `status_penyakit` enum('Lama','Baru') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(20) NOT NULL,
  `nm_dokter` varchar(50) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gol_drh` enum('A','B','O','AB','-') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `almt_tgl` varchar(60) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `kd_sps` char(5) DEFAULT NULL,
  `alumni` varchar(60) DEFAULT NULL,
  `no_ijn_praktek` varchar(40) DEFAULT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nm_dokter`, `jk`, `tmp_lahir`, `tgl_lahir`, `gol_drh`, `agama`, `almt_tgl`, `no_telp`, `stts_nikah`, `kd_sps`, `alumni`, `no_ijn_praktek`, `status`) VALUES
('DR001', 'dr. Ataaka Muhammad', 'L', 'Barabai', '2000-09-18', 'O', 'Islam', 'Barabai', '-', 'MENIKAH', 'UMUM', 'UI', '-', '1');

-- --------------------------------------------------------

--
-- Table structure for table `dpjp_ranap`
--

CREATE TABLE `dpjp_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_index`
--

CREATE TABLE `emergency_index` (
  `kode_emergency` varchar(3) NOT NULL,
  `nama_emergency` varchar(200) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_index`
--

INSERT INTO `emergency_index` (`kode_emergency`, `nama_emergency`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gambar_radiologi`
--

CREATE TABLE `gambar_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `lokasi_gambar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `golongan_barang`
--

CREATE TABLE `golongan_barang` (
  `kode` char(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `golongan_barang`
--

INSERT INTO `golongan_barang` (`kode`, `nama`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `gudangbarang`
--

CREATE TABLE `gudangbarang` (
  `kode_brng` varchar(15) NOT NULL,
  `kd_bangsal` char(5) NOT NULL DEFAULT '',
  `stok` double NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_radiologi`
--

CREATE TABLE `hasil_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `hasil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `icd9`
--

CREATE TABLE `icd9` (
  `kode` varchar(8) NOT NULL,
  `deskripsi_panjang` varchar(250) DEFAULT NULL,
  `deskripsi_pendek` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `industrifarmasi`
--

CREATE TABLE `industrifarmasi` (
  `kode_industri` char(5) NOT NULL DEFAULT '',
  `nama_industri` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kota` varchar(20) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `industrifarmasi`
--

INSERT INTO `industrifarmasi` (`kode_industri`, `nama_industri`, `alamat`, `kota`, `no_telp`) VALUES
('-', '-', '-', '-', '0');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `kd_jbtn` char(4) NOT NULL DEFAULT '',
  `nm_jbtn` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`kd_jbtn`, `nm_jbtn`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_dokter` varchar(20) NOT NULL,
  `hari_kerja` enum('SENIN','SELASA','RABU','KAMIS','JUMAT','SABTU','AKHAD') NOT NULL DEFAULT 'SENIN',
  `jam_mulai` time NOT NULL DEFAULT '00:00:00',
  `jam_selesai` time DEFAULT NULL,
  `kd_poli` char(5) DEFAULT NULL,
  `kuota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pegawai`
--

CREATE TABLE `jadwal_pegawai` (
  `id` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_tambahan`
--

CREATE TABLE `jadwal_tambahan` (
  `id` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bulan` enum('01','02','03','04','05','06','07','08','09','10','11','12') NOT NULL,
  `h1` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h2` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h3` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h4` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h5` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h6` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h7` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h8` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h9` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h10` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h11` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h12` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h13` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h14` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h15` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h16` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h17` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h18` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h19` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h20` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h21` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h22` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h23` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h24` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h25` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h26` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h27` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h28` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h29` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h30` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL,
  `h31` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jam_jaga`
--

CREATE TABLE `jam_jaga` (
  `no_id` int(11) NOT NULL,
  `dep_id` char(4) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jam_masuk`
--

CREATE TABLE `jam_masuk` (
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam_masuk`
--

INSERT INTO `jam_masuk` (`shift`, `jam_masuk`, `jam_pulang`) VALUES
('Pagi', '06:00:00', '16:00:00'),
('Pagi2', '08:00:00', '14:00:00'),
('Pagi3', '10:00:00', '17:00:00'),
('Siang', '14:00:00', '08:00:00'),
('Siang2', '14:00:00', '21:00:00'),
('Malam', '20:00:00', '02:00:00'),
('Midle Siang1', '00:00:00', '06:00:00'),
('Midle Siang3', '00:00:00', '00:00:00'),
('Midle Siang4', '04:00:00', '16:00:00'),
('Midle Malam1', '00:00:00', '06:00:00'),
('Midle Malam5', '22:00:00', '07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `kdjns` char(4) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`kdjns`, `nama`, `keterangan`) VALUES
('-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `jnj_jabatan`
--

CREATE TABLE `jnj_jabatan` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tnj` double NOT NULL,
  `indek` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jnj_jabatan`
--

INSERT INTO `jnj_jabatan` (`kode`, `nama`, `tnj`, `indek`) VALUES
('-', '-', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan`
--

CREATE TABLE `jns_perawatan` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `kd_kategori` char(5) DEFAULT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byrdr` double DEFAULT NULL,
  `total_byrpr` double DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `kd_poli` char(5) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan`
--

INSERT INTO `jns_perawatan` (`kd_jenis_prw`, `nm_perawatan`, `kd_kategori`, `material`, `bhp`, `tarif_tindakandr`, `tarif_tindakanpr`, `kso`, `menejemen`, `total_byrdr`, `total_byrpr`, `total_byrdrpr`, `kd_pj`, `kd_poli`, `status`) VALUES
('RJ001', 'Pemeriksaan rutin', '-', 0, 0, 100000, 0, 0, 0, 100000, 0, 100000, '-', '-', '1');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_inap`
--

CREATE TABLE `jns_perawatan_inap` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `kd_kategori` char(5) NOT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byrdr` double DEFAULT NULL,
  `total_byrpr` double DEFAULT NULL,
  `total_byrdrpr` double NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `kd_bangsal` char(5) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_inap`
--

INSERT INTO `jns_perawatan_inap` (`kd_jenis_prw`, `nm_perawatan`, `kd_kategori`, `material`, `bhp`, `tarif_tindakandr`, `tarif_tindakanpr`, `kso`, `menejemen`, `total_byrdr`, `total_byrpr`, `total_byrdrpr`, `kd_pj`, `kd_bangsal`, `status`, `kelas`) VALUES
('RI001', 'Pemeriksaan rutin', '-', 0, 0, 150000, 0, 0, 0, 150000, 0, 150000, '-', '-', '1', 'Kelas 1');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_lab`
--

CREATE TABLE `jns_perawatan_lab` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `bagian_rs` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byr` double DEFAULT NULL,
  `kd_pj` char(3) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL,
  `kategori` enum('PK','PA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_lab`
--

INSERT INTO `jns_perawatan_lab` (`kd_jenis_prw`, `nm_perawatan`, `bagian_rs`, `bhp`, `tarif_perujuk`, `tarif_tindakan_dokter`, `tarif_tindakan_petugas`, `kso`, `menejemen`, `total_byr`, `kd_pj`, `status`, `kelas`, `kategori`) VALUES
('LAB01', 'Pemeriksaan Darah Lengkap', 0, 0, 0, 200000, 0, 0, 0, 200000, '-', '1', 'Kelas 1', 'PK');

-- --------------------------------------------------------

--
-- Table structure for table `jns_perawatan_radiologi`
--

CREATE TABLE `jns_perawatan_radiologi` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) DEFAULT NULL,
  `bagian_rs` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `total_byr` double DEFAULT NULL,
  `kd_pj` char(3) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jns_perawatan_radiologi`
--

INSERT INTO `jns_perawatan_radiologi` (`kd_jenis_prw`, `nm_perawatan`, `bagian_rs`, `bhp`, `tarif_perujuk`, `tarif_tindakan_dokter`, `tarif_tindakan_petugas`, `kso`, `menejemen`, `total_byr`, `kd_pj`, `status`, `kelas`) VALUES
('RAD001', 'Thorax', 0, 0, 0, 50000, 0, 0, 0, 50000, '-', '1', 'Kelas 1');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `kd_kab` int(11) NOT NULL,
  `nm_kab` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`kd_kab`, `nm_kab`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `kd_kamar` varchar(15) NOT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `trf_kamar` double DEFAULT NULL,
  `status` enum('ISI','KOSONG','DIBERSIHKAN','DIBOOKING') DEFAULT NULL,
  `kelas` enum('Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') DEFAULT NULL,
  `statusdata` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`kd_kamar`, `kd_bangsal`, `trf_kamar`, `status`, `kelas`, `statusdata`) VALUES
('ANG01', 'ANG', 100000, 'KOSONG', 'Kelas 1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kamar_inap`
--

CREATE TABLE `kamar_inap` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_kamar` varchar(15) NOT NULL,
  `trf_kamar` double DEFAULT NULL,
  `diagnosa_awal` varchar(100) DEFAULT NULL,
  `diagnosa_akhir` varchar(100) DEFAULT NULL,
  `tgl_masuk` date NOT NULL DEFAULT '0000-00-00',
  `jam_masuk` time NOT NULL DEFAULT '00:00:00',
  `tgl_keluar` date DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `lama` double DEFAULT NULL,
  `ttl_biaya` double DEFAULT NULL,
  `stts_pulang` enum('Sehat','Rujuk','APS','+','Meninggal','Sembuh','Membaik','Pulang Paksa','-','Pindah Kamar','Status Belum Lengkap','Atas Persetujuan Dokter','Atas Permintaan Sendiri','Lain-lain') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kode` char(4) NOT NULL,
  `nama` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`kode`, `nama`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_penyakit`
--

CREATE TABLE `kategori_penyakit` (
  `kd_ktg` varchar(8) NOT NULL,
  `nm_kategori` varchar(30) DEFAULT NULL,
  `ciri_umum` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_penyakit`
--

INSERT INTO `kategori_penyakit` (`kd_ktg`, `nm_kategori`, `ciri_umum`) VALUES
('-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_perawatan`
--

CREATE TABLE `kategori_perawatan` (
  `kd_kategori` char(5) NOT NULL,
  `nm_kategori` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_perawatan`
--

INSERT INTO `kategori_perawatan` (`kd_kategori`, `nm_kategori`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kd_kec` int(11) NOT NULL,
  `nm_kec` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`kd_kec`, `nm_kec`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_jabatan`
--

CREATE TABLE `kelompok_jabatan` (
  `kode_kelompok` varchar(3) NOT NULL,
  `nama_kelompok` varchar(100) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok_jabatan`
--

INSERT INTO `kelompok_jabatan` (`kode_kelompok`, `nama_kelompok`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `kd_kel` varchar(11) NOT NULL,
  `nm_kel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`kd_kel`, `nm_kel`) VALUES
('1', '-');

-- --------------------------------------------------------

--
-- Table structure for table `kodesatuan`
--

CREATE TABLE `kodesatuan` (
  `kode_sat` char(4) NOT NULL,
  `satuan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kodesatuan`
--

INSERT INTO `kodesatuan` (`kode_sat`, `satuan`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_operasi`
--

CREATE TABLE `laporan_operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tanggal` datetime NOT NULL,
  `diagnosa_preop` varchar(100) NOT NULL,
  `diagnosa_postop` varchar(100) NOT NULL,
  `jaringan_dieksekusi` varchar(100) NOT NULL,
  `selesaioperasi` datetime NOT NULL,
  `permintaan_pa` enum('Ya','Tidak') NOT NULL,
  `laporan_operasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maping_dokter_dpjpvclaim`
--

CREATE TABLE `maping_dokter_dpjpvclaim` (
  `kd_dokter` varchar(20) NOT NULL,
  `kd_dokter_bpjs` varchar(20) DEFAULT NULL,
  `nm_dokter_bpjs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `maping_poli_bpjs`
--

CREATE TABLE `maping_poli_bpjs` (
  `kd_poli_rs` varchar(5) NOT NULL,
  `kd_poli_bpjs` varchar(15) NOT NULL,
  `nm_poli_bpjs` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_aturan_pakai`
--

CREATE TABLE `master_aturan_pakai` (
  `aturan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_aturan_pakai`
--

INSERT INTO `master_aturan_pakai` (`aturan`) VALUES
('3 x 1 Sehari');

-- --------------------------------------------------------

--
-- Table structure for table `master_berkas_digital`
--

CREATE TABLE `master_berkas_digital` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `metode_racik`
--

CREATE TABLE `metode_racik` (
  `kd_racik` varchar(3) NOT NULL,
  `nm_racik` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_racik`
--

INSERT INTO `metode_racik` (`kd_racik`, `nm_racik`) VALUES
('1', 'Puyer');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_akun_kegiatan`
--

CREATE TABLE `mlite_akun_kegiatan` (
  `id` int(11) NOT NULL,
  `kegiatan` varchar(200) DEFAULT NULL,
  `kd_rek` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_loket`
--

CREATE TABLE `mlite_antrian_loket` (
  `kd` int(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `noantrian` varchar(50) NOT NULL,
  `no_rkm_medis` varchar(50) DEFAULT NULL,
  `postdate` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL DEFAULT '00:00:00',
  `status` varchar(10) NOT NULL DEFAULT '0',
  `loket` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi`
--

CREATE TABLE `mlite_antrian_referensi` (
  `tanggal_periksa` date NOT NULL,
  `nomor_kartu` varchar(50) NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `kodebooking` varchar(100) NOT NULL,
  `jenis_kunjungan` varchar(10) NOT NULL,
  `status_kirim` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi_batal`
--

CREATE TABLE `mlite_antrian_referensi_batal` (
  `tanggal_batal` date NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `kodebooking` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_antrian_referensi_taskid`
--

CREATE TABLE `mlite_antrian_referensi_taskid` (
  `tanggal_periksa` date NOT NULL,
  `nomor_referensi` varchar(50) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `waktu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_apamregister`
--

CREATE TABLE `mlite_apamregister` (
  `nama_lengkap` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `nomor_ktp` varchar(225) NOT NULL,
  `nomor_telepon` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_billing`
--

CREATE TABLE `mlite_billing` (
  `id_billing` int(11) NOT NULL,
  `kd_billing` varchar(100) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `jumlah_total` int(100) NOT NULL,
  `potongan` int(100) NOT NULL,
  `jumlah_harus_bayar` int(100) NOT NULL,
  `jumlah_bayar` int(100) NOT NULL,
  `tgl_billing` date NOT NULL,
  `jam_billing` time NOT NULL,
  `id_user` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_detailjurnal`
--

CREATE TABLE `mlite_detailjurnal` (
  `no_jurnal` varchar(20) DEFAULT NULL,
  `kd_rek` varchar(15) DEFAULT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_duitku`
--

CREATE TABLE `mlite_duitku` (
  `id` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `paymentUrl` varchar(255) NOT NULL,
  `merchantCode` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `vaNumber` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `statusCode` varchar(255) NOT NULL,
  `statusMessage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_geolocation_presensi`
--

CREATE TABLE `mlite_geolocation_presensi` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `latitude` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_jurnal`
--

CREATE TABLE `mlite_jurnal` (
  `no_jurnal` varchar(20) NOT NULL,
  `no_bukti` varchar(20) DEFAULT NULL,
  `tgl_jurnal` date DEFAULT NULL,
  `jenis` enum('U','P') DEFAULT NULL,
  `keterangan` varchar(350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_login_attempts`
--

CREATE TABLE `mlite_login_attempts` (
  `ip` text,
  `attempts` int(100) NOT NULL,
  `expires` int(100) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_login_attempts`
--

INSERT INTO `mlite_login_attempts` (`ip`, `attempts`, `expires`) VALUES
('127.0.0.1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mlite_modules`
--

CREATE TABLE `mlite_modules` (
  `id` int(11) NOT NULL,
  `dir` text,
  `sequence` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_modules`
--

INSERT INTO `mlite_modules` (`id`, `dir`, `sequence`) VALUES
(1, 'settings', '9'),
(2, 'dashboard', '0'),
(3, 'master', '1'),
(4, 'pasien', '2'),
(5, 'rawat_jalan', '3'),
(6, 'kasir_rawat_jalan', '4'),
(7, 'kepegawaian', '5'),
(8, 'farmasi', '6'),
(9, 'users', '8'),
(10, 'modules', '7'),
(11, 'wagateway', '10'),
(12, 'igd', '11'),
(13, 'apotek_ralan', '12'),
(14, 'dokter_ralan', '13'),
(15, 'laboratorium', '14'),
(16, 'radiologi', '15'),
(17, 'icd', '16'),
(18, 'presensi', '17'),
(19, 'profil', '18'),
(20, 'rawat_inap', '19'),
(21, 'dokter_igd', '20'),
(22, 'dokter_ranap', '21'),
(23, 'operasi', '22'),
(24, 'anjungan', '23'),
(25, 'api', '24'),
(26, 'jkn_mobile_v2', '25'),
(27, 'cuti', '26'),
(28, 'kasir_rawat_inap', '27'),
(29, 'keuangan', '28'),
(30, 'laporan', '29'),
(31, 'manajemen', '30'),
(32, 'pasien_galleries', '31'),
(33, 'vclaim', '32'),
(34, 'vedika', '33'),
(35, 'veronisa', '34'),
(36, 'website', '35');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_news`
--

CREATE TABLE `mlite_news` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `slug` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `intro` text,
  `cover_photo` text,
  `status` int(11) NOT NULL,
  `comments` int(11) DEFAULT '1',
  `markdown` int(11) DEFAULT '0',
  `published_at` int(11) DEFAULT '0',
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_news_tags`
--

CREATE TABLE `mlite_news_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `slug` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_news_tags_relationship`
--

CREATE TABLE `mlite_news_tags_relationship` (
  `news_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_notifications`
--

CREATE TABLE `mlite_notifications` (
  `id` int(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_rkm_medis` varchar(255) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pasien_galleries`
--

CREATE TABLE `mlite_pasien_galleries` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `slug` text NOT NULL,
  `img_per_page` varchar(50) NOT NULL DEFAULT '0',
  `sort` varchar(50) NOT NULL DEFAULT 'DESC'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pasien_galleries_items`
--

CREATE TABLE `mlite_pasien_galleries_items` (
  `id` int(11) NOT NULL,
  `gallery` varchar(50) NOT NULL,
  `src` text NOT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pengaduan`
--

CREATE TABLE `mlite_pengaduan` (
  `id` varchar(15) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_pengaduan_detail`
--

CREATE TABLE `mlite_pengaduan_detail` (
  `id` int(10) NOT NULL,
  `pengaduan_id` varchar(15) NOT NULL,
  `tanggal` datetime NOT NULL,
  `no_rkm_medis` varchar(15) NOT NULL,
  `pesan` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_rekening`
--

CREATE TABLE `mlite_rekening` (
  `kd_rek` varchar(15) NOT NULL DEFAULT '',
  `nm_rek` varchar(100) DEFAULT NULL,
  `tipe` enum('N','M','R') DEFAULT NULL,
  `balance` enum('D','K') DEFAULT NULL,
  `level` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_rekeningtahun`
--

CREATE TABLE `mlite_rekeningtahun` (
  `thn` year(4) NOT NULL,
  `kd_rek` varchar(15) NOT NULL DEFAULT '',
  `saldo_awal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_remember_me`
--

CREATE TABLE `mlite_remember_me` (
  `id` int(11) NOT NULL,
  `token` text,
  `user_id` int(10) NOT NULL,
  `expiry` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_settings`
--

CREATE TABLE `mlite_settings` (
  `id` int(11) NOT NULL,
  `module` text,
  `field` text,
  `value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_settings`
--

INSERT INTO `mlite_settings` (`id`, `module`, `field`, `value`) VALUES
(1, 'settings', 'logo', 'uploads/settings/logo.png'),
(2, 'settings', 'nama_instansi', 'abcde'),
(3, 'settings', 'alamat', 'Jl. Perintis Kemerdekaan 45'),
(4, 'settings', 'kota', 'Barabai'),
(5, 'settings', 'propinsi', 'Kalimantan Selatan'),
(6, 'settings', 'nomor_telepon', '0812345678'),
(7, 'settings', 'email', 'info@mlite.id'),
(8, 'settings', 'website', 'https://mlite.id'),
(9, 'settings', 'ppk_bpjs', '-'),
(10, 'settings', 'footer', 'Copyright {?=date(\"Y\")?} &copy; . All rights reserved.'),
(11, 'settings', 'homepage', 'main'),
(12, 'settings', 'wallpaper', 'uploads/settings/wallpaper.jpg'),
(13, 'settings', 'text_color', '#ffffff'),
(14, 'settings', 'igd', 'IGDK'),
(15, 'settings', 'laboratorium', '-'),
(16, 'settings', 'pj_laboratorium', 'DR001'),
(17, 'settings', 'radiologi', '-'),
(18, 'settings', 'pj_radiologi', 'DR001'),
(19, 'settings', 'dokter_ralan_per_dokter', 'false'),
(20, 'settings', 'cekstatusbayar', 'false'),
(21, 'settings', 'ceklimit', 'false'),
(22, 'settings', 'notif_presensi', 'false'),
(23, 'settings', 'responsivevoice', 'true'),
(24, 'settings', 'BpjsApiUrl', 'https://apijkn-dev.bpjs-kesehatan.go.id/vclaim-rest-dev/'),
(25, 'settings', 'BpjsConsID', '-'),
(26, 'settings', 'BpjsSecretKey', '-'),
(27, 'settings', 'BpjsUserKey', '-'),
(28, 'settings', 'timezone', 'Asia/Makassar'),
(29, 'settings', 'theme', 'default'),
(30, 'settings', 'theme_admin', 'mlite'),
(31, 'settings', 'admin_mode', 'complex'),
(32, 'settings', 'input_kasir', 'ya'),
(33, 'settings', 'editor', 'wysiwyg'),
(34, 'settings', 'version', '2022-01-01 00:00:01'),
(35, 'settings', 'update_check', '0'),
(36, 'settings', 'update_changelog', ''),
(37, 'settings', 'update_version', '0'),
(38, 'settings', 'license', 'ffc1b55b46f3a7346c8ba28c221c28a0'),
(39, 'farmasi', 'deporalan', '-'),
(40, 'farmasi', 'igd', '-'),
(41, 'farmasi', 'deporanap', '-'),
(42, 'farmasi', 'gudang', '-'),
(43, 'wagateway', 'server', 'https://mlite.id'),
(44, 'wagateway', 'token', '0000'),
(45, 'wagateway', 'phonenumber', '6282345678'),
(46, 'presensi', 'lat', '-2.58'),
(47, 'presensi', 'lon', '115.37'),
(48, 'presensi', 'distance', '2'),
(49, 'presensi', 'helloworld', 'Jangan Lupa Bahagia; \nCara untuk memulai adalah berhenti berbicara dan mulai melakukan; \nWaktu yang hilang tidak akan pernah ditemukan lagi; \nKamu bisa membodohi semua orang, tetapi kamu tidak bisa membohongi pikiranmu; \nIni bukan tentang ide. Ini tentang mewujudkan ide; \nBekerja bukan hanya untuk mencari materi. Bekerja merupakan manfaat bagi banyak orang'),
(50, 'anjungan', 'display_poli', ''),
(51, 'anjungan', 'carabayar', ''),
(52, 'anjungan', 'antrian_loket', '1'),
(53, 'anjungan', 'antrian_cs', '2'),
(54, 'anjungan', 'panggil_loket', '1'),
(55, 'anjungan', 'panggil_loket_nomor', '1'),
(56, 'anjungan', 'panggil_cs', '1'),
(57, 'anjungan', 'panggil_cs_nomor', '1'),
(58, 'anjungan', 'panggil_cs', '1'),
(59, 'anjungan', 'panggil_cs_nomor', '1'),
(60, 'anjungan', 'text_anjungan', 'Running text anjungan pasien mandiri.....'),
(61, 'anjungan', 'text_loket', 'Running text display antrian loket.....'),
(62, 'anjungan', 'text_poli', 'Running text display antrian poliklinik.....'),
(63, 'anjungan', 'text_laboratorium', 'Running text display antrian laboratorium.....'),
(64, 'anjungan', 'text_apotek', 'Running text display antrian apotek.....'),
(65, 'anjungan', 'text_farmasi', 'Running text display antrian farmasi.....'),
(66, 'anjungan', 'vidio', 'G4im8_n0OoI'),
(67, 'api', 'apam_key', 'qtbexUAxzqO3M8dCOo2vDMFvgYjdUEdMLVo341'),
(68, 'api', 'apam_status_daftar', 'Terdaftar'),
(69, 'api', 'apam_status_dilayani', 'Anda siap dilayani'),
(70, 'api', 'apam_webappsurl', 'http://localhost/webapps/'),
(71, 'api', 'apam_normpetugas', '000001,000002'),
(72, 'api', 'apam_limit', '2'),
(73, 'api', 'apam_smtp_host', 'ssl://smtp.gmail.com'),
(74, 'api', 'apam_smtp_port', '465'),
(75, 'api', 'apam_smtp_username', ''),
(76, 'api', 'apam_smtp_password', ''),
(77, 'api', 'apam_kdpj', ''),
(78, 'api', 'apam_kdprop', ''),
(79, 'api', 'apam_kdkab', ''),
(80, 'api', 'apam_kdkec', ''),
(81, 'api', 'duitku_merchantCode', ''),
(82, 'api', 'duitku_merchantKey', ''),
(83, 'api', 'duitku_paymentAmount', ''),
(84, 'api', 'duitku_paymentMethod', ''),
(85, 'api', 'duitku_productDetails', ''),
(86, 'api', 'duitku_expiryPeriod', ''),
(87, 'api', 'duitku_kdpj', ''),
(88, 'jkn_mobile_v2', 'x_username', 'jkn'),
(89, 'jkn_mobile_v2', 'x_password', 'mobile'),
(90, 'jkn_mobile_v2', 'header_token', 'X-Token'),
(91, 'jkn_mobile_v2', 'header_username', 'X-Username'),
(92, 'jkn_mobile_v2', 'header_password', 'X-Password'),
(93, 'jkn_mobile_v2', 'BpjsConsID', ''),
(94, 'jkn_mobile_v2', 'BpjsSecretKey', ''),
(95, 'jkn_mobile_v2', 'BpjsUserKey', ''),
(96, 'jkn_mobile_v2', 'BpjsAntrianUrl', 'https://apijkn-dev.bpjs-kesehatan.go.id/antreanrs_dev/'),
(97, 'jkn_mobile_v2', 'kd_pj_bpjs', ''),
(98, 'jkn_mobile_v2', 'exclude_taskid', ''),
(99, 'jkn_mobile_v2', 'display', ''),
(100, 'jkn_mobile_v2', 'kdprop', ''),
(101, 'jkn_mobile_v2', 'kdkab', ''),
(102, 'jkn_mobile_v2', 'kdkec', ''),
(103, 'jkn_mobile_v2', 'kdkel', ''),
(104, 'jkn_mobile_v2', 'perusahaan_pasien', ''),
(105, 'jkn_mobile_v2', 'suku_bangsa', ''),
(106, 'jkn_mobile_v2', 'bahasa_pasien', ''),
(107, 'jkn_mobile_v2', 'cacat_fisik', ''),
(108, 'keuangan', 'jurnal_kasir', '0'),
(109, 'keuangan', 'akun_kredit_pendaftaran', ''),
(110, 'keuangan', 'akun_kredit_tindakan', ''),
(111, 'keuangan', 'akun_kredit_obat_bhp', ''),
(112, 'keuangan', 'akun_kredit_laboratorium', ''),
(113, 'keuangan', 'akun_kredit_radiologi', ''),
(114, 'keuangan', 'akun_kredit_tambahan_biaya', ''),
(115, 'manajemen', 'penjab_umum', 'UMU'),
(116, 'manajemen', 'penjab_bpjs', 'BPJ'),
(117, 'vedika', 'username', ''),
(118, 'vedika', 'password', ''),
(119, 'vedika', 'sep', ''),
(120, 'vedika', 'skdp', ''),
(121, 'vedika', 'operasi', ''),
(122, 'veronisa', 'username', ''),
(123, 'veronisa', 'password', ''),
(124, 'veronisa', 'obat_kronis', ''),
(125, 'website', 'perpage', '5'),
(126, 'website', 'disqus', ''),
(127, 'website', 'dateformat', 'M d, Y'),
(128, 'website', 'title', 'Berita Internal'),
(129, 'website', 'desc', '... RS Masa Gitu ...'),
(130, 'website', 'latestPostsCount', '5'),
(131, 'website', 'homepage_login', '1'),
(132, 'website', 'homepage_logo', 'website/logo.png'),
(133, 'website', 'homepage_logo_icon', 'website/icon-logo.png'),
(134, 'website', 'homepage_slider_bg', 'website/slider-bg.jpg'),
(135, 'website', 'homepage_typewriter_1', 'Medic LITE Indonesia'),
(136, 'website', 'homepage_typewriter_2', 'We Care Your Health'),
(137, 'website', 'homepage_typewriter_3', 'We are Expert!'),
(138, 'website', 'homepage_gawat_darurat', 'To save life and limb, itu adalah moto kami dalam layanan Gawat Darurat'),
(139, 'website', 'homepage_rawat_jalan_1', '8.00 – 18.00'),
(140, 'website', 'homepage_rawat_jalan_2', '8.00 – 16.00'),
(141, 'website', 'homepage_rawat_jalan_3', '8.00 – 13.00'),
(142, 'website', 'homepage_rawat_inap', 'Dengan 128 bed tersedia, 8 kamar VVIP, 24 Kelas 1, 56 Kelas 2 dan 50 Kelas 3'),
(143, 'website', 'homepage_motto', 'Melayani Dengan Hati'),
(144, 'website', 'homepage_about_title', 'MENGAPA MEMILIH KAMI'),
(145, 'website', 'homepage_about_content', '<h2>Layanan Paripurna</h2>\r\nMemberi pelayanan kesehatan yang aman, bermutu, antidiskriminasi, dan efektif dengan mengutamakan kepentingan pasien sesuai dengan standar pelayanan Rumah Sakit.\r\n\r\nDengan Misi, Mendorong peningkatan kualitas kehidupan masyarakat Indonesia dengan menyediakan solusi bisnis kesehatan yang bernilai tambah dan mengutamakan prinsip kemanusiaan dan keselamatan.'),
(146, 'website', 'homepage_about_bg', 'website/about_03.jpg'),
(147, 'website', 'homepage_about_youtube', 'T0qagA4_eVQ'),
(148, 'website', 'homepage_about_11', 'Peralatan Digital'),
(149, 'website', 'homepage_about_12', 'website/clinic_01.jpg'),
(150, 'website', 'homepage_about_21', 'Ruang Operasi Higienis'),
(151, 'website', 'homepage_about_22', 'website/clinic_02.jpg'),
(152, 'website', 'homepage_about_31', 'Spesialis Dibidangnya'),
(153, 'website', 'homepage_about_32', 'website/clinic_03.jpg'),
(154, 'website', 'homepage_about_41', 'Layanan Paripurna'),
(155, 'website', 'homepage_about_42', 'website/clinic_01.jpg'),
(156, 'website', 'homepage_services_11', 'FASILITAS PREMIUM'),
(157, 'website', 'homepage_services_12', 'Untuk memastikan bahwa Anda diberi perawatan terbaik'),
(158, 'website', 'homepage_services_13', 'website/service-icon1.png'),
(159, 'website', 'homepage_services_14', 'Terbaik Dibidangnya'),
(160, 'website', 'homepage_services_15', ''),
(161, 'website', 'homepage_services_21', 'LABORATORIUM'),
(162, 'website', 'homepage_services_22', 'Alat laboratorium terbaik untuk ketepatan diagnosa'),
(163, 'website', 'homepage_services_23', 'website/service-icon2.png'),
(164, 'website', 'homepage_services_24', 'Tekhnologi Terkini'),
(165, 'website', 'homepage_services_25', ''),
(166, 'website', 'homepage_services_31', 'DOKTER SPESIALIS'),
(167, 'website', 'homepage_services_32', 'Dilayani 35 Dokter Spesialis dan Sub Spesialis'),
(168, 'website', 'homepage_services_33', 'website/service-icon3.png'),
(169, 'website', 'homepage_services_34', 'Akurat & Rendah Radiasi'),
(170, 'website', 'homepage_services_35', ''),
(171, 'website', 'homepage_services_41', 'PERAWATAN ANAK'),
(172, 'website', 'homepage_services_42', 'Deteksi dini dan pelayanan tumbuh kembang anak'),
(173, 'website', 'homepage_services_43', 'website/service-icon4.png'),
(174, 'website', 'homepage_services_44', 'Untuk Buah Hati'),
(175, 'website', 'homepage_services_45', ''),
(176, 'website', 'homepage_services_51', 'LAYANAN FARMASI'),
(177, 'website', 'homepage_services_52', 'Memastikan ketepatan indikasi, aturan dan dosis obat'),
(178, 'website', 'homepage_services_53', 'website/service-icon5.png'),
(179, 'website', 'homepage_services_54', 'Tepat & Cepat'),
(180, 'website', 'homepage_services_55', ''),
(181, 'website', 'homepage_services_61', 'BANK DARAH'),
(182, 'website', 'homepage_services_62', 'Menjamin ketersediaan darah untuk transfusi yang aman'),
(183, 'website', 'homepage_services_63', 'website/service-icon1.png'),
(184, 'website', 'homepage_services_64', 'Aman dan Nyaman'),
(185, 'website', 'homepage_services_65', ''),
(186, 'website', 'homepage_footer_about', 'Rumah Sakit Pemerintah tipe C dengan layanan terdepan menggunakan tekhnologi terkini.'),
(187, 'website', 'homepage_footer_informasi_11', 'Jadwal Dokter'),
(188, 'website', 'homepage_footer_informasi_12', 'http://localhost/webapps/jadwal.php'),
(189, 'website', 'homepage_footer_informasi_21', 'Ketersediaan Tempat Tidur'),
(190, 'website', 'homepage_footer_informasi_22', 'http://localhost/webapps/bed5.php'),
(191, 'website', 'homepage_footer_informasi_31', 'Display Antrian'),
(192, 'website', 'homepage_footer_informasi_32', 'http://localhost/webapps/antrian.php'),
(193, 'website', 'homepage_sosmed_facebook', 'basoro'),
(194, 'website', 'homepage_sosmed_youtube', 'basoro'),
(195, 'website', 'homepage_sosmed_instagram', 'basoro');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_subrekening`
--

CREATE TABLE `mlite_subrekening` (
  `kd_rek` varchar(15) NOT NULL,
  `kd_rek2` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_temporary`
--

CREATE TABLE `mlite_temporary` (
  `temp1` text,
  `temp2` text,
  `temp3` text,
  `temp4` text,
  `temp5` text,
  `temp6` text,
  `temp7` text,
  `temp8` text,
  `temp9` text,
  `temp10` text,
  `temp11` text,
  `temp12` text,
  `temp13` text,
  `temp14` text,
  `temp15` text,
  `temp16` text,
  `temp17` text,
  `temp18` text,
  `temp19` text,
  `temp20` text,
  `temp21` text,
  `temp22` text,
  `temp23` text,
  `temp24` text,
  `temp25` text,
  `temp26` text,
  `temp27` text,
  `temp28` text,
  `temp29` text,
  `temp30` text,
  `temp31` text,
  `temp32` text,
  `temp33` text,
  `temp34` text,
  `temp35` text,
  `temp36` text,
  `temp37` text,
  `temp38` text,
  `temp39` text,
  `temp40` text,
  `temp41` text,
  `temp42` text,
  `temp43` text,
  `temp44` text,
  `temp45` text,
  `temp46` text,
  `temp47` text,
  `temp48` text,
  `temp49` text,
  `temp50` text,
  `temp51` text,
  `temp52` text,
  `temp53` text,
  `temp54` text,
  `temp55` text,
  `temp56` text,
  `temp57` text,
  `temp58` text,
  `temp59` text,
  `temp60` text,
  `temp61` text,
  `temp62` text,
  `temp63` text,
  `temp64` text,
  `temp65` text,
  `temp66` text,
  `temp67` text,
  `temp68` text,
  `temp69` text,
  `temp70` text,
  `temp71` text,
  `temp72` text,
  `temp73` text,
  `temp74` text,
  `temp75` text,
  `temp76` text,
  `temp77` text,
  `temp78` text,
  `temp79` text,
  `temp80` text,
  `temp81` text,
  `temp82` text,
  `temp83` text,
  `temp84` text,
  `temp85` text,
  `temp86` text,
  `temp87` text,
  `temp88` text,
  `temp89` text,
  `temp90` text,
  `temp91` text,
  `temp92` text,
  `temp93` text,
  `temp94` text,
  `temp95` text,
  `temp96` text,
  `temp97` text,
  `temp98` text,
  `temp99` text,
  `temp100` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_users`
--

CREATE TABLE `mlite_users` (
  `id` int(11) NOT NULL,
  `username` text,
  `fullname` text,
  `description` text,
  `password` text,
  `avatar` text,
  `email` text,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `cap` varchar(100) DEFAULT '',
  `access` varchar(500) NOT NULL DEFAULT 'dashboard'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mlite_users`
--

INSERT INTO `mlite_users` (`id`, `username`, `fullname`, `description`, `password`, `avatar`, `email`, `role`, `cap`, `access`) VALUES
(1, 'admin', 'Administrator', 'Admin ganteng baik hati, suka menabung dan tidak sombong.', '$2y$10$pgRnDiukCbiYVqsamMM3ROWViSRqbyCCL33N8.ykBKZx0dlplXe9i', 'avatar63171c1c4cd49.png', 'info@mlite.id', 'admin', '', 'all');

-- --------------------------------------------------------

--
-- Table structure for table `mlite_vedika`
--

CREATE TABLE `mlite_vedika` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `no_rkm_medis` varchar(6) NOT NULL,
  `no_rawat` varchar(100) NOT NULL,
  `tgl_registrasi` varchar(100) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_vedika_feedback`
--

CREATE TABLE `mlite_vedika_feedback` (
  `id` int(11) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `catatan` text,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mlite_veronisa`
--

CREATE TABLE `mlite_veronisa` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `no_rkm_medis` varchar(6) NOT NULL,
  `no_rawat` varchar(100) NOT NULL,
  `tgl_registrasi` varchar(100) NOT NULL,
  `nosep` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_berkas`
--

CREATE TABLE `mutasi_berkas` (
  `no_rawat` varchar(17) NOT NULL,
  `status` enum('Sudah Dikirim','Sudah Diterima','Sudah Kembali','Tidak Ada','Masuk Ranap') DEFAULT NULL,
  `dikirim` datetime DEFAULT NULL,
  `diterima` datetime DEFAULT NULL,
  `kembali` datetime DEFAULT NULL,
  `tidakada` datetime DEFAULT NULL,
  `ranap` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obatbhp_ok`
--

CREATE TABLE `obatbhp_ok` (
  `kd_obat` varchar(15) NOT NULL,
  `nm_obat` varchar(50) NOT NULL,
  `kode_sat` char(4) NOT NULL,
  `hargasatuan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operasi`
--

CREATE TABLE `operasi` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_operasi` datetime NOT NULL,
  `jenis_anasthesi` varchar(8) NOT NULL,
  `kategori` enum('-','Khusus','Besar','Sedang','Kecil','Elektive','Emergency') DEFAULT NULL,
  `operator1` varchar(20) NOT NULL,
  `operator2` varchar(20) NOT NULL,
  `operator3` varchar(20) NOT NULL,
  `asisten_operator1` varchar(20) NOT NULL,
  `asisten_operator2` varchar(20) NOT NULL,
  `asisten_operator3` varchar(20) DEFAULT NULL,
  `instrumen` varchar(20) DEFAULT NULL,
  `dokter_anak` varchar(20) NOT NULL,
  `perawaat_resusitas` varchar(20) NOT NULL,
  `dokter_anestesi` varchar(20) NOT NULL,
  `asisten_anestesi` varchar(20) NOT NULL,
  `asisten_anestesi2` varchar(20) DEFAULT NULL,
  `bidan` varchar(20) NOT NULL,
  `bidan2` varchar(20) DEFAULT NULL,
  `bidan3` varchar(20) DEFAULT NULL,
  `perawat_luar` varchar(20) NOT NULL,
  `omloop` varchar(20) DEFAULT NULL,
  `omloop2` varchar(20) DEFAULT NULL,
  `omloop3` varchar(20) DEFAULT NULL,
  `omloop4` varchar(20) DEFAULT NULL,
  `omloop5` varchar(20) DEFAULT NULL,
  `dokter_pjanak` varchar(20) DEFAULT NULL,
  `dokter_umum` varchar(20) DEFAULT NULL,
  `kode_paket` varchar(15) NOT NULL,
  `biayaoperator1` double NOT NULL,
  `biayaoperator2` double NOT NULL,
  `biayaoperator3` double NOT NULL,
  `biayaasisten_operator1` double NOT NULL,
  `biayaasisten_operator2` double NOT NULL,
  `biayaasisten_operator3` double DEFAULT NULL,
  `biayainstrumen` double DEFAULT NULL,
  `biayadokter_anak` double NOT NULL,
  `biayaperawaat_resusitas` double NOT NULL,
  `biayadokter_anestesi` double NOT NULL,
  `biayaasisten_anestesi` double NOT NULL,
  `biayaasisten_anestesi2` double DEFAULT NULL,
  `biayabidan` double NOT NULL,
  `biayabidan2` double DEFAULT NULL,
  `biayabidan3` double DEFAULT NULL,
  `biayaperawat_luar` double NOT NULL,
  `biayaalat` double NOT NULL,
  `biayasewaok` double NOT NULL,
  `akomodasi` double DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `biaya_omloop` double DEFAULT NULL,
  `biaya_omloop2` double DEFAULT NULL,
  `biaya_omloop3` double DEFAULT NULL,
  `biaya_omloop4` double DEFAULT NULL,
  `biaya_omloop5` double DEFAULT NULL,
  `biayasarpras` double DEFAULT NULL,
  `biaya_dokter_pjanak` double DEFAULT NULL,
  `biaya_dokter_umum` double DEFAULT NULL,
  `status` enum('Ranap','Ralan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `opname`
--

CREATE TABLE `opname` (
  `kode_brng` varchar(15) NOT NULL,
  `h_beli` double DEFAULT NULL,
  `tanggal` date NOT NULL,
  `stok` double NOT NULL,
  `real` double NOT NULL,
  `selisih` double NOT NULL,
  `nomihilang` double NOT NULL,
  `lebih` double NOT NULL,
  `nomilebih` double NOT NULL,
  `keterangan` varchar(60) NOT NULL,
  `kd_bangsal` char(5) NOT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paket_operasi`
--

CREATE TABLE `paket_operasi` (
  `kode_paket` varchar(15) NOT NULL,
  `nm_perawatan` varchar(80) NOT NULL,
  `kategori` enum('Kebidanan','Operasi') DEFAULT NULL,
  `operator1` double NOT NULL,
  `operator2` double NOT NULL,
  `operator3` double NOT NULL,
  `asisten_operator1` double DEFAULT NULL,
  `asisten_operator2` double NOT NULL,
  `asisten_operator3` double DEFAULT NULL,
  `instrumen` double DEFAULT NULL,
  `dokter_anak` double NOT NULL,
  `perawaat_resusitas` double NOT NULL,
  `dokter_anestesi` double NOT NULL,
  `asisten_anestesi` double NOT NULL,
  `asisten_anestesi2` double DEFAULT NULL,
  `bidan` double NOT NULL,
  `bidan2` double DEFAULT NULL,
  `bidan3` double DEFAULT NULL,
  `perawat_luar` double NOT NULL,
  `sewa_ok` double NOT NULL,
  `alat` double NOT NULL,
  `akomodasi` double DEFAULT NULL,
  `bagian_rs` double NOT NULL,
  `omloop` double NOT NULL,
  `omloop2` double DEFAULT NULL,
  `omloop3` double DEFAULT NULL,
  `omloop4` double DEFAULT NULL,
  `omloop5` double DEFAULT NULL,
  `sarpras` double DEFAULT NULL,
  `dokter_pjanak` double DEFAULT NULL,
  `dokter_umum` double DEFAULT NULL,
  `kd_pj` char(3) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `kelas` enum('-','Rawat Jalan','Kelas 1','Kelas 2','Kelas 3','Kelas Utama','Kelas VIP','Kelas VVIP') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_rkm_medis` varchar(15) NOT NULL,
  `nm_pasien` varchar(40) DEFAULT NULL,
  `no_ktp` varchar(20) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(15) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nm_ibu` varchar(40) NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') DEFAULT NULL,
  `pekerjaan` varchar(35) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `no_tlp` varchar(40) DEFAULT NULL,
  `umur` varchar(20) NOT NULL,
  `pnd` enum('TS','TK','SD','SMP','SMA','SLTA/SEDERAJAT','D1','D2','D3','D4','S1','S2','S3','-') NOT NULL,
  `keluarga` enum('AYAH','IBU','ISTRI','SUAMI','SAUDARA','ANAK') DEFAULT NULL,
  `namakeluarga` varchar(50) NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `no_peserta` varchar(25) DEFAULT NULL,
  `kd_kel` int(11) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `pekerjaanpj` varchar(35) NOT NULL,
  `alamatpj` varchar(100) NOT NULL,
  `kelurahanpj` varchar(60) NOT NULL,
  `kecamatanpj` varchar(60) NOT NULL,
  `kabupatenpj` varchar(60) NOT NULL,
  `perusahaan_pasien` varchar(8) NOT NULL,
  `suku_bangsa` int(11) NOT NULL,
  `bahasa_pasien` int(11) NOT NULL,
  `cacat_fisik` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `propinsipj` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_rkm_medis`, `nm_pasien`, `no_ktp`, `jk`, `tmp_lahir`, `tgl_lahir`, `nm_ibu`, `alamat`, `gol_darah`, `pekerjaan`, `stts_nikah`, `agama`, `tgl_daftar`, `no_tlp`, `umur`, `pnd`, `keluarga`, `namakeluarga`, `kd_pj`, `no_peserta`, `kd_kel`, `kd_kec`, `kd_kab`, `pekerjaanpj`, `alamatpj`, `kelurahanpj`, `kecamatanpj`, `kabupatenpj`, `perusahaan_pasien`, `suku_bangsa`, `bahasa_pasien`, `cacat_fisik`, `email`, `nip`, `kd_prop`, `propinsipj`) VALUES
('000001', 'SUPRIYANTO', '3571031909590005', 'L', '-', '1959-09-19', '-', 'Jl. Perintis Kemerdekaan', '-', '-', 'BELUM MENIKAH', 'ISLAM', '2022-09-06', '081250067788', '62 Th 11 Bl 17 Hr', '-', 'AYAH', '-', 'BPJ', '0001535601993', 1, 1, 1, '-', 'Jl. Perintis Kemerdekaan', '-', '-', '-', '-', 1, 1, 1, 'dentix.id@gmail.com', '-', 1, '-'),
('000002', 'AZHAR', '1174020504980003', 'L', '-', '1998-04-05', '-', 'Jl. Perintis Kemerdekaan', '-', '-', 'BELUM MENIKAH', 'ISLAM', '2022-09-06', '081250067788', '24 Th 5 Bl 1 Hr', '-', 'AYAH', '-', 'BPJ', '0002035875396', 1, 1, 1, '-', 'Jl. Perintis Kemerdekaan', '-', '-', '-', '-', 1, 1, 1, 'dentix.id@gmail.com', '-', 1, '-'),
('000003', 'RAHMATUL LAILIYAH', '3571025208960004', 'P', '-', '1996-08-01', '-', 'Jl. Perintis Kemerdekaan', '-', '-', 'BELUM MENIKAH', 'ISLAM', '2022-09-06', '081250067788', '26 Th 1 Bl 5 Hr', '-', 'AYAH', '-', 'BPJ', '0000782978411', 1, 1, 1, '-', 'Jl. Perintis Kemerdekaan', '-', '-', '-', '-', 1, 1, 1, 'dentix.id@gmail.com', '-', 1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('Pria','Wanita') NOT NULL,
  `jbtn` varchar(25) NOT NULL,
  `jnj_jabatan` varchar(5) NOT NULL,
  `kode_kelompok` varchar(3) NOT NULL,
  `kode_resiko` varchar(3) NOT NULL,
  `kode_emergency` varchar(3) NOT NULL,
  `departemen` char(4) NOT NULL,
  `bidang` varchar(15) NOT NULL,
  `stts_wp` char(5) NOT NULL,
  `stts_kerja` char(3) NOT NULL,
  `npwp` varchar(15) NOT NULL,
  `pendidikan` varchar(80) NOT NULL,
  `gapok` double NOT NULL,
  `tmp_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `mulai_kerja` date NOT NULL,
  `ms_kerja` enum('<1','PT','FT>1') NOT NULL,
  `indexins` char(4) NOT NULL,
  `bpd` varchar(50) NOT NULL,
  `rekening` varchar(25) NOT NULL,
  `stts_aktif` enum('AKTIF','CUTI','KELUAR','TENAGA LUAR') NOT NULL,
  `wajibmasuk` tinyint(2) NOT NULL,
  `pengurang` double NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `mulai_kontrak` date DEFAULT NULL,
  `cuti_diambil` int(11) NOT NULL,
  `dankes` double NOT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `no_ktp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nik`, `nama`, `jk`, `jbtn`, `jnj_jabatan`, `kode_kelompok`, `kode_resiko`, `kode_emergency`, `departemen`, `bidang`, `stts_wp`, `stts_kerja`, `npwp`, `pendidikan`, `gapok`, `tmp_lahir`, `tgl_lahir`, `alamat`, `kota`, `mulai_kerja`, `ms_kerja`, `indexins`, `bpd`, `rekening`, `stts_aktif`, `wajibmasuk`, `pengurang`, `indek`, `mulai_kontrak`, `cuti_diambil`, `dankes`, `photo`, `no_ktp`) VALUES
(1, 'DR001', 'dr. Ataaka Muhammad', 'Pria', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', 0, 'Barabai', '2016-06-10', '-', 'Barabai', '2019-09-18', '<1', '-', '-', '-', 'AKTIF', 0, 0, 0, '2019-09-18', 1, 0, '-', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_ralan`
--

CREATE TABLE `pemeriksaan_ralan` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `suhu_tubuh` char(5) DEFAULT NULL,
  `tensi` char(8) NOT NULL,
  `nadi` char(3) DEFAULT NULL,
  `respirasi` char(3) DEFAULT NULL,
  `tinggi` char(5) DEFAULT NULL,
  `berat` char(5) DEFAULT NULL,
  `spo2` char(3) NOT NULL,
  `gcs` varchar(10) DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') NOT NULL,
  `keluhan` varchar(400) DEFAULT NULL,
  `pemeriksaan` varchar(400) DEFAULT NULL,
  `alergi` varchar(50) DEFAULT NULL,
  `lingkar_perut` varchar(5) DEFAULT NULL,
  `rtl` varchar(400) NOT NULL,
  `penilaian` varchar(400) NOT NULL,
  `instruksi` varchar(400) NOT NULL,
  `evaluasi` varchar(400) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan_ranap`
--

CREATE TABLE `pemeriksaan_ranap` (
  `no_rawat` varchar(17) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `suhu_tubuh` char(5) DEFAULT NULL,
  `tensi` char(8) NOT NULL,
  `nadi` char(3) DEFAULT NULL,
  `respirasi` char(3) DEFAULT NULL,
  `tinggi` char(5) DEFAULT NULL,
  `berat` char(5) DEFAULT NULL,
  `spo2` char(3) NOT NULL,
  `gcs` varchar(10) DEFAULT NULL,
  `kesadaran` enum('Compos Mentis','Somnolence','Sopor','Coma') NOT NULL,
  `keluhan` varchar(400) DEFAULT NULL,
  `pemeriksaan` varchar(400) DEFAULT NULL,
  `alergi` varchar(50) DEFAULT NULL,
  `penilaian` varchar(400) NOT NULL,
  `rtl` varchar(400) NOT NULL,
  `instruksi` varchar(400) NOT NULL,
  `evaluasi` varchar(400) NOT NULL,
  `nip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `tingkat` varchar(80) NOT NULL,
  `indek` tinyint(4) NOT NULL,
  `gapok1` double NOT NULL,
  `kenaikan` double NOT NULL,
  `maksimal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`tingkat`, `indek`, `gapok1`, `kenaikan`, `maksimal`) VALUES
('-', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_cuti`
--

CREATE TABLE `pengajuan_cuti` (
  `no_pengajuan` varchar(17) NOT NULL,
  `tanggal` date NOT NULL,
  `tanggal_awal` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `nik` varchar(20) NOT NULL,
  `urgensi` enum('Tahunan','Besar','Sakit','Bersalin','Alasan Penting','Keterangan Lainnya') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kepentingan` varchar(70) NOT NULL,
  `nik_pj` varchar(20) NOT NULL,
  `status` enum('Proses Pengajuan','Disetujui','Ditolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjab`
--

CREATE TABLE `penjab` (
  `kd_pj` char(3) NOT NULL,
  `png_jawab` varchar(30) NOT NULL,
  `nama_perusahaan` varchar(60) NOT NULL,
  `alamat_asuransi` varchar(130) NOT NULL,
  `no_telp` varchar(40) NOT NULL,
  `attn` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjab`
--

INSERT INTO `penjab` (`kd_pj`, `png_jawab`, `nama_perusahaan`, `alamat_asuransi`, `no_telp`, `attn`) VALUES
('-', '-', '', '', '', ''),
('BPJ', 'BPJS Kesehatan', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `kd_penyakit` varchar(10) NOT NULL,
  `nm_penyakit` varchar(100) DEFAULT NULL,
  `ciri_ciri` text,
  `keterangan` varchar(60) DEFAULT NULL,
  `kd_ktg` varchar(8) DEFAULT NULL,
  `status` enum('Menular','Tidak Menular') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa_lab`
--

CREATE TABLE `periksa_lab` (
  `no_rawat` varchar(17) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `status` enum('Ralan','Ranap') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periksa_radiologi`
--

CREATE TABLE `periksa_radiologi` (
  `no_rawat` varchar(17) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_perujuk` double NOT NULL,
  `tarif_tindakan_dokter` double NOT NULL,
  `tarif_tindakan_petugas` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya` double NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `status` enum('Ranap','Ralan') DEFAULT NULL,
  `proyeksi` varchar(50) NOT NULL,
  `kV` varchar(10) NOT NULL,
  `mAS` varchar(10) NOT NULL,
  `FFD` varchar(10) NOT NULL,
  `BSF` varchar(10) NOT NULL,
  `inak` varchar(10) NOT NULL,
  `jml_penyinaran` varchar(10) NOT NULL,
  `dosis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_detail_permintaan_lab`
--

CREATE TABLE `permintaan_detail_permintaan_lab` (
  `noorder` varchar(16) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `id_template` int(11) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_lab`
--

CREATE TABLE `permintaan_lab` (
  `noorder` varchar(15) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `status` enum('ralan','ranap') NOT NULL,
  `informasi_tambahan` varchar(60) NOT NULL,
  `diagnosa_klinis` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_pemeriksaan_lab`
--

CREATE TABLE `permintaan_pemeriksaan_lab` (
  `noorder` varchar(15) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_pemeriksaan_radiologi`
--

CREATE TABLE `permintaan_pemeriksaan_radiologi` (
  `noorder` varchar(15) NOT NULL,
  `kd_jenis_prw` varchar(15) NOT NULL,
  `stts_bayar` enum('Sudah','Belum') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_radiologi`
--

CREATE TABLE `permintaan_radiologi` (
  `noorder` varchar(15) NOT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `jam_permintaan` time NOT NULL,
  `tgl_sampel` date NOT NULL,
  `jam_sampel` time NOT NULL,
  `tgl_hasil` date NOT NULL,
  `jam_hasil` time NOT NULL,
  `dokter_perujuk` varchar(20) NOT NULL,
  `status` enum('ralan','ranap') NOT NULL,
  `informasi_tambahan` varchar(60) NOT NULL,
  `diagnosa_klinis` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_pasien`
--

CREATE TABLE `personal_pasien` (
  `no_rkm_medis` varchar(15) NOT NULL,
  `gambar` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_pasien`
--

CREATE TABLE `perusahaan_pasien` (
  `kode_perusahaan` varchar(8) NOT NULL,
  `nama_perusahaan` varchar(70) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `kota` varchar(40) DEFAULT NULL,
  `no_telp` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan_pasien`
--

INSERT INTO `perusahaan_pasien` (`kode_perusahaan`, `nama_perusahaan`, `alamat`, `kota`, `no_telp`) VALUES
('-', '-', '-', '-', '0');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gol_darah` enum('A','B','O','AB','-') DEFAULT NULL,
  `agama` varchar(12) DEFAULT NULL,
  `stts_nikah` enum('BELUM MENIKAH','MENIKAH','JANDA','DUDHA','JOMBLO') DEFAULT NULL,
  `alamat` varchar(60) DEFAULT NULL,
  `kd_jbtn` char(4) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`nip`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `gol_darah`, `agama`, `stts_nikah`, `alamat`, `kd_jbtn`, `no_telp`, `status`) VALUES
('DR001', 'dr. Ataaka Muhammad', 'L', 'Barabai', '2020-12-01', 'A', 'Islam', 'MENIKAH', '-', '-', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `kd_poli` char(5) NOT NULL DEFAULT '',
  `nm_poli` varchar(50) DEFAULT NULL,
  `registrasi` double NOT NULL,
  `registrasilama` double NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poliklinik`
--

INSERT INTO `poliklinik` (`kd_poli`, `nm_poli`, `registrasi`, `registrasilama`, `status`) VALUES
('-', '-', 0, 0, '1'),
('IGDK', 'IGD', 0, 0, '1'),
('INT', 'Penyakit Dalam', 10000, 10000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `propinsi`
--

CREATE TABLE `propinsi` (
  `kd_prop` int(11) NOT NULL,
  `nm_prop` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propinsi`
--

INSERT INTO `propinsi` (`kd_prop`, `nm_prop`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `prosedur_pasien`
--

CREATE TABLE `prosedur_pasien` (
  `no_rawat` varchar(17) NOT NULL,
  `kode` varchar(8) NOT NULL,
  `status` enum('Ralan','Ranap') NOT NULL,
  `prioritas` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_dr`
--

CREATE TABLE `rawat_inap_dr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_drpr`
--

CREATE TABLE `rawat_inap_drpr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_pr`
--

CREATE TABLE `rawat_inap_pr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL DEFAULT '0000-00-00',
  `jam_rawat` time NOT NULL DEFAULT '00:00:00',
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_dr`
--

CREATE TABLE `rawat_jl_dr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_drpr`
--

CREATE TABLE `rawat_jl_drpr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `kd_dokter` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double DEFAULT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakandr` double DEFAULT NULL,
  `tarif_tindakanpr` double DEFAULT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jl_pr`
--

CREATE TABLE `rawat_jl_pr` (
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_jenis_prw` varchar(15) NOT NULL,
  `nip` varchar(20) NOT NULL DEFAULT '',
  `tgl_perawatan` date NOT NULL,
  `jam_rawat` time NOT NULL,
  `material` double NOT NULL,
  `bhp` double NOT NULL,
  `tarif_tindakanpr` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_rawat` double DEFAULT NULL,
  `stts_bayar` enum('Sudah','Belum','Suspen') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_periksa`
--

CREATE TABLE `reg_periksa` (
  `no_reg` varchar(8) DEFAULT NULL,
  `no_rawat` varchar(17) NOT NULL,
  `tgl_registrasi` date DEFAULT NULL,
  `jam_reg` time DEFAULT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL,
  `kd_poli` char(5) DEFAULT NULL,
  `p_jawab` varchar(100) DEFAULT NULL,
  `almt_pj` varchar(200) DEFAULT NULL,
  `hubunganpj` varchar(20) DEFAULT NULL,
  `biaya_reg` double DEFAULT NULL,
  `stts` enum('Belum','Sudah','Batal','Berkas Diterima','Dirujuk','Meninggal','Dirawat','Pulang Paksa') DEFAULT NULL,
  `stts_daftar` enum('-','Lama','Baru') NOT NULL,
  `status_lanjut` enum('Ralan','Ranap') NOT NULL,
  `kd_pj` char(3) NOT NULL,
  `umurdaftar` int(11) DEFAULT NULL,
  `sttsumur` enum('Th','Bl','Hr') DEFAULT NULL,
  `status_bayar` enum('Sudah Bayar','Belum Bayar') NOT NULL,
  `status_poli` enum('Lama','Baru') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rekap_presensi`
--

CREATE TABLE `rekap_presensi` (
  `id` int(10) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_datang` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `jam_pulang` datetime DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') NOT NULL,
  `keterlambatan` varchar(20) NOT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `keterangan` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter`
--

CREATE TABLE `resep_dokter` (
  `no_resep` varchar(14) DEFAULT NULL,
  `kode_brng` varchar(15) DEFAULT NULL,
  `jml` double DEFAULT NULL,
  `aturan_pakai` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter_racikan`
--

CREATE TABLE `resep_dokter_racikan` (
  `no_resep` varchar(14) NOT NULL,
  `no_racik` varchar(2) NOT NULL,
  `nama_racik` varchar(100) NOT NULL,
  `kd_racik` varchar(3) NOT NULL,
  `jml_dr` int(11) NOT NULL,
  `aturan_pakai` varchar(150) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_dokter_racikan_detail`
--

CREATE TABLE `resep_dokter_racikan_detail` (
  `no_resep` varchar(14) NOT NULL,
  `no_racik` varchar(2) NOT NULL,
  `kode_brng` varchar(15) NOT NULL,
  `p1` double DEFAULT NULL,
  `p2` double DEFAULT NULL,
  `kandungan` varchar(10) DEFAULT NULL,
  `jml` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `no_resep` varchar(14) NOT NULL DEFAULT '',
  `tgl_perawatan` date DEFAULT NULL,
  `jam` time NOT NULL,
  `no_rawat` varchar(17) NOT NULL DEFAULT '',
  `kd_dokter` varchar(20) NOT NULL,
  `tgl_peresepan` date DEFAULT NULL,
  `jam_peresepan` time DEFAULT NULL,
  `status` enum('ralan','ranap') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resiko_kerja`
--

CREATE TABLE `resiko_kerja` (
  `kode_resiko` varchar(3) NOT NULL,
  `nama_resiko` varchar(200) DEFAULT NULL,
  `indek` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resiko_kerja`
--

INSERT INTO `resiko_kerja` (`kode_resiko`, `nama_resiko`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_barang_medis`
--

CREATE TABLE `riwayat_barang_medis` (
  `kode_brng` varchar(15) DEFAULT NULL,
  `stok_awal` double DEFAULT NULL,
  `masuk` double DEFAULT NULL,
  `keluar` double DEFAULT NULL,
  `stok_akhir` double NOT NULL,
  `posisi` enum('Pemberian Obat','Pengadaan','Penerimaan','Piutang','Retur Beli','Retur Jual','Retur Piutang','Mutasi','Opname','Resep Pulang','Retur Pasien','Stok Pasien Ranap','Pengambilan Medis','Penjualan','Stok Keluar','Hibah') DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `petugas` varchar(20) DEFAULT NULL,
  `kd_bangsal` char(5) DEFAULT NULL,
  `status` enum('Simpan','Hapus') DEFAULT NULL,
  `no_batch` varchar(20) NOT NULL,
  `no_faktur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `set_keterlambatan`
--

CREATE TABLE `set_keterlambatan` (
  `toleransi` int(11) DEFAULT NULL,
  `terlambat1` int(11) DEFAULT NULL,
  `terlambat2` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `set_no_rkm_medis`
--

CREATE TABLE `set_no_rkm_medis` (
  `no_rkm_medis` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `set_no_rkm_medis`
--

INSERT INTO `set_no_rkm_medis` (`no_rkm_medis`) VALUES
('000003');

-- --------------------------------------------------------

--
-- Table structure for table `skdp_bpjs`
--

CREATE TABLE `skdp_bpjs` (
  `tahun` year(4) NOT NULL,
  `no_rkm_medis` varchar(15) DEFAULT NULL,
  `diagnosa` varchar(50) NOT NULL,
  `terapi` varchar(50) NOT NULL,
  `alasan1` varchar(50) DEFAULT NULL,
  `alasan2` varchar(50) DEFAULT NULL,
  `rtl1` varchar(50) DEFAULT NULL,
  `rtl2` varchar(50) DEFAULT NULL,
  `tanggal_datang` date DEFAULT NULL,
  `tanggal_rujukan` date NOT NULL,
  `no_antrian` varchar(6) NOT NULL,
  `kd_dokter` varchar(20) DEFAULT NULL,
  `status` enum('Menunggu','Sudah Periksa','Batal Periksa') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `kd_sps` char(5) NOT NULL DEFAULT '',
  `nm_sps` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`kd_sps`, `nm_sps`) VALUES
('UMUM', 'Dokter Umum');

-- --------------------------------------------------------

--
-- Table structure for table `stts_kerja`
--

CREATE TABLE `stts_kerja` (
  `stts` char(3) NOT NULL,
  `ktg` varchar(20) NOT NULL,
  `indek` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts_kerja`
--

INSERT INTO `stts_kerja` (`stts`, `ktg`, `indek`) VALUES
('-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stts_wp`
--

CREATE TABLE `stts_wp` (
  `stts` char(5) NOT NULL,
  `ktg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts_wp`
--

INSERT INTO `stts_wp` (`stts`, `ktg`) VALUES
('-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `suku_bangsa`
--

CREATE TABLE `suku_bangsa` (
  `id` int(11) NOT NULL,
  `nama_suku_bangsa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `suku_bangsa`
--

INSERT INTO `suku_bangsa` (`id`, `nama_suku_bangsa`) VALUES
(1, '-');

-- --------------------------------------------------------

--
-- Table structure for table `tambahan_biaya`
--

CREATE TABLE `tambahan_biaya` (
  `no_rawat` varchar(17) NOT NULL,
  `nama_biaya` varchar(60) NOT NULL,
  `besar_biaya` double NOT NULL,
  `status` enum('ralan','ranap') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `template_laboratorium`
--

CREATE TABLE `template_laboratorium` (
  `kd_jenis_prw` varchar(15) NOT NULL,
  `id_template` int(11) NOT NULL,
  `Pemeriksaan` varchar(200) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `nilai_rujukan_ld` varchar(30) NOT NULL,
  `nilai_rujukan_la` varchar(30) NOT NULL,
  `nilai_rujukan_pd` varchar(30) NOT NULL,
  `nilai_rujukan_pa` varchar(30) NOT NULL,
  `bagian_rs` double NOT NULL,
  `bhp` double NOT NULL,
  `bagian_perujuk` double NOT NULL,
  `bagian_dokter` double NOT NULL,
  `bagian_laborat` double NOT NULL,
  `kso` double DEFAULT NULL,
  `menejemen` double DEFAULT NULL,
  `biaya_item` double NOT NULL,
  `urut` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template_laboratorium`
--

INSERT INTO `template_laboratorium` (`kd_jenis_prw`, `id_template`, `Pemeriksaan`, `satuan`, `nilai_rujukan_ld`, `nilai_rujukan_la`, `nilai_rujukan_pd`, `nilai_rujukan_pa`, `bagian_rs`, `bhp`, `bagian_perujuk`, `bagian_dokter`, `bagian_laborat`, `kso`, `menejemen`, `biaya_item`, `urut`) VALUES
('LAB01', 1, 'Leukosit', 'LK', '5', '5', '5', '5', 0, 0, 0, 0, 0, 0, 0, 0, 1),
('LAB01', 2, 'Hemoglobin', 'HL', '10', '10', '10', '10', 0, 0, 0, 0, 0, 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `temporary_presensi`
--

CREATE TABLE `temporary_presensi` (
  `id` int(11) NOT NULL,
  `shift` enum('Pagi','Pagi2','Pagi3','Pagi4','Pagi5','Pagi6','Pagi7','Pagi8','Pagi9','Pagi10','Siang','Siang2','Siang3','Siang4','Siang5','Siang6','Siang7','Siang8','Siang9','Siang10','Malam','Malam2','Malam3','Malam4','Malam5','Malam6','Malam7','Malam8','Malam9','Malam10','Midle Pagi1','Midle Pagi2','Midle Pagi3','Midle Pagi4','Midle Pagi5','Midle Pagi6','Midle Pagi7','Midle Pagi8','Midle Pagi9','Midle Pagi10','Midle Siang1','Midle Siang2','Midle Siang3','Midle Siang4','Midle Siang5','Midle Siang6','Midle Siang7','Midle Siang8','Midle Siang9','Midle Siang10','Midle Malam1','Midle Malam2','Midle Malam3','Midle Malam4','Midle Malam5','Midle Malam6','Midle Malam7','Midle Malam8','Midle Malam9','Midle Malam10') NOT NULL,
  `jam_datang` datetime DEFAULT NULL,
  `jam_pulang` datetime DEFAULT NULL,
  `status` enum('Tepat Waktu','Terlambat Toleransi','Terlambat I','Terlambat II','Tepat Waktu & PSW','Terlambat Toleransi & PSW','Terlambat I & PSW','Terlambat II & PSW') NOT NULL,
  `keterlambatan` varchar(20) NOT NULL,
  `durasi` varchar(20) DEFAULT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan_pakai`
--
ALTER TABLE `aturan_pakai`
  ADD PRIMARY KEY (`tgl_perawatan`,`jam`,`no_rawat`,`kode_brng`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `bahasa_pasien`
--
ALTER TABLE `bahasa_pasien`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_bahasa` (`nama_bahasa`) USING BTREE;

--
-- Indexes for table `bangsal`
--
ALTER TABLE `bangsal`
  ADD PRIMARY KEY (`kd_bangsal`),
  ADD KEY `nm_bangsal` (`nm_bangsal`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`namabank`);

--
-- Indexes for table `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`);

--
-- Indexes for table `beri_obat_operasi`
--
ALTER TABLE `beri_obat_operasi`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_obat` (`kd_obat`),
  ADD KEY `tanggal` (`tanggal`),
  ADD KEY `hargasatuan` (`hargasatuan`),
  ADD KEY `jumlah` (`jumlah`);

--
-- Indexes for table `berkas_digital_perawatan`
--
ALTER TABLE `berkas_digital_perawatan`
  ADD PRIMARY KEY (`no_rawat`,`kode`,`lokasi_file`) USING BTREE,
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`nama`);

--
-- Indexes for table `booking_operasi`
--
ALTER TABLE `booking_operasi`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kode_paket` (`kode_paket`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `booking_periksa`
--
ALTER TABLE `booking_periksa`
  ADD PRIMARY KEY (`no_booking`),
  ADD UNIQUE KEY `tanggal` (`tanggal`,`no_telp`),
  ADD KEY `kd_poli` (`kd_poli`);

--
-- Indexes for table `booking_periksa_balasan`
--
ALTER TABLE `booking_periksa_balasan`
  ADD PRIMARY KEY (`no_booking`);

--
-- Indexes for table `booking_periksa_diterima`
--
ALTER TABLE `booking_periksa_diterima`
  ADD PRIMARY KEY (`no_booking`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `booking_registrasi`
--
ALTER TABLE `booking_registrasi`
  ADD PRIMARY KEY (`no_rkm_medis`,`tanggal_periksa`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `kd_pj` (`kd_pj`);

--
-- Indexes for table `bpjs_prb`
--
ALTER TABLE `bpjs_prb`
  ADD PRIMARY KEY (`no_sep`);

--
-- Indexes for table `bridging_sep`
--
ALTER TABLE `bridging_sep`
  ADD PRIMARY KEY (`no_sep`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `bridging_sep_internal`
--
ALTER TABLE `bridging_sep_internal`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `no_sep` (`no_sep`);

--
-- Indexes for table `bridging_surat_kontrol_bpjs`
--
ALTER TABLE `bridging_surat_kontrol_bpjs`
  ADD PRIMARY KEY (`no_surat`),
  ADD KEY `bridging_surat_kontrol_bpjs_ibfk_1` (`no_sep`);

--
-- Indexes for table `bridging_surat_pri_bpjs`
--
ALTER TABLE `bridging_surat_pri_bpjs`
  ADD PRIMARY KEY (`no_surat`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `cacat_fisik`
--
ALTER TABLE `cacat_fisik`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_cacat` (`nama_cacat`) USING BTREE;

--
-- Indexes for table `catatan_perawatan`
--
ALTER TABLE `catatan_perawatan`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `databarang`
--
ALTER TABLE `databarang`
  ADD PRIMARY KEY (`kode_brng`),
  ADD KEY `kode_sat` (`kode_sat`),
  ADD KEY `kdjns` (`kdjns`),
  ADD KEY `nama_brng` (`nama_brng`),
  ADD KEY `letak_barang` (`letak_barang`),
  ADD KEY `h_beli` (`h_beli`),
  ADD KEY `h_distributor` (`ralan`),
  ADD KEY `h_grosir` (`kelas1`),
  ADD KEY `h_retail` (`kelas2`),
  ADD KEY `stok` (`stokminimal`),
  ADD KEY `kapasitas` (`kapasitas`),
  ADD KEY `kode_industri` (`kode_industri`),
  ADD KEY `kelas3` (`kelas3`),
  ADD KEY `utama` (`utama`),
  ADD KEY `vip` (`vip`),
  ADD KEY `vvip` (`vvip`),
  ADD KEY `beliluar` (`beliluar`),
  ADD KEY `jualbebas` (`jualbebas`),
  ADD KEY `karyawan` (`karyawan`),
  ADD KEY `expire` (`expire`),
  ADD KEY `status` (`status`),
  ADD KEY `kode_kategori` (`kode_kategori`),
  ADD KEY `kode_golongan` (`kode_golongan`),
  ADD KEY `kode_satbesar` (`kode_satbesar`) USING BTREE;

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`dep_id`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `detail_pemberian_obat`
--
ALTER TABLE `detail_pemberian_obat`
  ADD PRIMARY KEY (`tgl_perawatan`,`jam`,`no_rawat`,`kode_brng`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_obat` (`kode_brng`),
  ADD KEY `tgl_perawatan` (`tgl_perawatan`),
  ADD KEY `jam` (`jam`),
  ADD KEY `jml` (`jml`),
  ADD KEY `tambahan` (`embalase`),
  ADD KEY `total` (`total`),
  ADD KEY `biaya_obat` (`biaya_obat`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `tuslah` (`tuslah`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `detail_periksa_lab`
--
ALTER TABLE `detail_periksa_lab`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`,`id_template`),
  ADD KEY `id_template` (`id_template`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `tgl_periksa` (`tgl_periksa`),
  ADD KEY `jam` (`jam`),
  ADD KEY `nilai` (`nilai`),
  ADD KEY `nilai_rujukan` (`nilai_rujukan`),
  ADD KEY `keterangan` (`keterangan`),
  ADD KEY `biaya_item` (`biaya_item`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `kso` (`kso`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `bagian_perujuk` (`bagian_perujuk`),
  ADD KEY `bagian_dokter` (`bagian_dokter`),
  ADD KEY `bagian_laborat` (`bagian_laborat`);

--
-- Indexes for table `diagnosa_pasien`
--
ALTER TABLE `diagnosa_pasien`
  ADD PRIMARY KEY (`no_rawat`,`kd_penyakit`,`status`),
  ADD KEY `kd_penyakit` (`kd_penyakit`),
  ADD KEY `status` (`status`),
  ADD KEY `prioritas` (`prioritas`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`),
  ADD KEY `kd_sps` (`kd_sps`),
  ADD KEY `nm_dokter` (`nm_dokter`),
  ADD KEY `jk` (`jk`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `gol_drh` (`gol_drh`),
  ADD KEY `agama` (`agama`),
  ADD KEY `almt_tgl` (`almt_tgl`),
  ADD KEY `no_telp` (`no_telp`),
  ADD KEY `stts_nikah` (`stts_nikah`),
  ADD KEY `alumni` (`alumni`),
  ADD KEY `no_ijn_praktek` (`no_ijn_praktek`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `dpjp_ranap`
--
ALTER TABLE `dpjp_ranap`
  ADD PRIMARY KEY (`no_rawat`,`kd_dokter`),
  ADD KEY `dpjp_ranap_ibfk_2` (`kd_dokter`);

--
-- Indexes for table `emergency_index`
--
ALTER TABLE `emergency_index`
  ADD PRIMARY KEY (`kode_emergency`);

--
-- Indexes for table `gambar_radiologi`
--
ALTER TABLE `gambar_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_periksa`,`jam`,`lokasi_gambar`);

--
-- Indexes for table `golongan_barang`
--
ALTER TABLE `golongan_barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `gudangbarang`
--
ALTER TABLE `gudangbarang`
  ADD PRIMARY KEY (`kode_brng`,`kd_bangsal`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `kode_brng` (`kode_brng`),
  ADD KEY `stok` (`stok`),
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE;

--
-- Indexes for table `hasil_radiologi`
--
ALTER TABLE `hasil_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_periksa`,`jam`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `icd9`
--
ALTER TABLE `icd9`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `industrifarmasi`
--
ALTER TABLE `industrifarmasi`
  ADD PRIMARY KEY (`kode_industri`),
  ADD KEY `nama_industri` (`nama_industri`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `kota` (`kota`),
  ADD KEY `no_telp` (`no_telp`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kd_jbtn`),
  ADD KEY `nm_jbtn` (`nm_jbtn`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_dokter`,`hari_kerja`,`jam_mulai`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `jam_mulai` (`jam_mulai`),
  ADD KEY `jam_selesai` (`jam_selesai`);

--
-- Indexes for table `jadwal_pegawai`
--
ALTER TABLE `jadwal_pegawai`
  ADD PRIMARY KEY (`id`,`tahun`,`bulan`),
  ADD KEY `h1` (`h1`),
  ADD KEY `h2` (`h2`),
  ADD KEY `h3` (`h3`),
  ADD KEY `h4` (`h4`),
  ADD KEY `h30` (`h30`),
  ADD KEY `h31` (`h31`),
  ADD KEY `h29` (`h29`),
  ADD KEY `h28` (`h28`),
  ADD KEY `h18` (`h18`),
  ADD KEY `h9` (`h9`);

--
-- Indexes for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD PRIMARY KEY (`id`,`tahun`,`bulan`);

--
-- Indexes for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  ADD PRIMARY KEY (`no_id`),
  ADD UNIQUE KEY `dep_id_2` (`dep_id`,`shift`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `shift` (`shift`),
  ADD KEY `jam_masuk` (`jam_masuk`),
  ADD KEY `jam_pulang` (`jam_pulang`);

--
-- Indexes for table `jam_masuk`
--
ALTER TABLE `jam_masuk`
  ADD PRIMARY KEY (`shift`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`kdjns`),
  ADD KEY `nama` (`nama`),
  ADD KEY `keterangan` (`keterangan`);

--
-- Indexes for table `jnj_jabatan`
--
ALTER TABLE `jnj_jabatan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `nama` (`nama`),
  ADD KEY `tnj` (`tnj`);

--
-- Indexes for table `jns_perawatan`
--
ALTER TABLE `jns_perawatan`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `material` (`material`),
  ADD KEY `tarif_tindakandr` (`tarif_tindakandr`),
  ADD KEY `tarif_tindakanpr` (`tarif_tindakanpr`),
  ADD KEY `total_byrdr` (`total_byrdr`),
  ADD KEY `total_byrpr` (`total_byrpr`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`),
  ADD KEY `total_byrdrpr` (`total_byrdrpr`),
  ADD KEY `bhp` (`bhp`);

--
-- Indexes for table `jns_perawatan_inap`
--
ALTER TABLE `jns_perawatan_inap`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `material` (`material`),
  ADD KEY `tarif_tindakandr` (`tarif_tindakandr`),
  ADD KEY `tarif_tindakanpr` (`tarif_tindakanpr`),
  ADD KEY `total_byrdr` (`total_byrdr`),
  ADD KEY `total_byrpr` (`total_byrpr`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`),
  ADD KEY `total_byrdrpr` (`total_byrdrpr`);

--
-- Indexes for table `jns_perawatan_lab`
--
ALTER TABLE `jns_perawatan_lab`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `tarif_perujuk` (`tarif_perujuk`),
  ADD KEY `tarif_tindakan_dokter` (`tarif_tindakan_dokter`),
  ADD KEY `tarif_tindakan_petugas` (`tarif_tindakan_petugas`),
  ADD KEY `total_byr` (`total_byr`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `jns_perawatan_radiologi`
--
ALTER TABLE `jns_perawatan_radiologi`
  ADD PRIMARY KEY (`kd_jenis_prw`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `tarif_perujuk` (`tarif_perujuk`),
  ADD KEY `tarif_tindakan_dokter` (`tarif_tindakan_dokter`),
  ADD KEY `tarif_tindakan_petugas` (`tarif_tindakan_petugas`),
  ADD KEY `total_byr` (`total_byr`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`kd_kab`),
  ADD UNIQUE KEY `nm_kab` (`nm_kab`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kd_kamar`),
  ADD KEY `kd_bangsal` (`kd_bangsal`),
  ADD KEY `trf_kamar` (`trf_kamar`),
  ADD KEY `status` (`status`),
  ADD KEY `kelas` (`kelas`),
  ADD KEY `statusdata` (`statusdata`);

--
-- Indexes for table `kamar_inap`
--
ALTER TABLE `kamar_inap`
  ADD PRIMARY KEY (`no_rawat`,`tgl_masuk`,`jam_masuk`),
  ADD KEY `kd_kamar` (`kd_kamar`),
  ADD KEY `diagnosa_awal` (`diagnosa_awal`),
  ADD KEY `diagnosa_akhir` (`diagnosa_akhir`),
  ADD KEY `tgl_keluar` (`tgl_keluar`),
  ADD KEY `jam_keluar` (`jam_keluar`),
  ADD KEY `lama` (`lama`),
  ADD KEY `ttl_biaya` (`ttl_biaya`),
  ADD KEY `stts_pulang` (`stts_pulang`),
  ADD KEY `trf_kamar` (`trf_kamar`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `kategori_penyakit`
--
ALTER TABLE `kategori_penyakit`
  ADD PRIMARY KEY (`kd_ktg`),
  ADD KEY `nm_kategori` (`nm_kategori`),
  ADD KEY `ciri_umum` (`ciri_umum`);

--
-- Indexes for table `kategori_perawatan`
--
ALTER TABLE `kategori_perawatan`
  ADD PRIMARY KEY (`kd_kategori`),
  ADD KEY `nm_kategori` (`nm_kategori`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kd_kec`);

--
-- Indexes for table `kelompok_jabatan`
--
ALTER TABLE `kelompok_jabatan`
  ADD PRIMARY KEY (`kode_kelompok`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`kd_kel`);

--
-- Indexes for table `kodesatuan`
--
ALTER TABLE `kodesatuan`
  ADD PRIMARY KEY (`kode_sat`),
  ADD KEY `satuan` (`satuan`);

--
-- Indexes for table `laporan_operasi`
--
ALTER TABLE `laporan_operasi`
  ADD PRIMARY KEY (`no_rawat`,`tanggal`);

--
-- Indexes for table `maping_dokter_dpjpvclaim`
--
ALTER TABLE `maping_dokter_dpjpvclaim`
  ADD PRIMARY KEY (`kd_dokter`) USING BTREE;

--
-- Indexes for table `maping_poli_bpjs`
--
ALTER TABLE `maping_poli_bpjs`
  ADD PRIMARY KEY (`kd_poli_rs`);

--
-- Indexes for table `master_aturan_pakai`
--
ALTER TABLE `master_aturan_pakai`
  ADD PRIMARY KEY (`aturan`);

--
-- Indexes for table `master_berkas_digital`
--
ALTER TABLE `master_berkas_digital`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `metode_racik`
--
ALTER TABLE `metode_racik`
  ADD PRIMARY KEY (`kd_racik`) USING BTREE;

--
-- Indexes for table `mlite_akun_kegiatan`
--
ALTER TABLE `mlite_akun_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_antrian_loket`
--
ALTER TABLE `mlite_antrian_loket`
  ADD PRIMARY KEY (`kd`);

--
-- Indexes for table `mlite_antrian_referensi`
--
ALTER TABLE `mlite_antrian_referensi`
  ADD PRIMARY KEY (`nomor_referensi`);

--
-- Indexes for table `mlite_billing`
--
ALTER TABLE `mlite_billing`
  ADD PRIMARY KEY (`id_billing`);

--
-- Indexes for table `mlite_detailjurnal`
--
ALTER TABLE `mlite_detailjurnal`
  ADD KEY `no_jurnal` (`no_jurnal`),
  ADD KEY `kd_rek` (`kd_rek`),
  ADD KEY `debet` (`debet`),
  ADD KEY `kredit` (`kredit`);

--
-- Indexes for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `mlite_duitku_ibfk_1` (`no_rkm_medis`);

--
-- Indexes for table `mlite_geolocation_presensi`
--
ALTER TABLE `mlite_geolocation_presensi`
  ADD KEY `mlite_geolocation_presensi_ibfk_1` (`id`);

--
-- Indexes for table `mlite_jurnal`
--
ALTER TABLE `mlite_jurnal`
  ADD PRIMARY KEY (`no_jurnal`),
  ADD KEY `no_bukti` (`no_bukti`),
  ADD KEY `tgl_jurnal` (`tgl_jurnal`),
  ADD KEY `jenis` (`jenis`),
  ADD KEY `keterangan` (`keterangan`);

--
-- Indexes for table `mlite_modules`
--
ALTER TABLE `mlite_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_news`
--
ALTER TABLE `mlite_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_news_tags`
--
ALTER TABLE `mlite_news_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_news_tags_relationship`
--
ALTER TABLE `mlite_news_tags_relationship`
  ADD KEY `mlite_news_tags_relationship_ibfk_1` (`news_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `mlite_notifications`
--
ALTER TABLE `mlite_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_pasien_galleries`
--
ALTER TABLE `mlite_pasien_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_pasien_galleries_items`
--
ALTER TABLE `mlite_pasien_galleries_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_pengaduan`
--
ALTER TABLE `mlite_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `pengaduan_detail_ibfk_1` (`pengaduan_id`);

--
-- Indexes for table `mlite_rekening`
--
ALTER TABLE `mlite_rekening`
  ADD PRIMARY KEY (`kd_rek`),
  ADD KEY `nm_rek` (`nm_rek`),
  ADD KEY `tipe` (`tipe`),
  ADD KEY `balance` (`balance`);

--
-- Indexes for table `mlite_rekeningtahun`
--
ALTER TABLE `mlite_rekeningtahun`
  ADD PRIMARY KEY (`thn`,`kd_rek`),
  ADD KEY `kd_rek` (`kd_rek`),
  ADD KEY `saldo_awal` (`saldo_awal`);

--
-- Indexes for table `mlite_remember_me`
--
ALTER TABLE `mlite_remember_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mlite_remember_me_ibfk_1` (`user_id`);

--
-- Indexes for table `mlite_settings`
--
ALTER TABLE `mlite_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_subrekening`
--
ALTER TABLE `mlite_subrekening`
  ADD PRIMARY KEY (`kd_rek2`),
  ADD KEY `kd_rek` (`kd_rek`);

--
-- Indexes for table `mlite_users`
--
ALTER TABLE `mlite_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_vedika`
--
ALTER TABLE `mlite_vedika`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_vedika_feedback`
--
ALTER TABLE `mlite_vedika_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mlite_veronisa`
--
ALTER TABLE `mlite_veronisa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_berkas`
--
ALTER TABLE `mutasi_berkas`
  ADD PRIMARY KEY (`no_rawat`);

--
-- Indexes for table `obatbhp_ok`
--
ALTER TABLE `obatbhp_ok`
  ADD PRIMARY KEY (`kd_obat`),
  ADD KEY `kode_sat` (`kode_sat`),
  ADD KEY `nm_obat` (`nm_obat`),
  ADD KEY `hargasatuan` (`hargasatuan`);

--
-- Indexes for table `operasi`
--
ALTER TABLE `operasi`
  ADD PRIMARY KEY (`no_rawat`,`tgl_operasi`,`kode_paket`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `operator1` (`operator1`),
  ADD KEY `operator2` (`operator2`),
  ADD KEY `operator3` (`operator3`),
  ADD KEY `asisten_operator1` (`asisten_operator1`),
  ADD KEY `asisten_operator2` (`asisten_operator2`),
  ADD KEY `dokter_anak` (`dokter_anak`),
  ADD KEY `perawaat_resusitas` (`perawaat_resusitas`),
  ADD KEY `dokter_anestesi` (`dokter_anestesi`),
  ADD KEY `asisten_anestesi` (`asisten_anestesi`),
  ADD KEY `bidan` (`bidan`),
  ADD KEY `perawat_luar` (`perawat_luar`),
  ADD KEY `kode_paket` (`kode_paket`);

--
-- Indexes for table `opname`
--
ALTER TABLE `opname`
  ADD PRIMARY KEY (`kode_brng`,`tanggal`,`kd_bangsal`,`no_batch`,`no_faktur`) USING BTREE,
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE,
  ADD KEY `stok` (`stok`) USING BTREE,
  ADD KEY `real` (`real`) USING BTREE,
  ADD KEY `selisih` (`selisih`) USING BTREE,
  ADD KEY `nomihilang` (`nomihilang`) USING BTREE,
  ADD KEY `keterangan` (`keterangan`) USING BTREE,
  ADD KEY `kode_brng` (`kode_brng`) USING BTREE;

--
-- Indexes for table `paket_operasi`
--
ALTER TABLE `paket_operasi`
  ADD PRIMARY KEY (`kode_paket`),
  ADD KEY `nm_perawatan` (`nm_perawatan`),
  ADD KEY `operator1` (`operator1`),
  ADD KEY `operator2` (`operator2`),
  ADD KEY `operator3` (`operator3`),
  ADD KEY `asisten_operator1` (`asisten_operator1`),
  ADD KEY `asisten_operator2` (`asisten_operator2`),
  ADD KEY `asisten_operator3` (`instrumen`),
  ADD KEY `dokter_anak` (`dokter_anak`),
  ADD KEY `perawat_resusitas` (`perawaat_resusitas`),
  ADD KEY `dokter_anestasi` (`dokter_anestesi`),
  ADD KEY `asisten_anastesi` (`asisten_anestesi`),
  ADD KEY `bidan` (`bidan`),
  ADD KEY `perawat_luar` (`perawat_luar`),
  ADD KEY `sewa_ok` (`sewa_ok`),
  ADD KEY `alat` (`alat`),
  ADD KEY `sewa_vk` (`akomodasi`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `omloop` (`omloop`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `asisten_anestesi2` (`asisten_anestesi2`),
  ADD KEY `omloop2` (`omloop2`),
  ADD KEY `omloop3` (`omloop3`),
  ADD KEY `omloop4` (`omloop4`),
  ADD KEY `omloop5` (`omloop5`),
  ADD KEY `status` (`status`),
  ADD KEY `kategori` (`kategori`),
  ADD KEY `bidan2` (`bidan2`),
  ADD KEY `bidan3` (`bidan3`),
  ADD KEY `asisten_operator3_2` (`asisten_operator3`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rkm_medis`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `kd_kec` (`kd_kec`),
  ADD KEY `kd_kab` (`kd_kab`),
  ADD KEY `nm_pasien` (`nm_pasien`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `kd_kel_2` (`kd_kel`),
  ADD KEY `no_ktp` (`no_ktp`),
  ADD KEY `no_peserta` (`no_peserta`),
  ADD KEY `perusahaan_pasien` (`perusahaan_pasien`) USING BTREE,
  ADD KEY `suku_bangsa` (`suku_bangsa`) USING BTREE,
  ADD KEY `bahasa_pasien` (`bahasa_pasien`) USING BTREE,
  ADD KEY `cacat_fisik` (`cacat_fisik`) USING BTREE,
  ADD KEY `kd_prop` (`kd_prop`) USING BTREE;

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik_2` (`nik`),
  ADD KEY `departemen` (`departemen`),
  ADD KEY `bidang` (`bidang`),
  ADD KEY `stts_wp` (`stts_wp`),
  ADD KEY `stts_kerja` (`stts_kerja`),
  ADD KEY `pendidikan` (`pendidikan`),
  ADD KEY `indexins` (`indexins`),
  ADD KEY `jnj_jabatan` (`jnj_jabatan`),
  ADD KEY `bpd` (`bpd`),
  ADD KEY `nama` (`nama`),
  ADD KEY `jbtn` (`jbtn`),
  ADD KEY `npwp` (`npwp`),
  ADD KEY `dankes` (`dankes`),
  ADD KEY `cuti_diambil` (`cuti_diambil`),
  ADD KEY `mulai_kontrak` (`mulai_kontrak`),
  ADD KEY `stts_aktif` (`stts_aktif`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `alamat` (`alamat`),
  ADD KEY `mulai_kerja` (`mulai_kerja`),
  ADD KEY `gapok` (`gapok`),
  ADD KEY `kota` (`kota`),
  ADD KEY `pengurang` (`pengurang`),
  ADD KEY `indek` (`indek`),
  ADD KEY `jk` (`jk`),
  ADD KEY `ms_kerja` (`ms_kerja`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `rekening` (`rekening`),
  ADD KEY `wajibmasuk` (`wajibmasuk`),
  ADD KEY `kode_emergency` (`kode_emergency`) USING BTREE,
  ADD KEY `kode_kelompok` (`kode_kelompok`) USING BTREE,
  ADD KEY `kode_resiko` (`kode_resiko`) USING BTREE;

--
-- Indexes for table `pemeriksaan_ralan`
--
ALTER TABLE `pemeriksaan_ralan`
  ADD PRIMARY KEY (`no_rawat`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `pemeriksaan_ranap`
--
ALTER TABLE `pemeriksaan_ranap`
  ADD PRIMARY KEY (`no_rawat`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`tingkat`);

--
-- Indexes for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  ADD PRIMARY KEY (`no_pengajuan`) USING BTREE,
  ADD KEY `nik` (`nik`) USING BTREE,
  ADD KEY `nik_pj` (`nik_pj`) USING BTREE;

--
-- Indexes for table `penjab`
--
ALTER TABLE `penjab`
  ADD PRIMARY KEY (`kd_pj`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`kd_penyakit`),
  ADD KEY `kd_ktg` (`kd_ktg`),
  ADD KEY `nm_penyakit` (`nm_penyakit`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`);

--
-- Indexes for table `periksa_radiologi`
--
ALTER TABLE `periksa_radiologi`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`tgl_periksa`,`jam`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`);

--
-- Indexes for table `permintaan_detail_permintaan_lab`
--
ALTER TABLE `permintaan_detail_permintaan_lab`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`,`id_template`) USING BTREE,
  ADD KEY `id_template` (`id_template`) USING BTREE,
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`) USING BTREE;

--
-- Indexes for table `permintaan_lab`
--
ALTER TABLE `permintaan_lab`
  ADD PRIMARY KEY (`noorder`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `permintaan_pemeriksaan_lab`
--
ALTER TABLE `permintaan_pemeriksaan_lab`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`);

--
-- Indexes for table `permintaan_pemeriksaan_radiologi`
--
ALTER TABLE `permintaan_pemeriksaan_radiologi`
  ADD PRIMARY KEY (`noorder`,`kd_jenis_prw`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`);

--
-- Indexes for table `permintaan_radiologi`
--
ALTER TABLE `permintaan_radiologi`
  ADD PRIMARY KEY (`noorder`),
  ADD KEY `dokter_perujuk` (`dokter_perujuk`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `personal_pasien`
--
ALTER TABLE `personal_pasien`
  ADD PRIMARY KEY (`no_rkm_medis`);

--
-- Indexes for table `perusahaan_pasien`
--
ALTER TABLE `perusahaan_pasien`
  ADD PRIMARY KEY (`kode_perusahaan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kd_jbtn` (`kd_jbtn`),
  ADD KEY `nama` (`nama`),
  ADD KEY `nip` (`nip`),
  ADD KEY `tmp_lahir` (`tmp_lahir`),
  ADD KEY `tgl_lahir` (`tgl_lahir`),
  ADD KEY `agama` (`agama`),
  ADD KEY `stts_nikah` (`stts_nikah`),
  ADD KEY `alamat` (`alamat`);

--
-- Indexes for table `poliklinik`
--
ALTER TABLE `poliklinik`
  ADD PRIMARY KEY (`kd_poli`),
  ADD KEY `nm_poli` (`nm_poli`),
  ADD KEY `registrasi` (`registrasi`),
  ADD KEY `registrasilama` (`registrasilama`);

--
-- Indexes for table `propinsi`
--
ALTER TABLE `propinsi`
  ADD PRIMARY KEY (`kd_prop`),
  ADD UNIQUE KEY `nm_prop` (`nm_prop`);

--
-- Indexes for table `prosedur_pasien`
--
ALTER TABLE `prosedur_pasien`
  ADD PRIMARY KEY (`no_rawat`,`kode`,`status`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `rawat_inap_dr`
--
ALTER TABLE `rawat_inap_dr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `tgl_perawatan` (`tgl_perawatan`),
  ADD KEY `biaya_rawat` (`biaya_rawat`),
  ADD KEY `jam_rawat` (`jam_rawat`);

--
-- Indexes for table `rawat_inap_drpr`
--
ALTER TABLE `rawat_inap_drpr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`nip`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `rawat_inap_drpr_ibfk_2` (`kd_jenis_prw`),
  ADD KEY `rawat_inap_drpr_ibfk_3` (`kd_dokter`),
  ADD KEY `rawat_inap_drpr_ibfk_4` (`nip`);

--
-- Indexes for table `rawat_inap_pr`
--
ALTER TABLE `rawat_inap_pr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`nip`,`tgl_perawatan`,`jam_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `nip` (`nip`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `rawat_jl_dr`
--
ALTER TABLE `rawat_jl_dr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `rawat_jl_drpr`
--
ALTER TABLE `rawat_jl_drpr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`kd_dokter`,`nip`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `rawat_jl_drpr_ibfk_2` (`kd_jenis_prw`),
  ADD KEY `rawat_jl_drpr_ibfk_3` (`kd_dokter`),
  ADD KEY `rawat_jl_drpr_ibfk_4` (`nip`),
  ADD KEY `no_rawat` (`no_rawat`);

--
-- Indexes for table `rawat_jl_pr`
--
ALTER TABLE `rawat_jl_pr`
  ADD PRIMARY KEY (`no_rawat`,`kd_jenis_prw`,`nip`,`tgl_perawatan`,`jam_rawat`) USING BTREE,
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `nip` (`nip`),
  ADD KEY `biaya_rawat` (`biaya_rawat`);

--
-- Indexes for table `reg_periksa`
--
ALTER TABLE `reg_periksa`
  ADD PRIMARY KEY (`no_rawat`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `kd_poli` (`kd_poli`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `status_lanjut` (`status_lanjut`),
  ADD KEY `kd_dokter` (`kd_dokter`),
  ADD KEY `status_bayar` (`status_bayar`) USING BTREE;

--
-- Indexes for table `rekap_presensi`
--
ALTER TABLE `rekap_presensi`
  ADD PRIMARY KEY (`id`,`jam_datang`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `resep_dokter`
--
ALTER TABLE `resep_dokter`
  ADD KEY `no_resep` (`no_resep`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `resep_dokter_racikan`
--
ALTER TABLE `resep_dokter_racikan`
  ADD PRIMARY KEY (`no_resep`,`no_racik`),
  ADD KEY `kd_racik` (`kd_racik`);

--
-- Indexes for table `resep_dokter_racikan_detail`
--
ALTER TABLE `resep_dokter_racikan_detail`
  ADD PRIMARY KEY (`no_resep`,`no_racik`,`kode_brng`),
  ADD KEY `kode_brng` (`kode_brng`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`no_resep`),
  ADD UNIQUE KEY `tgl_perawatan` (`tgl_perawatan`,`jam`,`no_rawat`),
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `resiko_kerja`
--
ALTER TABLE `resiko_kerja`
  ADD PRIMARY KEY (`kode_resiko`);

--
-- Indexes for table `riwayat_barang_medis`
--
ALTER TABLE `riwayat_barang_medis`
  ADD KEY `riwayat_barang_medis_ibfk_1` (`kode_brng`) USING BTREE,
  ADD KEY `kd_bangsal` (`kd_bangsal`) USING BTREE;

--
-- Indexes for table `skdp_bpjs`
--
ALTER TABLE `skdp_bpjs`
  ADD PRIMARY KEY (`tahun`,`no_antrian`) USING BTREE,
  ADD KEY `no_rkm_medis` (`no_rkm_medis`) USING BTREE,
  ADD KEY `kd_dokter` (`kd_dokter`) USING BTREE;

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`kd_sps`);

--
-- Indexes for table `stts_kerja`
--
ALTER TABLE `stts_kerja`
  ADD PRIMARY KEY (`stts`);

--
-- Indexes for table `stts_wp`
--
ALTER TABLE `stts_wp`
  ADD PRIMARY KEY (`stts`);

--
-- Indexes for table `suku_bangsa`
--
ALTER TABLE `suku_bangsa`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `nama_suku_bangsa` (`nama_suku_bangsa`) USING BTREE;

--
-- Indexes for table `tambahan_biaya`
--
ALTER TABLE `tambahan_biaya`
  ADD PRIMARY KEY (`no_rawat`,`nama_biaya`);

--
-- Indexes for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  ADD PRIMARY KEY (`id_template`),
  ADD KEY `kd_jenis_prw` (`kd_jenis_prw`),
  ADD KEY `Pemeriksaan` (`Pemeriksaan`),
  ADD KEY `satuan` (`satuan`),
  ADD KEY `nilai_rujukan_ld` (`nilai_rujukan_ld`),
  ADD KEY `nilai_rujukan_la` (`nilai_rujukan_la`),
  ADD KEY `nilai_rujukan_pd` (`nilai_rujukan_pd`),
  ADD KEY `nilai_rujukan_pa` (`nilai_rujukan_pa`),
  ADD KEY `bagian_rs` (`bagian_rs`),
  ADD KEY `bhp` (`bhp`),
  ADD KEY `bagian_perujuk` (`bagian_perujuk`),
  ADD KEY `bagian_dokter` (`bagian_dokter`),
  ADD KEY `bagian_laborat` (`bagian_laborat`),
  ADD KEY `kso` (`kso`),
  ADD KEY `menejemen` (`menejemen`),
  ADD KEY `biaya_item` (`biaya_item`),
  ADD KEY `urut` (`urut`);

--
-- Indexes for table `temporary_presensi`
--
ALTER TABLE `temporary_presensi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahasa_pasien`
--
ALTER TABLE `bahasa_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cacat_fisik`
--
ALTER TABLE `cacat_fisik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  MODIFY `no_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `kd_kab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `kd_kec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mlite_akun_kegiatan`
--
ALTER TABLE `mlite_akun_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_antrian_loket`
--
ALTER TABLE `mlite_antrian_loket`
  MODIFY `kd` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_billing`
--
ALTER TABLE `mlite_billing`
  MODIFY `id_billing` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_modules`
--
ALTER TABLE `mlite_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `mlite_news`
--
ALTER TABLE `mlite_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_news_tags`
--
ALTER TABLE `mlite_news_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_notifications`
--
ALTER TABLE `mlite_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_pasien_galleries`
--
ALTER TABLE `mlite_pasien_galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_pasien_galleries_items`
--
ALTER TABLE `mlite_pasien_galleries_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_remember_me`
--
ALTER TABLE `mlite_remember_me`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_settings`
--
ALTER TABLE `mlite_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `mlite_users`
--
ALTER TABLE `mlite_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mlite_vedika`
--
ALTER TABLE `mlite_vedika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_vedika_feedback`
--
ALTER TABLE `mlite_vedika_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mlite_veronisa`
--
ALTER TABLE `mlite_veronisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `propinsi`
--
ALTER TABLE `propinsi`
  MODIFY `kd_prop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suku_bangsa`
--
ALTER TABLE `suku_bangsa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  MODIFY `id_template` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aturan_pakai`
--
ALTER TABLE `aturan_pakai`
  ADD CONSTRAINT `aturan_pakai_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aturan_pakai_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barcode`
--
ALTER TABLE `barcode`
  ADD CONSTRAINT `barcode_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `berkas_digital_perawatan`
--
ALTER TABLE `berkas_digital_perawatan`
  ADD CONSTRAINT `berkas_digital_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `berkas_digital_perawatan_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `master_berkas_digital` (`kode`) ON UPDATE CASCADE;

--
-- Constraints for table `booking_operasi`
--
ALTER TABLE `booking_operasi`
  ADD CONSTRAINT `booking_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_operasi_ibfk_2` FOREIGN KEY (`kode_paket`) REFERENCES `paket_operasi` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_operasi_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa`
--
ALTER TABLE `booking_periksa`
  ADD CONSTRAINT `booking_periksa_ibfk_1` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa_balasan`
--
ALTER TABLE `booking_periksa_balasan`
  ADD CONSTRAINT `booking_periksa_balasan_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_periksa_diterima`
--
ALTER TABLE `booking_periksa_diterima`
  ADD CONSTRAINT `booking_periksa_diterima_ibfk_1` FOREIGN KEY (`no_booking`) REFERENCES `booking_periksa` (`no_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_periksa_diterima_ibfk_2` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_registrasi`
--
ALTER TABLE `booking_registrasi`
  ADD CONSTRAINT `booking_registrasi_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_3` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_registrasi_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bpjs_prb`
--
ALTER TABLE `bpjs_prb`
  ADD CONSTRAINT `bpjs_prb_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_sep`
--
ALTER TABLE `bridging_sep`
  ADD CONSTRAINT `bridging_sep_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_sep_internal`
--
ALTER TABLE `bridging_sep_internal`
  ADD CONSTRAINT `bridging_sep_internal_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bridging_sep_internal_ibfk_2` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_surat_kontrol_bpjs`
--
ALTER TABLE `bridging_surat_kontrol_bpjs`
  ADD CONSTRAINT `bridging_surat_kontrol_bpjs_ibfk_1` FOREIGN KEY (`no_sep`) REFERENCES `bridging_sep` (`no_sep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bridging_surat_pri_bpjs`
--
ALTER TABLE `bridging_surat_pri_bpjs`
  ADD CONSTRAINT `bridging_surat_pri_bpjs_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catatan_perawatan`
--
ALTER TABLE `catatan_perawatan`
  ADD CONSTRAINT `catatan_perawatan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catatan_perawatan_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `databarang`
--
ALTER TABLE `databarang`
  ADD CONSTRAINT `databarang_ibfk_2` FOREIGN KEY (`kdjns`) REFERENCES `jenis` (`kdjns`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_3` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_4` FOREIGN KEY (`kode_industri`) REFERENCES `industrifarmasi` (`kode_industri`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_5` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori_barang` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_6` FOREIGN KEY (`kode_golongan`) REFERENCES `golongan_barang` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `databarang_ibfk_7` FOREIGN KEY (`kode_satbesar`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_pemberian_obat`
--
ALTER TABLE `detail_pemberian_obat`
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_3` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pemberian_obat_ibfk_5` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_periksa_lab`
--
ALTER TABLE `detail_periksa_lab`
  ADD CONSTRAINT `detail_periksa_lab_ibfk_10` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_periksa_lab_ibfk_12` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnosa_pasien`
--
ALTER TABLE `diagnosa_pasien`
  ADD CONSTRAINT `diagnosa_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnosa_pasien_ibfk_2` FOREIGN KEY (`kd_penyakit`) REFERENCES `penyakit` (`kd_penyakit`) ON UPDATE CASCADE;

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_2` FOREIGN KEY (`kd_sps`) REFERENCES `spesialis` (`kd_sps`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dokter_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE;

--
-- Constraints for table `dpjp_ranap`
--
ALTER TABLE `dpjp_ranap`
  ADD CONSTRAINT `dpjp_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dpjp_ranap_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gambar_radiologi`
--
ALTER TABLE `gambar_radiologi`
  ADD CONSTRAINT `gambar_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gudangbarang`
--
ALTER TABLE `gudangbarang`
  ADD CONSTRAINT `gudangbarang_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gudangbarang_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_radiologi`
--
ALTER TABLE `hasil_radiologi`
  ADD CONSTRAINT `hasil_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_pegawai`
--
ALTER TABLE `jadwal_pegawai`
  ADD CONSTRAINT `jadwal_pegawai_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_tambahan`
--
ALTER TABLE `jadwal_tambahan`
  ADD CONSTRAINT `jadwal_tambahan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `jam_jaga`
--
ALTER TABLE `jam_jaga`
  ADD CONSTRAINT `jam_jaga_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan`
--
ALTER TABLE `jns_perawatan`
  ADD CONSTRAINT `jns_perawatan_ibfk_1` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_ibfk_2` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_inap`
--
ALTER TABLE `jns_perawatan_inap`
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_7` FOREIGN KEY (`kd_kategori`) REFERENCES `kategori_perawatan` (`kd_kategori`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_8` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jns_perawatan_inap_ibfk_9` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_lab`
--
ALTER TABLE `jns_perawatan_lab`
  ADD CONSTRAINT `jns_perawatan_lab_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `jns_perawatan_radiologi`
--
ALTER TABLE `jns_perawatan_radiologi`
  ADD CONSTRAINT `jns_perawatan_radiologi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kamar_inap`
--
ALTER TABLE `kamar_inap`
  ADD CONSTRAINT `kamar_inap_ibfk_2` FOREIGN KEY (`kd_kamar`) REFERENCES `kamar` (`kd_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kamar_inap_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_operasi`
--
ALTER TABLE `laporan_operasi`
  ADD CONSTRAINT `laporan_operasi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_dokter_dpjpvclaim`
--
ALTER TABLE `maping_dokter_dpjpvclaim`
  ADD CONSTRAINT `maping_dokter_dpjpvclaim_ibfk_1` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maping_poli_bpjs`
--
ALTER TABLE `maping_poli_bpjs`
  ADD CONSTRAINT `maping_poli_bpjs_ibfk_1` FOREIGN KEY (`kd_poli_rs`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_detailjurnal`
--
ALTER TABLE `mlite_detailjurnal`
  ADD CONSTRAINT `mlite_detailjurnal_ibfk_1` FOREIGN KEY (`no_jurnal`) REFERENCES `mlite_jurnal` (`no_jurnal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_detailjurnal_ibfk_2` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_duitku`
--
ALTER TABLE `mlite_duitku`
  ADD CONSTRAINT `mlite_duitku_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_geolocation_presensi`
--
ALTER TABLE `mlite_geolocation_presensi`
  ADD CONSTRAINT `mlite_geolocation_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mlite_news_tags_relationship`
--
ALTER TABLE `mlite_news_tags_relationship`
  ADD CONSTRAINT `mlite_news_tags_relationship_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `mlite_news` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `mlite_news_tags_relationship_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `mlite_news_tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mlite_pengaduan`
--
ALTER TABLE `mlite_pengaduan`
  ADD CONSTRAINT `mlite_pengaduan_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_pengaduan_detail`
--
ALTER TABLE `mlite_pengaduan_detail`
  ADD CONSTRAINT `mlite_pengaduan_detail_ibfk_1` FOREIGN KEY (`pengaduan_id`) REFERENCES `mlite_pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mlite_rekeningtahun`
--
ALTER TABLE `mlite_rekeningtahun`
  ADD CONSTRAINT `mlite_rekeningtahun_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON UPDATE CASCADE;

--
-- Constraints for table `mlite_subrekening`
--
ALTER TABLE `mlite_subrekening`
  ADD CONSTRAINT `mlite_subrekening_ibfk_1` FOREIGN KEY (`kd_rek`) REFERENCES `mlite_rekening` (`kd_rek`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mlite_subrekening_ibfk_2` FOREIGN KEY (`kd_rek2`) REFERENCES `mlite_rekening` (`kd_rek`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mutasi_berkas`
--
ALTER TABLE `mutasi_berkas`
  ADD CONSTRAINT `mutasi_berkas_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obatbhp_ok`
--
ALTER TABLE `obatbhp_ok`
  ADD CONSTRAINT `obatbhp_ok_ibfk_1` FOREIGN KEY (`kode_sat`) REFERENCES `kodesatuan` (`kode_sat`) ON UPDATE CASCADE;

--
-- Constraints for table `opname`
--
ALTER TABLE `opname`
  ADD CONSTRAINT `opname_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opname_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paket_operasi`
--
ALTER TABLE `paket_operasi`
  ADD CONSTRAINT `paket_operasi_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_3` FOREIGN KEY (`kd_kec`) REFERENCES `kecamatan` (`kd_kec`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_4` FOREIGN KEY (`kd_kab`) REFERENCES `kabupaten` (`kd_kab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_5` FOREIGN KEY (`perusahaan_pasien`) REFERENCES `perusahaan_pasien` (`kode_perusahaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_6` FOREIGN KEY (`suku_bangsa`) REFERENCES `suku_bangsa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_7` FOREIGN KEY (`bahasa_pasien`) REFERENCES `bahasa_pasien` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_8` FOREIGN KEY (`cacat_fisik`) REFERENCES `cacat_fisik` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_9` FOREIGN KEY (`kd_prop`) REFERENCES `propinsi` (`kd_prop`) ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`jnj_jabatan`) REFERENCES `jnj_jabatan` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_10` FOREIGN KEY (`kode_kelompok`) REFERENCES `kelompok_jabatan` (`kode_kelompok`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_11` FOREIGN KEY (`kode_resiko`) REFERENCES `resiko_kerja` (`kode_resiko`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_3` FOREIGN KEY (`bidang`) REFERENCES `bidang` (`nama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_4` FOREIGN KEY (`stts_wp`) REFERENCES `stts_wp` (`stts`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_5` FOREIGN KEY (`stts_kerja`) REFERENCES `stts_kerja` (`stts`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_6` FOREIGN KEY (`pendidikan`) REFERENCES `pendidikan` (`tingkat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_7` FOREIGN KEY (`indexins`) REFERENCES `departemen` (`dep_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_8` FOREIGN KEY (`bpd`) REFERENCES `bank` (`namabank`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_ibfk_9` FOREIGN KEY (`kode_emergency`) REFERENCES `emergency_index` (`kode_emergency`) ON UPDATE CASCADE;

--
-- Constraints for table `pemeriksaan_ralan`
--
ALTER TABLE `pemeriksaan_ralan`
  ADD CONSTRAINT `pemeriksaan_ralan_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ralan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemeriksaan_ranap`
--
ALTER TABLE `pemeriksaan_ranap`
  ADD CONSTRAINT `pemeriksaan_ranap_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_ranap_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  ADD CONSTRAINT `pengajuan_cuti_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_cuti_ibfk_2` FOREIGN KEY (`nik_pj`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE;

--
-- Constraints for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD CONSTRAINT `penyakit_ibfk_1` FOREIGN KEY (`kd_ktg`) REFERENCES `kategori_penyakit` (`kd_ktg`) ON UPDATE CASCADE;

--
-- Constraints for table `periksa_lab`
--
ALTER TABLE `periksa_lab`
  ADD CONSTRAINT `periksa_lab_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_11` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_12` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_13` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_lab_ibfk_9` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `periksa_radiologi`
--
ALTER TABLE `periksa_radiologi`
  ADD CONSTRAINT `periksa_radiologi_ibfk_4` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_5` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_7` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_radiologi_ibfk_8` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_detail_permintaan_lab`
--
ALTER TABLE `permintaan_detail_permintaan_lab`
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_3` FOREIGN KEY (`id_template`) REFERENCES `template_laboratorium` (`id_template`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_detail_permintaan_lab_ibfk_4` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_lab`
--
ALTER TABLE `permintaan_lab`
  ADD CONSTRAINT `permintaan_lab_ibfk_2` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_lab_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_pemeriksaan_lab`
--
ALTER TABLE `permintaan_pemeriksaan_lab`
  ADD CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_lab` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_pemeriksaan_lab_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_pemeriksaan_radiologi`
--
ALTER TABLE `permintaan_pemeriksaan_radiologi`
  ADD CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_1` FOREIGN KEY (`noorder`) REFERENCES `permintaan_radiologi` (`noorder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_pemeriksaan_radiologi_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_radiologi` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permintaan_radiologi`
--
ALTER TABLE `permintaan_radiologi`
  ADD CONSTRAINT `permintaan_radiologi_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_radiologi_ibfk_3` FOREIGN KEY (`dokter_perujuk`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personal_pasien`
--
ALTER TABLE `personal_pasien`
  ADD CONSTRAINT `personal_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nik`) ON UPDATE CASCADE,
  ADD CONSTRAINT `petugas_ibfk_5` FOREIGN KEY (`kd_jbtn`) REFERENCES `jabatan` (`kd_jbtn`) ON UPDATE CASCADE;

--
-- Constraints for table `prosedur_pasien`
--
ALTER TABLE `prosedur_pasien`
  ADD CONSTRAINT `prosedur_pasien_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prosedur_pasien_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `icd9` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_dr`
--
ALTER TABLE `rawat_inap_dr`
  ADD CONSTRAINT `rawat_inap_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_dr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_dr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_drpr`
--
ALTER TABLE `rawat_inap_drpr`
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rawat_inap_pr`
--
ALTER TABLE `rawat_inap_pr`
  ADD CONSTRAINT `rawat_inap_pr_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_pr_ibfk_6` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_inap` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_inap_pr_ibfk_7` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_dr`
--
ALTER TABLE `rawat_jl_dr`
  ADD CONSTRAINT `rawat_jl_dr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_dr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_dr_ibfk_5` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_drpr`
--
ALTER TABLE `rawat_jl_drpr`
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_2` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_3` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_drpr_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rawat_jl_pr`
--
ALTER TABLE `rawat_jl_pr`
  ADD CONSTRAINT `rawat_jl_pr_ibfk_10` FOREIGN KEY (`nip`) REFERENCES `petugas` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_pr_ibfk_8` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rawat_jl_pr_ibfk_9` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reg_periksa`
--
ALTER TABLE `reg_periksa`
  ADD CONSTRAINT `reg_periksa_ibfk_3` FOREIGN KEY (`kd_poli`) REFERENCES `poliklinik` (`kd_poli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_6` FOREIGN KEY (`kd_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_periksa_ibfk_7` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `rekap_presensi`
--
ALTER TABLE `rekap_presensi`
  ADD CONSTRAINT `rekap_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter`
--
ALTER TABLE `resep_dokter`
  ADD CONSTRAINT `resep_dokter_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter_racikan`
--
ALTER TABLE `resep_dokter_racikan`
  ADD CONSTRAINT `resep_dokter_racikan_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_racikan_ibfk_2` FOREIGN KEY (`kd_racik`) REFERENCES `metode_racik` (`kd_racik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_dokter_racikan_detail`
--
ALTER TABLE `resep_dokter_racikan_detail`
  ADD CONSTRAINT `resep_dokter_racikan_detail_ibfk_1` FOREIGN KEY (`no_resep`) REFERENCES `resep_obat` (`no_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_dokter_racikan_detail_ibfk_2` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `resep_obat_ibfk_3` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resep_obat_ibfk_4` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_barang_medis`
--
ALTER TABLE `riwayat_barang_medis`
  ADD CONSTRAINT `riwayat_barang_medis_ibfk_1` FOREIGN KEY (`kode_brng`) REFERENCES `databarang` (`kode_brng`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_barang_medis_ibfk_2` FOREIGN KEY (`kd_bangsal`) REFERENCES `bangsal` (`kd_bangsal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skdp_bpjs`
--
ALTER TABLE `skdp_bpjs`
  ADD CONSTRAINT `skdp_bpjs_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `skdp_bpjs_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tambahan_biaya`
--
ALTER TABLE `tambahan_biaya`
  ADD CONSTRAINT `tambahan_biaya_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `reg_periksa` (`no_rawat`) ON UPDATE CASCADE;

--
-- Constraints for table `template_laboratorium`
--
ALTER TABLE `template_laboratorium`
  ADD CONSTRAINT `template_laboratorium_ibfk_1` FOREIGN KEY (`kd_jenis_prw`) REFERENCES `jns_perawatan_lab` (`kd_jenis_prw`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temporary_presensi`
--
ALTER TABLE `temporary_presensi`
  ADD CONSTRAINT `temporary_presensi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pegawai` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
