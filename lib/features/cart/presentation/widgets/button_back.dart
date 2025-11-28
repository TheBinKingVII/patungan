import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  final Color color; 
  final double size; 
  final VoidCallback onPressed; 

  const ButtonBack({
    super.key,
    this.color = Colors.black,
    this.size = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: color,
        size: 20,
      ),
      splashRadius: 24,
    );
  }
}
