import 'package:firebase_auth/firebase_auth.dart'; // Import ini buat ambil data user Google
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patungan/features/auth/presentation/controllers/auth_controller.dart';
import 'package:patungan/features/auth/presentation/pages/register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    // Ambil data user yang sedang login dari Firebase
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2), // Background abu muda biar kontras
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color(0xFF19385B)),
        ),
        backgroundColor: const Color(0xffF2F2F2),
        foregroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Hilangkan tombol back di AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // --- 1. PROFILE SECTION (FOTO, NAMA, EMAIL) ---
            Center(
              child: Column(
                children: [
                  // Foto Profil (Lingkaran)
                  Container(
                    padding: const EdgeInsets.all(4), // Border putih tipis
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 50, // Ukuran foto
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : null,
                      child: user?.photoURL == null
                          ? const Icon(Icons.person, size: 50, color: Colors.grey)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nama User
                  Text(
                    user?.displayName ?? "User Patungan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900, // Tebal seperti di desain
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Email User (Sebagai subtitle)
                  Text(
                    user?.email ?? "no-email@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // --- 2. MENU SECTION (HANYA LOGOUT) ---
            // Dibuat bentuk Card rounded seperti di gambar referensi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Sudut membulat
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Logout Button (Menggunakan ListTile biar rapi)
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 8),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE5E5), // Background merah muda ikon
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.logout_rounded,
                        color: Color(0xFFD64E56), // Ikon warna merah
                      ),
                    ),
                    title: const Text(
                      "Sign Out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFD64E56), // Teks warna merah
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () async {
                      // Logika Logout TETAP (Sesuai request)
                      await authController.signOut();
                      Get.offAll(() => const RegisterPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}