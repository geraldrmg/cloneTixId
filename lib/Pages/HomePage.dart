import 'package:flutter/material.dart';
import 'package:clone_tix_id/Pages/Bioskop.dart';
import 'package:clone_tix_id/Widgets/Surabaya.dart';
import 'package:clone_tix_id/Widgets/Reward.dart';
import 'package:clone_tix_id/Widgets/SedangTayang.dart';
import 'package:clone_tix_id/Widgets/Spotlight.dart';
import 'package:clone_tix_id/Widgets/TixNow.dart';
import 'package:clone_tix_id/Widgets/search.dart';
import 'package:clone_tix_id/Widgets/Promosi.dart';
import 'package:clone_tix_id/Pages/TiketPage.dart';   
import 'package:clone_tix_id/Pages/TiketkuPage.dart'; 

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView( // Pastikan menggunakan SingleChildScrollView di halaman Beranda
      child: Column(
        children: [
          Surabaya(),
          Promosi(),
          Reward(),
          SedangTayang(),
          Spotlight(),
          Tixnow(),
        ],
      ),
    ),
    BioskopPage(), // Halaman Bioskop
    TiketPage(),   // Halaman Tiket
    TiketkuPage(), // Halaman Tiketku
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBars(),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex], // Tampilkan halaman berdasarkan index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Bioskop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Tiketku',
          ),
        ],
        selectedItemColor: Colors.blue, // Warna saat dipilih
        unselectedItemColor: Colors.grey, // Warna saat tidak dipilih
        showUnselectedLabels: true,
      ),
    );
  }
}
