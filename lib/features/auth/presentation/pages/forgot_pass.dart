import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patungan/features/auth/presentation/pages/reset_pass.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/form.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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

              // Image
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: SvgPicture.asset(
                  'assets/images/forgot_password.svg',
                  fit: BoxFit.fitWidth, 
                ),
              ),

              SizedBox(
                height: 226,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Enter the email address associated with your account.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(hintText: 'Email', prefixIcon: Icons.mail,)
                  ],
                ),
              ),

              // Button Continue
              SizedBox(height: 30),
              CustomElevatedButton(label: 'Continue', onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPass()),
                  );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
