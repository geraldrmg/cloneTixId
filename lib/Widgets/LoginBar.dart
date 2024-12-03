import 'package:flutter/material.dart';

class Loginbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Text(
              "Daftar TIX ID",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
