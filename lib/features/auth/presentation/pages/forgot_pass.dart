import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black),
              ),
              SizedBox(height: 28),
              Align(
                alignment: AlignmentGeometry.topCenter,
                child: SvgPicture.asset(
                  'assets/images/forgot_password.svg',
                  // width: screenWidth,
                  // height: 10,
                  fit: BoxFit.fitWidth, // atau BoxFit.fitWidth sesuai kebutuhan
                ),
              ),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF19395B),
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {},
                child: Text(
                  'Continue',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
