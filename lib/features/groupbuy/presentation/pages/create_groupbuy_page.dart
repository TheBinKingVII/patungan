import 'package:flutter/material.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/back_button.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/target_option_card.dart';

class CreateGroupbuyPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const CreateGroupbuyPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    // --- Data Safety ---
    final String title = productData['title'] ?? 'Produk Tidak Diketahui';
    final int basePrice = productData['price'] ?? 0;
    
    // Logika Diskon
    final int discountedPrice = (basePrice > 10000) ? basePrice - 10000 : basePrice; 

    // Helper Format Rupiah
    String formatRupiah(int number) {
      return "Rp${number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
    }

    const mainGradient = LinearGradient(
      colors: [Color(0xFFAA2F6A), Color(0xFFD64E56), Color(0xFFEEBE4B)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- Layer 1: Fixed Background Image ---
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                   Image.asset(
                    'assets/images/groupbuy.png',
                    fit: BoxFit.cover,
                   ),
                   Container(color: Colors.black.withOpacity(0.1)),
                ],
              ),
            ),
          ),

          // --- Layer 2: Scrollable Content ---
          SingleChildScrollView(
            child: Stack(
              children: [
                // A. Konten Utama (Kartu Putih)
                Column(
                  children: [
                    const SizedBox(height: 180), 
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 180,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 35), 

                            // --- Judul ---
                            Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "Buat Grup Patungan Baru",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900, // Tebal (w900)
                                      color: Color(0xFF19395B),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "You will create a group for:\n$title", 
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      height: 1.3,
                                      fontWeight: FontWeight.w900 // Tebal (w900)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Divider(thickness: 0.5, color: Colors.grey),
                            const SizedBox(height: 20),

                            // --- Target Group Options ---
                            const Text(
                              "Choose Your Target Group",
                              style: TextStyle(
                                fontSize: 17, 
                                fontWeight: FontWeight.w900, // Tebal (w900)
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "The larger the target, the lower the price!",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 16),

                            TargetOptionCard(
                              title: "Option 1: STANDAR",
                              price: formatRupiah(basePrice),
                              target: "10 Slots",
                              time: "24 Hours",
                              badgeText: "Recommended",
                              themeColor: const Color(0xFFE08750),
                              backgroundColor: const Color(0xFFFFF6F0),
                              isRecommended: true,
                            ),

                            TargetOptionCard(
                              title: "Option 2: SUPER HEMAT",
                              price: formatRupiah(discountedPrice),
                              originalPrice: formatRupiah(basePrice),
                              target: "15 Slots",
                              time: "24 Hours (Extra time)",
                              badgeText: "Best Price",
                              themeColor: const Color(0xFF633584),
                              backgroundColor: const Color(0xFFF9F2FF),
                            ),
                            const SizedBox(height: 24),

                            // --- Form Section ---
                            const Text(
                              "Additional Details",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900, // Tebal (w900)
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),

                            _buildLabel("Group Name", isRequired: true),
                            _buildTextField("Grup $title [Username]"), 
                            
                            const SizedBox(height: 16),
                            
                            _buildLabel("Group Notes"),
                            _buildTextField("Tulis pesan penyemangat untuk anggota.."),

                            const SizedBox(height: 32),

                            // --- Button ---
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: mainGradient,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFAA2F6A).withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: const Text(
                                  "Create & Checkout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900, // Tebal (w900)
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // B. Badge "Create New Group"
                Positioned(
                  top: 165, 
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 162,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color(0xFF633584),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 2))
                          ]),
                      child: const Center(
                        child: Text(
                          "Create New Group",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Layer 3: Tombol Back ---
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const CustomBackButton(
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER DIPERBARUI ---

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black, 
            fontSize: 16,
            fontWeight: FontWeight.w900, // Tebal (w900)
          ),
          children: [
            TextSpan(text: text),
            if (isRequired)
              const TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xFFD64E56)), // Merah asterisk
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(
        fontSize: 12, 
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade500, 
          fontSize: 12,
          fontWeight: FontWeight.w400
        ),
        filled: true,
        fillColor: const Color(0xFFF6F6F6), // Warna abu-abu sangat muda
        
        // PENTING: contentPadding ini mengatur tinggi TextField secara alami.
        // Vertical 12px + Font 12px (+line height) ~= 40-42px total height.
        // Horizontal 20px sesuai desain.
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        
        // Border Radius 11 & No Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11), // Radius 11
          borderSide: BorderSide.none, 
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide.none,
        ),
      ),
    );
  }
}