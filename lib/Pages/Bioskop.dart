import 'package:flutter/material.dart';
import '../Widgets/BioskopWidget.dart';
import '../Widgets/Surabaya.dart';

class BioskopPage extends StatelessWidget {
  const BioskopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Surabaya(),
                automaticallyImplyLeading: false, // Menghapus ikon default back

        
      ),
            body: const BioskopWidget(), // Menggunakan widget dari file terpisah

    );
  }
}
