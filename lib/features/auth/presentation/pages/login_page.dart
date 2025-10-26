import 'package:flutter/material.dart';
import 'package:patungan/features/auth/presentation/pages/forgot_pass.dart';
import 'package:patungan/features/auth/presentation/pages/sign_up_page.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/checkbox.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              AppBackButton(),

              // Header
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login to your Account',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              // Form
              SizedBox(height: 48),
              Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 8),
                        child: Icon(Icons.email, color: Colors.grey),
                      ),
                      hintText: 'Email',
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 26),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 5),
                        child: Icon(Icons.lock, color: Colors.grey),
                      ),
                      hintText: 'Password',
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.grey),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Checkbox remember me
              SizedBox(height: 40),
              RememberMeCheckbox(
                value: _isChecked,
                onChanged: (val) => setState(() => _isChecked = val!),
              ),

              // Button Sign in with password
              SizedBox(height: 5),
              CustomElevatedButton(label: 'Sign up', onPressed: () {}),

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
              
              // Shortcut Auth Login
              SizedBox(height: 83),
              SocialLoginRow(
                label: 'or continue with',
                onFacebookPressed: () {},
                onGooglePressed: () {},
                onApplePressed: () {},
              ),

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
    );
  }
}
