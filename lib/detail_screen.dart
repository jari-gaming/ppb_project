import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final double rating;

  const DetailScreen({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("2025 • 85m • Aksi"),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text("$rating / 5"),
                const SizedBox(width: 8),
                const Text("Berdasarkan 132 ulasan"),
                const Spacer(),
                Icon(Icons.favorite_border, color: Colors.pink),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Sinopsis",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              "Ini adalah sinopsis singkat tentang sebuah film yang menceritakan petualangan luar biasa seorang pahlawan yang harus menghadapi rintangan tak terduga untuk menyelamatkan dunia.",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Ulasan Pengguna",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Tambah Ulasan", style: TextStyle(color: Colors.pink)),
              ],
            ),
            const SizedBox(height: 12),
            userReview("Andi Wijaya",
                "Filmnya seru banget, akhirnya keren dan tidak terduga!", 5),
            userReview("Citra Lestari",
                "Salah satu film terbaik tahun ini. Wajib nonton!", 5),
          ],
        ),
      ),
    );
  }

  Widget userReview(String name, String comment, int stars) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(comment),
        Row(
          children: List.generate(
            stars,
            (index) => const Icon(Icons.star, size: 16, color: Colors.amber),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
