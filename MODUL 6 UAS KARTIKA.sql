-- Semester Genap TA. 2023/2024
-- Nama : Kartika Riskiani
-- NIM : 22241051
-- modul 6

-- Soal NIM Ganjil
-- Use database
USE undikma_mart;

-- Saol 1
/* Tampilkan hanya 5 nama produk yang memiliki pendapatan (Revenue) penjualan terbanyak.*/
-- ORDER BY pada JOIN 
-- Jwaban no 1
SELECT nama_produk, SUM(qty * (harga - (diskon_persen / 100) * harga)) AS revenue
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY revenue DESC
LIMIT 5;

-- Soal 2
/* Tampilkan hanya 3 kategori produk, dan total pendapatan (Revenue) yang berstatus Target Achived dengan ketentuan :
jika Revenue >= 900000 = Target Achived
jika Revenue <= 900000 = Less Perfomance
jika tidak keduanya = Follow Up
NB: pakai CASE, dan JOIN
*/
-- jawaban no 2 ada dua jawaban
SELECT 
    p.kode_pelanggan, 
    COUNT(p.kode_transaksi) AS total_order, 
    SUM(p.qty) AS total_quantity, 
    SUM(p.harga * p.qty) AS revenue,
    CASE 
        WHEN SUM(p.harga * p.qty) >= 900000 THEN 'Target Achieved'
        WHEN SUM(p.harga * p.qty) < 900000 THEN 'less performance'
        ELSE 'follow update'
    END AS remark
FROM 
    tr_penjualan_dqlab p
GROUP BY 
    p.kode_pelanggan
ORDER BY 
    CASE 
        WHEN SUM(p.harga * p.qty) >= 900000 THEN 1
        WHEN SUM(p.harga * p.qty) < 900000 THEN 2
        ELSE 3
    END, 
    revenue DESC
LIMIT 3;
SELECT pr.kategori_produk,SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) AS total_revenue
FROM tr_penjualan_dqlab t
LEFT JOIN ms_produk_dqlab pr 
ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk
HAVING CASE 
WHEN SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) >= 90000 THEN 'Target Achieved'
WHEN SUM(t.qty * (t.harga - (t.diskon_persen / 100) * t.harga)) < 90000 THEN 'Less Performance'
ELSE 'Follow Up'
END = 'Follow Up'
ORDER BY total_revenue DESC LIMIT 3;

-- soal 3
/* Jika hari ini adalah tanggal 30 Juni 2020, maka berikan informasi 3 nama produk yang paling lama tidak dibeli oleh pelanggan
(dalam hari) wajib menggunakan JOIN */
-- jawaban no 3
-- Tampilkan semua nama pelanggan, alamat pelanggan yang tidak pernah belanja wajib menggunakan join
SELECT mpd.nama_pelanggan, mpd.alamat
FROM ms_pelanggan_dqlab AS mpd LEFT JOIN tr_penjualan_dqlab AS tp
ON mpd.nama_pelanggan = mpd.alamat
WHERE tp.qty IS NULL;












