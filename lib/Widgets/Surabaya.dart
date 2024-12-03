import 'package:flutter/material.dart';

class Surabaya extends StatefulWidget {
  @override
  _SurabayaState createState() => _SurabayaState();
}

class _SurabayaState extends State<Surabaya> with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Membuat animasi untuk expand/collapse
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1), // Mulai dari atas
      end: Offset(0, 0), // Berhenti di posisi normal
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          // Row untuk header lokasi
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (_isExpanded) {
                  _controller.forward(); // Animasi expand
                } else {
                  _controller.reverse(); // Animasi collapse
                }
              });
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                  size: 35,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SURABAYA',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.blueAccent,
                  size: 35,
                ),
              ],
            ),
          ),
          
          // Konten yang muncul ketika expanded dengan animasi
          SlideTransition(
            position: _slideAnimation,
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(left: 40, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBioskopOption("CITO XXI"),
                        _buildBioskopOption("TUNJUNGAN XXI"),
                        _buildBioskopOption("GRAND CITY XXI"),
                        _buildBioskopOption("LENMARC XXI"),
                        _buildBioskopOption("MARVELL CITY XXI"),
                        _buildBioskopOption("PAKUWON MALL XXI"),
                        _buildBioskopOption("ROYAL PLAZA XXI"),
                        _buildBioskopOption("SURABAYA TOWN SQUARE XXI"),
                      ],
                    ),
                  )
                : Container(), // Tidak tampil jika collapsed
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat pilihan bioskop dengan style yang lebih elegan
  Widget _buildBioskopOption(String bioskop) {
    return GestureDetector(
      onTap: () {
        // Aksi saat memilih bioskop
        print("Bioskop yang dipilih: $bioskop");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blueAccent, width: 1.5), // Border elegan
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4), // Shadow lebih halus
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blueAccent,
                size: 18,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  bioskop,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueAccent,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
