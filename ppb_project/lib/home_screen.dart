// lib/home_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_final/detail_screen.dart';
import 'package:project_final/movie.dart'; // Impor model yang baru dibuat

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk menampung daftar film dari API
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk mengambil data saat halaman pertama kali dimuat
    futureMovies = fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    // PENTING: Alamat URL untuk API Lokal
    // Gunakan 'http://10.0.2.2:3000/api/movies' jika Anda menjalankan di Emulator Android
    // Gunakan 'http://localhost:3000/api/movies' jika Anda menjalankan di Chrome/Desktop/iOS Simulator
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3000/api/movies'));

    if (response.statusCode == 200) {
      // Jika server mengembalikan respons OK (200),
      // maka parse JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      // Jika server tidak mengembalikan respons OK,
      // lempar exception.
      throw Exception('Gagal memuat data film');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Selamat Datang !', style: TextStyle(fontSize: 12)),
              const Text(
                'Aden Hendrawan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("Film Populer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),

              // Gunakan FutureBuilder untuk menampilkan data dari API
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: futureMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Tampilkan loading indicator saat data sedang diambil
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Tampilkan pesan error jika terjadi kesalahan
                      return Center(child: Text('${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      // Jika data berhasil didapat, tampilkan dalam GridView
                      final movies = snapshot.data!;
                      return GridView.builder(
                        itemCount: movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: () {
                              // AKTIFKAN NAVIGASI: Pindah ke DetailScreen dan kirim objek 'movie'
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(movie: movie),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      movie.posterUrl, // Gunakan URL dari API
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Center(
                                            child: Icon(Icons.movie));
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  movie.title,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text('${movie.year}'),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("Tidak ada film"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}