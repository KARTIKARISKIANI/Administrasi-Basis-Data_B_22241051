-- nama : kartika riskiani
-- NIM : 22241051
-- Modul 1

-- menggunakan database undikma_mart 
use uas;

-- mengambil 1 data nama_produk dari tabel ms_produk_dqlab
SELECT nama_produk FROM ms_produk_dqlab;

-- mengambil lebih dari satu kolom
SELECT nama_produk, harga FROM ms_produk_dqlab;
-- mengambil seluruh kolom tabel
SELECT * FROM ms_produk_dqlab;
-- LATIHAN
-- 1. mengambil kolom kode_produk, nama_produk dari tabel ms_produk

-- 2. mengambil seluruh kolom dari tabel tr_penjualan
SELECT * FROM tr_penjualan_dqlab;

-- ALIAS & PREFIX
-- Contoh PREFIX
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

SELECT undikma_mart.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- contoh ALIAS
SELECT nama_produk as np FROM ms_produk_dqlab;
SELECT nama_produk np FROM ms_produk_dqlab;

-- contoh ALIAS didalam tabel
SELECT nama_produk FROM ms_produk_dqlab as mpl;

-- contoh penggunaan ALIAS di PREFIX
SELECT mpl.nama_produk FROM ms_produk_dqlab as mpl;

-- case 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan_dqlab;
-- case 2
SELECT nama_produk, harga FROM ms_produk_dqlab;
