import 'package:flutter/material.dart';
import 'package:patungan/features/groupbuy/presentation/pages/create_groupbuy_page.dart'; // Import halaman create
import 'package:patungan/features/groupbuy/presentation/widgets/back_button.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/group_card_widget.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/search_bar.dart';

class GroupbyDetailedPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const GroupbyDetailedPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    // Ambil nama produk untuk hint search bar
    final String productTitle = productData['title'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- Konten Utama ---
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image
                Stack(
                  children: [
                    Image.asset(
                      productData['image'],
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    // Gradient Overlay
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Product Title
                      Center(
                        child: Column(
                          children: [
                            Text(
                              productData['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF19395B),
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Select an available joint group",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // --- Search Bar Dinamis ---
                      CustomSearchBar(
                        // Hint text berubah sesuai produk
                        hintText: "Cari grup $productTitle...",
                      ),
                      const SizedBox(height: 24),

                      // --- Group List Cards (Statis untuk contoh) ---
                      GroupCardWidget(
                        groupName: "Group A",
                        hostName: "Weesley",
                        percentage: 0.8,
                        currentSlots: 8,
                        totalSlots: 10,
                        price: 145000,
                        timeLeft: "01:25:30",
                        badgeText: "Fast",
                        badgeColor: Colors.orange, // Optional krn otomatis
                        buttonText: "Select (Fast Shipping)",
                        avatars: const [
                          "assets/images/beras.png",
                          "assets/images/minyak.png",
                          "assets/images/jaket.png",
                        ],
                      ),
                      const SizedBox(height: 20),
                      GroupCardWidget(
                        groupName: "Group B",
                        hostName: "Snape",
                        percentage: 0.33,
                        currentSlots: 2,
                        totalSlots: 6,
                        price: 153000,
                        originalPrice: 165000,
                        timeLeft: "23:45:00",
                        badgeText: "Guaranteed Ship",
                        badgeColor: Colors.purple,
                        buttonText: "Select (Save Rp10k)",
                        avatars: const [
                          "assets/images/jaket.png",
                          "assets/images/beras.png",
                        ],
                      ),
                      const SizedBox(height: 20),
                      GroupCardWidget(
                        groupName: "Group C",
                        hostName: "Draco Malfoy",
                        percentage: 0.1,
                        currentSlots: 1,
                        totalSlots: 10,
                        price: 145000,
                        timeLeft: "05:00:00",
                        badgeText: "New",
                        badgeColor: Colors.blue,
                        buttonText: "Select (Start Patungan)",
                        avatars: const ["assets/images/minyak.png"],
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Back Button
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const CustomBackButton(color: Colors.black, size: 20),
            ),
          ),
        ],
      ),

      // --- Tombol (+) Dinamis ---
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // DEBUG: Print ini untuk memastikan data tidak null sebelum navigasi
          print("Navigasi ke Create dengan data: ${productData['title']}");

          Navigator.push(
            context,
            MaterialPageRoute(
              // PASTIKAN productData dikirim di sini
              builder: (context) =>
                  CreateGroupbuyPage(productData: productData),
            ),
          );
        },
        backgroundColor: const Color(0xFF1E3A5F),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
