import 'package:flutter/material.dart';

class GradientTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final List<Color>? gradientColors;

  const GradientTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.gradientColors,
  });

  @override
  State<GradientTextFormField> createState() => _GradientTextFormFieldState();
}

class _GradientTextFormFieldState extends State<GradientTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Gradient gradient = LinearGradient(
      colors: widget.gradientColors ??
          const [Color(0xFFE91E63), Color(0xFFFBC02D)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }
}
