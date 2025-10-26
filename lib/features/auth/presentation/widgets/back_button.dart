import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final Color color; // warna ikon
  final double size; // ukuran ikon
  final VoidCallback? onPressed; // custom action (opsional)

  const AppBackButton({
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
        Icons.arrow_back_rounded,
        color: color,
        size: size,
      ),
      splashRadius: 24, // biar efek tap-nya pas
    );
  }
}
