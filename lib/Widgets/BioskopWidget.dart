import 'package:flutter/material.dart';

class BioskopWidget extends StatelessWidget {
  const BioskopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bioskopList = [
      "CITO XXI",
      "TUNJUNGAN XXI",
      "GRAND CITY XXI",
      "LENMARC XXI",
      "MARVELL CITY XXI",
      "PAKUWON MALL XXI",
      "ROYAL PLAZA XXI",
      "SURABAYA TOWN SQUARE XXI",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.blue[700], size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Tandai bioskop favoritmu!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Bioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Info Button
        Center(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Pesan dipahami!")),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Mengerti",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Bioskop List Section
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: bioskopList.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Detail untuk ${bioskopList[index]} akan segera tersedia!"),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.star_border, color: Colors.grey),
                  title: Text(
                    bioskopList[index],
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
