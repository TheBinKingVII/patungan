import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patungan/features/auth/presentation/pages/reset_success.dart';
import 'package:patungan/features/auth/presentation/widgets/back_button.dart';
import 'package:patungan/features/auth/presentation/widgets/elevated_button.dart';
import 'package:patungan/features/auth/presentation/widgets/form.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _formKey = GlobalKey<FormState>();

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
                  'Create New Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              // Image Reset Pass
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: SvgPicture.asset(
                  'assets/images/reset_pass.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),

              // Text
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Your new password must be different from previous used passwords.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              // Form
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'New Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      helperText: 'Must be at least 8 characters.',
                      validator: (value) {
                        if (value == null || value.length < 8) {
                          return 'Must be at least 8 characters.';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      helperText: 'Both password must match.',
                      // validator:
                    ),
                  ],
                ),
              ),

              // Button Sign in with password
              SizedBox(height: 48),
              CustomElevatedButton(
                label: 'Sign up',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetSuccess()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
