import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patungan/features/auth/presentation/controllers/auth_controller.dart';
import 'package:patungan/features/auth/presentation/pages/login_page.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/checkbox.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/form.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login_row.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: screenHeight * 0.02,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackButton(),
                SizedBox(height: 28),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Create your Account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Username',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 26),
                    CustomTextFormField(
                      hintText: 'Email',
                      prefixIcon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 26),
                    CustomTextFormField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RememberMeCheckbox(
                  value: controller.rememberMeSignUp.value,
                  onChanged: controller.toggleRememberMeSignUp,
                ),
                SizedBox(height: 5),
                CustomElevatedButton(
                  label: 'Sign up',
                  onPressed: controller.showComingSoon,
                ),
                SizedBox(height: 62),
                SocialLoginRow(
                  label: 'or continue with',
                  onFacebookPressed: controller.showComingSoon,
                  onGooglePressed: controller.signInWithGoogle,
                  onApplePressed: controller.showComingSoon,
                ),
                if (controller.isSigningIn.value) ...[
                  SizedBox(height: 20),
                  const Center(child: CircularProgressIndicator()),
                ],
                SizedBox(height: 30),
                GradientTextButton(
                  message: "Already have an account? ",
                  actionText: 'Login',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
