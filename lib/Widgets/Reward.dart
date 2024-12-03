import 'package:flutter/material.dart';

class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Image.asset(
            'Assets/Reward.png',
            height: 80,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'TIX',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'VIP',
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 146, 206, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Add this to prevent unbounded width error
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        "Jadilah TIX VIP 🌟 Dapatkan untung lebih 🤩",
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Icon(
                        Icons.arrow_forward_ios,
                      color: const Color.fromARGB(255, 159, 147, 147),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
