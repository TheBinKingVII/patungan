import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isFilled;
  final bool isGradient;

  const CustomElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isFilled = true,
    this.isGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
    );
    final theme = Theme.of(context);

    final bool isCurrentlyGradient = isGradient;

    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: isCurrentlyGradient ? gradient : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCurrentlyGradient
              ? Colors.transparent
              : (isFilled ? const Color(0xFF19395B) : Colors.transparent),

          minimumSize: const Size(double.infinity, 48),
          side: isCurrentlyGradient
              ? null
              : (isFilled
                    ? null
                    : const BorderSide(color: Color(0xFF19395B), width: 1.5)),
          elevation: isCurrentlyGradient ? 0 : (isFilled ? 2 : 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isCurrentlyGradient
                ? Colors.white
                : (isFilled ? Colors.white : const Color(0xFF19395B)),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
