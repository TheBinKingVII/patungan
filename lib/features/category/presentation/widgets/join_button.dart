import 'package:flutter/material.dart';

class JoinButton extends StatelessWidget {
  final String? label;
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final bool isFilled;
  final bool isGradient;

  const JoinButton({
    super.key,
    this.label,
    this.height,
    this.onPressed,
    this.textStyle,
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
      height: height ?? 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 10),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? 'Join Now',
          style: textStyle ?? 
              theme.textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
