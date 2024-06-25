-- Nama : Kartika Riskiani
-- Nim : 22241051
-- Modul 5

-- menggunakan database
use undikma_mart;

-- JOIN
-- tampilkan nama pelanggan beserta qty belanjanya
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- JOIN tanpa filtering = CROSS JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp JOIN tr_penjualan_dqlab AS tp
ON true;

-- INNER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM ms_pelanggan_dqlab AS mp INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan;

-- LEFT OUTER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, qty
FROM tr_penjualan_dqlab AS tp LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- RIGHT OUTER JOIN
SELECT tp.kode_pelanggan, mp.nama_pelanggan, qty
FROM tr_penjualan_dqlab AS tp RIGHT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- LEFT OUTER JOIN untuk 3 tabel
-- tampilkan nama pelanggan, nama produk yang dibeli, kategori produk yang dibeli, nama produk dan qty belanjanya
SELECT mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON tp.kode_produk = mpd.kode_produk;

-- Order bye
SELECT mp.nama_pelanggan, mpd.kategori_produk, mpd.nama_produk, tp.qty
FROM tr_penjualan_dqlab AS tp
LEFT OUTER JOIN ms_pelanggan_dqlab AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan
LEFT OUTER JOIN ms_produk_dqlab AS mpd
ON tp.kode_produk = mpd.kode_produk;


-- GROUPING dan FUNGSI AGREGASI pada JOIN
-- tampilkan kategori produk, nama produk, dan jumlah qty yang dikelompokkan kategori dan nama produk
SELECT mpd.kategori_produk, mpd.nama_produk, sum(tp.qty) AS jumlah_qty_terjual
FROM ms_produk_dqlab AS mpd
LEFT OUTER JOIN tr_penjualan_dqlab AS tp
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk, mpd.nama_produk
Having sum(tp.qyt) is null
ORDER BY sum(tp.qty) DESC;

