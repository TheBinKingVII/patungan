import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patungan/features/auth/presentation/pages/login_page.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';

class ResetSuccess extends StatefulWidget {
  const ResetSuccess({super.key});

  @override
  State<ResetSuccess> createState() => _ResetSuccessState();
}

class _ResetSuccessState extends State<ResetSuccess> {

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Congratulations!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),

              // Image Reset Pass
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(27),
                    child: SvgPicture.asset(
                      'assets/images/congratulation.svg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),

              // Text
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Your password has been reset. You will be redirected to the login page in a few seconds.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),

              // Button Sign in with password
              SizedBox(height: 100),
              CustomElevatedButton(
                label: 'Go back to Login page',
                onPressed: () {
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
