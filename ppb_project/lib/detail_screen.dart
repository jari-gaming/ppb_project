// lib/detail_screen.dart

import 'package:flutter/material.dart';
import 'package:project_final/movie.dart'; // Impor model Movie

class DetailScreen extends StatelessWidget {
  // Terima satu objek Movie lengkap
  final Movie movie;

  const DetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // --- HEADER GAMBAR DAN TOMBOL BACK ---
            Stack(
              children: [
                // Container untuk menampilkan gambar poster besar
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.posterUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    // Efek gradien gelap di bawah gambar
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // Judul film di atas gambar
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Tombol kembali
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            
            // --- KONTEN DETAIL ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.year} • Disutradarai oleh ${movie.director}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text("7.8 / 10"), // Rating bisa ditambahkan di API nanti
                      SizedBox(width: 8),
                      Text("Berdasarkan 132 ulasan"),
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.pink),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sinopsis",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Ini adalah sinopsis singkat tentang sebuah film yang menceritakan petualangan luar biasa seorang pahlawan yang harus menghadapi rintangan tak terduga untuk menyelamatkan dunia.",
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ulasan Pengguna",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      // Teks ini bisa ditekan untuk pindah ke halaman "Tulis Ulasan"
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigasi ke halaman "Tulis Ulasan Anda" seperti pada gambar
                          print("Pindah ke halaman tulis ulasan...");
                        },
                        child: const Text(
                          "Tambah Ulasan",
                          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Contoh ulasan (bisa juga dari API nanti)
                  userReview("Andi Wijaya", "Filmnya seru banget, akhirnya keren dan tidak terduga!", 5),
                  userReview("Citra Lestari", "Salah satu film terbaik tahun ini. Wajib nonton!", 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan ulasan pengguna
  Widget userReview(String name, String comment, int stars) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(comment, style: const TextStyle(color: Colors.black87)),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              stars,
              (index) => const Icon(Icons.star, size: 16, color: Colors.amber),
            ),
          ),
          const Divider(height: 16),
        ],
      ),
    );
  }
}