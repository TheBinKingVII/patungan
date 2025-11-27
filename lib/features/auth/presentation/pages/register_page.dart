import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:patungan/features/auth/presentation/controllers/auth_controller.dart';
import 'package:patungan/features/auth/presentation/pages/login_page.dart';
import 'package:patungan/features/auth/presentation/pages/sign_up_page.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login_column.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/hands_exchange.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 200,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 24,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Let’s you in',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 48),

                        SocialLoginColumn(
                          text: 'Continue with Facebook',
                          icon: const Icon(
                            Icons.facebook,
                            color: Color(0xFF1877F2),
                            size: 30,
                          ),
                          onPressed: controller.showComingSoon,
                        ),
                        const SizedBox(height: 20),

                        SocialLoginColumn(
                          text: 'Continue with Google',
                          icon: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              'assets/images/google_logo.svg',
                            ),
                          ),
                          onPressed: controller.signInWithGoogle,
                        ),
                        const SizedBox(height: 20),

                        SocialLoginColumn(
                          text: 'Continue with Apple',
                          icon: const Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: controller.showComingSoon,
                        ),

                        if (controller.isSigningIn.value) ...[
                          const SizedBox(height: 24),
                          const Center(child: CircularProgressIndicator()),
                        ],

                        const SizedBox(height: 32),

                        Row(
                          children: [
                            const Expanded(
                              child: Divider(color: Color(0x7F1A385B)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                'or',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const Expanded(
                              child: Divider(color: Color(0x7F1A385B)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        CustomElevatedButton(
                          isGradient: true,
                          label: 'Sign in with password',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        GradientTextButton(
                          useGradient: false,
                          message: "Don't have an account? ",
                          actionText: 'Sign up',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
