import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color color; 
  final double size; 
  final VoidCallback? onPressed; 

  const CustomBackButton({
    super.key,
    this.color = Colors.black,
    this.size = 24,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: color,
        size: 20,
      ),
      splashRadius: 24,
    );
  }
}
