import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  final String? message; 
  final String actionText;
  final VoidCallback onTap;
  final bool useGradient; 

  const GradientTextButton({
    super.key,
    this.message,
    required this.actionText,
    required this.onTap,
    this.useGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
    );

    final textTheme = Theme.of(context).textTheme.labelLarge;

    final Widget actionWidget = useGradient
        ? ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              actionText,
              style: textTheme?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white, // penting biar shader keliatan
              ),
            ),
          )
        : Text(
            actionText,
            style: textTheme?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFFAA2F6A),
            ),
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (message != null) Text(message!, style: textTheme),
        GestureDetector(onTap: onTap, child: actionWidget),
      ],
    );
  }
}
