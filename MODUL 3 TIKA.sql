-- Nama : KARTIKA RISKIANI
-- NIM : 22241051
-- Modul 3

-- Menggunakan Database
use mart_undikma;

-- ORDER BY
-- Menggambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty;

-- Menggambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qtty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty, nama_produk;

-- Latihan dengan berbagai pengurutan dengan ORDER BY dengan kriteria berikut
SELECT * FROM tr_penjualan_dqlab qty ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab qty ORDER BY nama_pelanggan;
SELECT * FROM ms_pelanggan_dqlab qty ORDER BY alamat;

-- Menggambil kolom nama produk dan qty dari penjualan urutkan berdasarkan qty dan nama produk besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan_dqlab
ORDER BY qty DESC, nama_produk DESC;

-- Latihandengan mencoba berbagi pengurutan dengan ORDER BY dengan kriteria berikut
SELECT * FROM tr_penjualan_dqlab qty ORDER BY tgl_transaksi DESC;
SELECT * FROM ms_pelanggan_dqlab qty ORDER BY nama_pelanggan DESC;
SELECT * FROM ms_pelanggan_dqlab qty ORDER BY alamat DESC;

-- Menggambil nama produk, qty, harga, dan total bayar urutkan berdasarkan total bayar
SELECT nama_produk, qty, harga, qty*harga AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY qty*harga DESC;

-- Latihan Mandiri pengurutan dengan ekspresi total harga
SELECT nama_produk, qty, harga,
diskon_persen,(diskon_persen/100)*harga AS diskon,
qty*(harga - (diskon_persen/100)*harga) AS total_bayar
FROM tr_penjualan_dqlab
ORDER BY total_bayar DESC;

SELECT * FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
ORDER BY harga DESC;

-- No 2
SELECT nama_produk, qty, harga
FROM tr_penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;

-- No 3
SELECT nama_produk, qty, harga
FROM tr_penjualan_dqlab
WHERE harga >= 100000 OR nama_produk LIKE'T%'
ORDER BY diskon_persen DESC;

-- FUNGSI AGREASI
-- Hitung total qty dari tabel penjualan
SELECT min(harga) FROM tr_penjualan_dqlab;

-- Hitung seluruh row dari tabel penjualan
SELECT count(*) FROM tr_penjualan_dqlab;

-- Hitung jumlah qty dan jumlah row dari tabel penjualan
SELECT SUM(qty) AS tolal_QTY, count(*) AS total_row FROM tr_penjualan_dqlab;

-- Hitung rata-rata, nilai maksimum, dan nilai minimum dari qty tabel penjualan
SELECT AVG() FROM tr_penjualan_dqlab;

-- Hitung jumlah nilai untuk unik dari nama produk di tabel penjualan
SELECT count(distinct nama_produk) FROM tr_penjualan_dqlab;

-- Menampilkanjumlah seluruh row dan jumlah unik dari nama produk ditabel penjualan
SELECT count(*), count(distinct nama_produk) FROM tr_penjualan_dqlab;

SELECT count(*), count(distinct nama_produk), nama_produk FROM tr_penjualan_dqlab;

-- GROUP BY
-- Kelompokkan nilai dari nama produk di tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;
SELECT nama_produk FROM tr_penjualan_dqlab;

-- Kelompokkan nilai dari nama produk dari dan qty di tabel penjualan
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;

-- GROUP BY + Fungsi Agregasi
-- Ambil jumlah qtr dari hasil pengkelompokkan nama_produk di tabel penjualan
SELECT nama_produk, sum(qty) 
FROM tr_penjualan_dqlab
GROUP BY nama_produk;

-- GROUP BY + Fungsi Agregasi
-- Ambil jumlah qtr dari hasil pengkelompokkan nama_produk di tabel penjualan urutan besar kecilnya
SELECT nama_produk, sum(qty) 
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY sum(qty) DESC;

-- HAVING
-- Menggambil jumlah qty >2 dari hasil pengkelompokkan nama produk
SELECT nama_produk, sum(qty) 
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING sum(qty) > 2
ORDER BY sum(qty) DESC;

-- Latihan Mandiri
-- Buat query 
SELECT nama_produk, sum(qty)
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING sum(qty) > 4 
ORDER BY sum(qty) DESC;

-- No 3
SELECT nama_produk, sum(qty)*(harga-(diskon_persen/100)*harga)
AS total_bayar
FROM tr_penjualan_dqlab
GROUP BY nama_produk 
ORDER BY sum(qty)DESC;
