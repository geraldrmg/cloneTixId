import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TiketPage()));
}

class TiketPage extends StatelessWidget {
  const TiketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF76E0DB),
          title: const Text(
            "Film Bioskop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            tabs: [
              Tab(text: "SEDANG TAYANG"),
              Tab(text: "AKAN DATANG"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MovieGrid(tabTitle: "Sedang Tayang"),
            MovieGrid(tabTitle: "Akan Datang"),
          ],
        ),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final String tabTitle;

  const MovieGrid({required this.tabTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        "movieTitle": "Bila Esok Ibu Tiada",
        "genre": "Drama, Keluarga",
        "rating": "9.2/10",
        "imageUrl": "Assets/Movie.png",
        "price": 50000,
        "cinema": "XXI Mall",
        "seat": "A1, A2",
        "time": "Mon 22, 19:00",
        "orderId": "12345678",
      },
      {
        "movieTitle": "Santet Segoro Pitu",
        "genre": "Horror",
        "rating": "9.0/10",
        "imageUrl": "Assets/Tiket.png",
        "price": 60000,
        "cinema": "CGV Paris Van Java",
        "seat": "B3, B4",
        "time": "Sat 21, 12:20",
        "orderId": "22081996",
      },
      {
        "movieTitle": "Gladiator II",
        "genre": "Action, Adventure",
        "rating": "9.5/10",
        "imageUrl": "Assets/Tiket1.png",
        "price": 75000,
        "cinema": "Cinema XXI",
        "seat": "C5, C6",
        "time": "Sun 23, 15:30",
        "orderId": "33445566",
      },
      {
        "movieTitle": "Red One",
        "genre": "Action, Adventure",
        "rating": "9.3/10",
        "imageUrl": "Assets/Tiket2.png",
        "price": 70000,
        "cinema": "IMAX",
        "seat": "D7, D8",
        "time": "Fri 20, 20:00",
        "orderId": "44556677",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.68,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return InteractiveMovieCard(
            movieData: movie,
          );
        },
      ),
    );
  }
}

class InteractiveMovieCard extends StatelessWidget {
  final Map<String, dynamic> movieData;

  const InteractiveMovieCard({required this.movieData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(movieData: movieData),
          ),
        );
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Sudut lebih melengkung
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(movieData["imageUrl"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieData["movieTitle"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movieData["genre"],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        movieData["rating"],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final Map<String, dynamic> movieData;

  const CheckoutPage({required this.movieData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = movieData["price"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Movie"),
        backgroundColor: const Color.fromARGB(255, 50, 50, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster dan judul film
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movieData["imageUrl"],
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieData["movieTitle"],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movieData["genre"],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 4),
                          Text(
                            movieData["rating"],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Detail lainnya
            Text(
              "ID Order: ${movieData["orderId"]}\nCinema: ${movieData["cinema"]}\nDate & Time: ${movieData["time"]}\nSeat Number: ${movieData["seat"]}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Total pembayaran
            Text(
              "Price: Rp ${movieData["price"]}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            // Tombol Checkout
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika checkout
                },
                child: const Text("Checkout Now"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: const Color(0xFF76E0DB), // Warna merah dengan hex
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Tombol dengan sudut lebih melengkung
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
