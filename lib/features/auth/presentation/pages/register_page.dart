import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patungan/features/auth/presentation/pages/login_page.dart';
import 'package:patungan/features/auth/presentation/pages/sign_up_page.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login_column.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Image Hands Exchange
          Image.asset('assets/images/hands_exchange.png', fit: BoxFit.fitWidth),
          Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: screenHeight * 0.35,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text Let's you in
                SizedBox(height: 20),
                Text(
                  'Let’s you in',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                // Continue Button
                SizedBox(height: 70),
                Column(
                  children: [
                    SocialLoginColumn(
                      text: 'Continue with Facebook',
                      icon: Icon(
                        Icons.facebook,
                        color: Color(0xFF1877F2),
                        size: 30,
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 26),
                    SocialLoginColumn(
                      text: 'Continue with Google',
                      icon: Padding(
                        padding: EdgeInsets.all(4),
                        child: SvgPicture.asset(
                          'assets/images/google_logo.svg',
                        ),
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 26),
                    SocialLoginColumn(
                      text: 'Continue with Apple',
                      icon: Icon(Icons.apple, color: Colors.black, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Text or
                Row(
                  children: [
                    Expanded(child: Divider(color: const Color(0x7F1A385B))),
                    SizedBox(width: 20),
                    Text('or', style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(width: 20),
                    Expanded(child: Divider(color: const Color(0x7F1A385B))),
                  ],
                ),

                // Button Sign in with password
                SizedBox(height: 30),
                CustomElevatedButton(
                  isGradient: true,
                  label: 'Sign in with password',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),

                // Text Don't have an account? signn up
                SizedBox(height: 20),
                GradientTextButton(
                  useGradient: false,
                  message: "Don't have an account? ",
                  actionText: 'Sign up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
