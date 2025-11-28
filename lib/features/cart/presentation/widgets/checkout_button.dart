import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isFilled;
  final bool isGradient;

  const CheckoutButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isFilled = true,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
    );
    final theme = Theme.of(context);

    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: gradient,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 10),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
