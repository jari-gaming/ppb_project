import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_final/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> movies = const [
    {"title": "Judul Film Pertama", "rating": 4.5},
    {"title": "Judul Film Kedua", "rating": 4.2},
    {"title": "Judul Film Ketiga", "rating": 4.8},
    {"title": "Judul Film Keempat", "rating": 3.9},
  ];

  String selectedGenre = "Semua";
  final List<Map<String, dynamic>> allMovies = const [
    {"title": "Judul Film Pertama", "rating": 4.5, "genre": "Aksi"},
    {"title": "Judul Film Kedua", "rating": 4.2, "genre": "Komedi"},
    {"title": "Judul Film Ketiga", "rating": 4.8, "genre": "Horor"},
    {"title": "Judul Film Keempat", "rating": 3.9, "genre": "Aksi"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredMovies = selectedGenre == "Semua"
        ? allMovies
        : allMovies.where((movie) => movie['genre'] == selectedGenre).toList();
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.pink,
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
      //     BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text('Selamat Datang !', style: TextStyle(fontSize: 12)),
                ],
              ),
              const Text(
                'Aden Hendrawan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Film Unggulan',
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(height: 4),
                    Text('Judul Film Unggulan',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildGenreButton("Semua"),
                  buildGenreButton("Aksi"),
                  buildGenreButton("Komedi"),
                  buildGenreButton("Horor"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Sedang Tayang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 230,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            title: movie['title'],
                            rating: movie['rating'],
                          ),
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
                              'https://picsum.photos/200?image=${index + 10}',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          movie['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(movie['rating'].toString()),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenreButton(String label) {
    final bool isSelected = selectedGenre == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGenre = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Widget genreButton(String label, bool isSelected) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Colors.pink : Colors.grey[200],
  //       borderRadius: BorderRadius.circular(30),
  //     ),
  //     child: Text(
  //       label,
  //       style: TextStyle(
  //         color: isSelected ? Colors.white : Colors.black87,
  //         fontWeight: FontWeight.w600,
  //       ),
  //     ),
  //   );
  // }
}
