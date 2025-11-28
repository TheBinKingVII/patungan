import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patungan/features/auth/presentation/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text('Sign out'),
          onPressed: () async {
            await authController.signOut();
            // Navigation akan di-handle otomatis oleh _AuthGate di main.dart
          },
        ),
      ),
    );
  }
}
