import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginRow extends StatelessWidget {
  final String label; // teks di tengah
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  const SocialLoginRow({
    super.key,
    this.label = 'or continue with',
    this.onFacebookPressed,
    this.onGooglePressed,
    this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 20,
          children: [
            const Expanded(
              child: Divider(color: Color(0x7F1A385B)),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Expanded(
              child: Divider(color: Color(0x7F1A385B)),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.grey),
              ),
              onPressed: onFacebookPressed,
              child: const Icon(
                Icons.facebook,
                color: Color(0xFF1877F2),
                size: 30,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.grey),
              ),
              onPressed: onGooglePressed,
              child: SvgPicture.asset('assets/images/google_logo.svg'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.grey),
              ),
              onPressed: onApplePressed,
              child: const Icon(Icons.apple, color: Colors.black, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
