import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patungan/features/auth/presentation/controllers/auth_controller.dart';
import 'package:patungan/features/auth/presentation/pages/forgot_pass.dart';
import 'package:patungan/features/auth/presentation/pages/sign_up_page.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/checkbox.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/form.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login_row.dart';
import 'package:patungan/screens/main_screen.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

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
                    'Login to your Account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
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
                SizedBox(height: 40),
                RememberMeCheckbox(
                  value: controller.rememberMeLogin.value,
                  onChanged: controller.toggleRememberMeLogin,
                ),
                SizedBox(height: 5),
                CustomElevatedButton(label: 'Login', onPressed: () {}),
                SizedBox(height: 15),
                GradientTextButton(
                  actionText: 'Forgot the password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPass()),
                    );
                  },
                ),
                SizedBox(height: 83),
                SocialLoginRow(
                  label: 'or continue with',
                  onFacebookPressed: controller.showComingSoon,
                  onGooglePressed: () async {
                    final success = await controller.signInWithGoogle();
                    if (success) {
                      Get.offAll(() => MainScreen());
                    }
                  },
                  onApplePressed: controller.showComingSoon,
                ),
                if (controller.isSigningIn.value) ...[
                  SizedBox(height: 20),
                  const Center(child: CircularProgressIndicator()),
                ],
                SizedBox(height: 30),
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
        ),
      ),
    );
  }
}
