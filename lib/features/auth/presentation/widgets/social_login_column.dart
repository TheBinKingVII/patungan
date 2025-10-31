import 'package:flutter/material.dart';

class SocialLoginColumn extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  const SocialLoginColumn({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: const Color(0x7F19385B),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}