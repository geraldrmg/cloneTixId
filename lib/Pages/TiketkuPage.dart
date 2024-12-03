import 'package:clone_tix_id/Pages/TicketDetailPage.dart';
import 'package:flutter/material.dart';
import 'TicketDetailPage.dart'; 

class TiketkuPage extends StatelessWidget {
  const TiketkuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiketku'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card Film 1
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman TicketDetailPage ketika card ini ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailPage(
                      movieTitle: "Avengers: Infinity War",
                      genre: "Action - English",
                      cinema: "Paris Van Java",
                      dateTime: "Sat 21, 12:20",
                      seatNumber: "B3, B4",
                      orderId: "22081996",
                      userName: "Angga Risky",
                      price: "Rp 180.409",
                      imageUrl: "avengers.jpg", 
                    ),
                  ),
                );
              },
              child: MovieCard(
                movieTitle: "Avengers: Infinity War",
                genre: "Action - English",
                ageRating: "D 17+",
                rating: "7/10",
                imageUrl: "avengers.jpg", 
              ),
            ),
            // Card Film 2
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman TicketDetailPage ketika card ini ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailPage(
                      movieTitle: "Spiderman: No Way Home",
                      genre: "Action - Adventure",
                      cinema: "Cinema XXI",
                      dateTime: "Sun 22, 14:30",
                      seatNumber: "A1, A2",
                      orderId: "22082000",
                      userName: "Dewi Lestari",
                      price: "Rp 150.000",
                      imageUrl: "spiderman.jpg", 
                    ),
                  ),
                );
              },
              child: MovieCard(
                movieTitle: "Spiderman: No Way Home",
                genre: "Action - Adventure",
                ageRating: "R 13+",
                rating: "8.5/10",
                imageUrl: "spiderman.jpg", 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieTitle;
  final String genre;
  final String ageRating;
  final String rating;
  final String imageUrl;

  const MovieCard({
    Key? key,
    required this.movieTitle,
    required this.genre,
    required this.ageRating,
    required this.rating,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    genre,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          ageRating,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
