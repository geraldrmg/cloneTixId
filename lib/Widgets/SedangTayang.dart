import 'package:flutter/material.dart';
import 'package:clone_tix_id/Pages/MovieDetailPage.dart';

class SedangTayang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Text(
                'Sedang Tayang',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Menampilkan semua film!"),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text(
                      "Semua",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_circle_right, color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Tabs Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTab("Semua Film", isActive: true),
                const SizedBox(width: 10),
                _buildTab("XXI"),
                const SizedBox(width: 10),
                _buildTab("CGV"),
                const SizedBox(width: 10),
                _buildTab("Cinepolis"),
                const SizedBox(width: 10),
                _buildTab("❤️ Watchlist"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Movie List Section
        Container(
          height: 450,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildMovieCard(
                context,
                'assets/Movie.png', 
                'Bila Esok Ibu Tiada',
                'Drama',
                '⭐ 9.2',
                'Film drama menyentuh tentang keluarga.',
                [
                  {'name': 'Slamet Rahardjo', 'image': 'rahardjo.jpg'},
                  {'name': 'Christine Hakim.', 'image': 'christine.jpg'},
                ],
              ),
              _buildMovieCard(
                context,
                'sherina.jpg', // Pastikan asset ini ada di pubspec.yaml
                'Petualangan Sherina 2',
                'Petualangan',
                '⭐ 8.9',
                'Sekuel petualangan seru yang penuh nostalgia.',
                [
                  {'name': 'Sherina Munaf', 'image': 'munaf.jpg'},
                  {'name': 'Derby Romero', 'image': 'romero.jpg'},
                ],
              ),
              _buildMovieCard(
                context,
                'juki.jpg', // Pastikan asset ini ada di pubspec.yaml
                'Si Juki The Movie',
                'Animasi',
                '⭐ 8.5',
                'Animasi lokal penuh humor dan cerita menarik.',
                [
                  {'name': 'Faza Meonk', 'image': 'faza.jpg'},
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
    String image,
    String title,
    String genre,
    String rating,
    String description,
    List<Map<String, String>> castAndCrew, // Adding Cast and Crew data
  ) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail film
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(
              judulFilm: title,
              genre: genre,
              rating: rating,
              deskripsi: description,
              gambarUrl: image,
              castAndCrew: castAndCrew, // Pass the cast data here
            ),
          ),
        );
      },
      child: Container(
        width: 270,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            const SizedBox(height: 8),
            // Movie Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Movie Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
