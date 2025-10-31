import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  final String? message; 
  final String actionText;
  final VoidCallback onTap;
  final bool useGradient; 
  final Color? color;

  const GradientTextButton({
    super.key,
    this.message,
    required this.actionText,
    required this.onTap,
    this.useGradient = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
    );

    final textTheme = Theme.of(context).textTheme.labelLarge;

    final Color defaultColor = color ?? const Color(0xFF19395B);

    final Widget actionWidget = useGradient
        ? ShaderMask(
            shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              actionText,
              style: textTheme?.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white, 
              ),
            ),
          )
        : Text(
            actionText,
            style: textTheme?.copyWith(
              fontWeight: FontWeight.w900,
              color: defaultColor,
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
