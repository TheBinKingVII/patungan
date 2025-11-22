import 'package:flutter/material.dart';

class BuyNowButton extends StatelessWidget {
  final String? label;
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const BuyNowButton({
    super.key,
    this.label,
    this.height,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height ?? 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1.5, color: theme.colorScheme.primary),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 10),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label ?? 'Buy Now',
          style:
              textStyle ??
              theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
