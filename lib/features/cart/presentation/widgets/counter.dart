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
        // TOMBOL MINUS 
        InkWell(
          onTap: onDecrement,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5), // Outline Merah
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove, color:Theme.of(context).colorScheme.primary, size: 20),
          ),
        ),

        // ANGKA 
        SizedBox(width: 16),
        Text(
          "$qty",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(width: 16),

        // TOMBOL PLUS 
        InkWell(
          onTap: onIncrement,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}