import 'package:flutter/material.dart';

class TargetOptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String? originalPrice;
  final String target;
  final String time;
  final String badgeText;
  final Color themeColor;
  final Color backgroundColor;
  final bool isRecommended;

  const TargetOptionCard({
    super.key,
    required this.title,
    required this.price,
    this.originalPrice,
    required this.target,
    required this.time,
    required this.badgeText,
    required this.themeColor,
    required this.backgroundColor,
    this.isRecommended = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Title & Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14, // Font 14
                  fontWeight: FontWeight.w900, // Bold
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isRecommended ? themeColor : themeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Price Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 21, // Font 21
                  fontWeight: FontWeight.w900, // Bold
                  color: Color(0xFF19395B), // Dark Blue
                ),
              ),
              if (originalPrice != null)
                Text(
                  originalPrice!,
                  style: const TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Details: Target & Time
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.black), // Base size 14
              children: [
                // Target Label: SemiBold 14
                const TextSpan(
                    text: "Target: ",
                    style: TextStyle(fontWeight: FontWeight.w600)), // SemiBold
                
                // Target Value: Medium 14
                TextSpan(
                  text: "$target\n",
                  style: const TextStyle(fontWeight: FontWeight.w500) // Medium
                ),
                
                // Time Label
                const TextSpan(
                    text: "Time: ",
                    style: TextStyle(fontWeight: FontWeight.w600)), // SemiBold
                
                // Time Value
                TextSpan(
                  text: time,
                   style: const TextStyle(fontWeight: FontWeight.w500) // Medium
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}