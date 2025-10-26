import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patungan/features/auth/presentation/pages/sign_up_page.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';

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
          Image.asset('assets/images/Frame 1000001085.png', fit: BoxFit.fitWidth,),

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

                SizedBox(height: 70),
                Column(
                  children: [
                    // Button Continue with Facebook
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0x7F19385B),
                          width: 1,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Color(0xFF1877F2),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Continue with Facebook',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),

                    // Button Continue with Google
                    SizedBox(height: 26),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0x7F19385B),
                          width: 1,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/google_logo.svg'),
                          SizedBox(width: 10),
                          Text(
                            'Continue with Google',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),

                    // Button Continue with Apple
                    SizedBox(height: 26),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0x7F19385B),
                          width: 1,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.apple, color: Colors.black, size: 30),
                          SizedBox(width: 10),
                          Text(
                            'Continue with Apple',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Text or
                SizedBox(height: 40),
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
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(0xFFAA2F6A),
                        const Color(0xFFD64E56),
                        const Color(0xFFEEBE4B),
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Sign in with password',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                // Text Don't have an account? signn up
                SizedBox(height: 20),
                GradientTextButton(
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
