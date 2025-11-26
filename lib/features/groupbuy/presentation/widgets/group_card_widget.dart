import 'package:flutter/material.dart';

class GroupCardWidget extends StatelessWidget {
  final String groupName;
  final String hostName;
  final double percentage;
  final int currentSlots;
  final int totalSlots;
  final int price;
  final int? originalPrice;
  final String timeLeft;
  final String badgeText;
  final Color badgeColor; // Tidak wajib dipakai karena logic warna ada di dalam build
  final String buttonText;
  final List<String> avatars;

  const GroupCardWidget({
    super.key,
    required this.groupName,
    required this.hostName,
    required this.percentage,
    required this.currentSlots,
    required this.totalSlots,
    required this.price,
    this.originalPrice,
    required this.timeLeft,
    required this.badgeText,
    required this.badgeColor,
    required this.buttonText,
    required this.avatars,
  });

  @override
  Widget build(BuildContext context) {
    // --- 1. Logika Warna & Icon Badge Otomatis ---
    Color finalBadgeColor;
    IconData badgeIcon;

    // Normalisasi text agar case-insensitive
    final textLower = badgeText.toLowerCase();

    if (textLower.contains('fast')) {
      finalBadgeColor = const Color(0xFFE08750); // Orange
      badgeIcon = Icons.directions_run;
    } else if (textLower.contains('guaranteed')) {
      finalBadgeColor = const Color(0xFF633584); // Purple #633584
      badgeIcon = Icons.local_offer_rounded; // Icon Tag
    } else if (textLower.contains('new')) {
      finalBadgeColor = const Color(0xFF4A8EC1); // Blue #4A8EC1
      badgeIcon = Icons.star_rounded; // Icon Bintang/New
    } else {
      finalBadgeColor = Colors.grey;
      badgeIcon = Icons.info;
    }

    // --- 2. Logika Avatar & Sisa Orang ---
    // Tampilkan maksimal 3 avatar
    int maxAvatars = 3;
    int displayCount = avatars.length > maxAvatars ? maxAvatars : avatars.length;
    
    // Hitung sisa orang: Jumlah slot terisi (currentSlots) - avatar yang tampil
    int othersCount = currentSlots - displayCount;
    if (othersCount < 0) othersCount = 0;

    // Ukuran UI Avatar
    double avatarSize = 31.0; // Sesuai request 31px
    double overlap = 10.0; // Jarak tumpuk antar foto

    // --- 3. Definisi Gradient ---
    const mainGradient = LinearGradient(
      colors: [
        Color(0xFFAA2F6A),
        Color(0xFFD64E56),
        Color(0xFFEEBE4B),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Group (e.g., Group A)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 4),
          child: Text(
            groupName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F2FF), // Background ungu muda
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Host & Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Host Info
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black, 
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: "(${(percentage * 100).toInt()}% Full)",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: " | Host: $hostName",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  
                  // Badge Widget (Dynamic Color)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: finalBadgeColor, 
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          badgeIcon,
                          size: 14, 
                          color: Colors.white
                        ),
                        const SizedBox(width: 4),
                        Text(
                          badgeText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Price Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rp${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  if (originalPrice != null) ...[
                    const SizedBox(width: 8),
                    Text(
                      "Rp${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                      style: const TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ]
                ],
              ),
              const SizedBox(height: 8),

              // Progress Bar & Slot Info
              Row(
                children: [
                  // Progress Bar
                  SizedBox(
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: percentage,
                        minHeight: 8,
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  
                  // Text 8/10
                  Text(
                    "$currentSlots/$totalSlots ",
                    style: const TextStyle(
                      color: Color(0xFF19395B),
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  
                  // Text Needs X more (Gradient)
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => mainGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "(Needs ${totalSlots - currentSlots} more)",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Time & Avatars
              Row(
                children: [
                  const Icon(Icons.access_time, size: 14, color: Colors.black),
                  const SizedBox(width: 4),
                  const Text(
                    "Time Left: ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  Text(
                    timeLeft,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFAA2F6A),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // --- Avatar Stack & Others Text ---
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Stack Avatar
                      SizedBox(
                        // Hitung lebar stack: (jumlah-1) * jarak + ukuran_avatar
                        width: displayCount > 0 
                            ? ((displayCount - 1) * (avatarSize - overlap)) + avatarSize 
                            : 0,
                        height: avatarSize,
                        child: Stack(
                          children: [
                            for (int i = 0; i < displayCount; i++)
                              Positioned(
                                left: i * (avatarSize - overlap),
                                child: Container(
                                  width: avatarSize,
                                  height: avatarSize,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 1.5),
                                    image: DecorationImage(
                                      image: AssetImage(avatars[i]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      
                      // Teks "+X others" di sebelah kanan stack
                      if (othersCount > 0) ...[
                        const SizedBox(width: 6),
                        Text(
                          "+$othersCount others",
                          style: const TextStyle(
                            fontSize: 10, // Font 10
                            fontWeight: FontWeight.w500, // Medium
                            color: Colors.black,
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Button Gradient
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: mainGradient,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}