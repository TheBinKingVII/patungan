import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterButton({
    super.key,
    required this.qty,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. TOMBOL MINUS (Outline Merah/Pink)
        InkWell(
          onTap: onDecrement,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD64E56), width: 1.5), // Outline Merah
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove, color: Color(0xFFD64E56), size: 20),
          ),
        ),

        // 2. ANGKA (Tengah)
        SizedBox(width: 16), // Jarak kiri kanan
        Text(
          "$qty",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(width: 16),

        // 3. TOMBOL PLUS (Gradient Pink-Kuning)
        InkWell(
          onTap: onIncrement,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFAA2F6A), // Pink Tua
                  Color(0xFFD64E56), // Merah/Pink
                  Color(0xFFEEBE4B), // Kuning Emas
                ],
              ),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}