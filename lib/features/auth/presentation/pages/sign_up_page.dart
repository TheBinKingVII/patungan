import 'package:flutter/material.dart';
import 'package:patungan/features/auth/presentation/pages/login_page.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/checkbox.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/form.dart';
import 'package:patungan/features/auth/presentation/widgets/gradient_text_button.dart';
import 'package:patungan/features/auth/presentation/widgets/social_login_row.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

              //Header
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Create your Account',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              // Form
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

              // Checkbox remember me
              SizedBox(height: 20),
              RememberMeCheckbox(
                value: _isChecked,
                onChanged: (val) => setState(() => _isChecked = val!),
              ),

              // Button Sign in
              SizedBox(height: 5),
              CustomElevatedButton(label: 'Sign up', onPressed: () {}),

              // Shortcut Auth Login
              SizedBox(height: 62),
              SocialLoginRow(
                label: 'or continue with',
                onFacebookPressed: () {},
                onGooglePressed: () {},
                onApplePressed: () {},
              ),

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
    );
  }
}
