import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isFilled; // true = berwarna, false = transparan

  const CustomElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isFilled ? const Color(0xFF19395B) : Colors.transparent,
        minimumSize: const Size(double.infinity, 48),
        side: isFilled
            ? null
            : const BorderSide(color: Color(0xFF19395B), width: 1.5),
        elevation: isFilled ? 2 : 0,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isFilled ? Colors.white : const Color(0xFF19395B),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
