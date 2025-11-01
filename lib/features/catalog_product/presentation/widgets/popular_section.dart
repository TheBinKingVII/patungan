import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/catalog_controller.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatalogController>();

    double cardWidth = 213;
    double cardHeight = 295; // Fixed card height

    return Container(
      child: Column(
        children: [
          // Header Popular dan See All
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 0, 21, 0), // Full padding for header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF5F5B5B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ListView horizontal untuk produk dengan fixed height
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 0), // Full left and right padding for scroll content
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(controller.popularProducts.length, (
                  index,
                ) {
                  final product = controller.popularProducts[index];
                  final isFlashSale = (product['flashSale'] as bool?) ?? false;

                  return Obx(() {
                    final isPressed = controller.pressedProductIndex.value == index;
                    
                    return GestureDetector(
                      onTap: () => controller.toggleProductPress(index),
                      child: Container(
                        width: cardWidth,
                        height: cardHeight, // Fixed height
                        margin: EdgeInsets.only(
                          right: 16, // Always add right margin
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: isFlashSale
                              ? Border.all(color: Color(0xFFE91E63), width: 2)
                              : null,
                          gradient: !isFlashSale
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFAA2F6A),
                                    Color(0xFFD64E56),
                                    Color(0xFFEEBE4B),
                                  ],
                                )
                              : null,
                          color: isFlashSale ? Colors.white : null,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(isFlashSale ? 0 : 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: isPressed 
                            ? _buildPressedLayout(product, isFlashSale, cardWidth, index)
                            : _buildNormalLayout(product, isFlashSale, cardWidth, index),
                        ),
                      ),
                    );
                  });
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Normal layout - title below image
  Widget _buildNormalLayout(Map<String, dynamic> product, bool isFlashSale, double cardWidth, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Flash Sale Timer atau Timer badge
        if (isFlashSale)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Ends in: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Color(0xFFE91E63),
                        Color(0xFFAD1457),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      '01:25:30',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (index == 2)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, color: Colors.black87, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'Ends in: ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFAA2F6A),
                          Color(0xFFD64E56),
                          Color(0xFFEEBE4B),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        '01:25:30',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Image with badges
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13, 
              vertical: isFlashSale ? 0 : 8, // No vertical padding for flash sale, bigger image
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: (product['image'] as String?) != null
                        ? Image.asset(
                            product['image'] as String,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey[400],
                            ),
                          ),
                  ),
                ),
                _buildBadges(product, isFlashSale, false), // false = normal layout
              ],
            ),
          ),
        ),

        // Product content
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 0, 13, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                (product['title'] as String?) ?? 'Product',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Price
              Text(
                (product['price'] as String?) ?? 'Rp0',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),

              // Original price
              if ((product['originalPrice'] as String?) != null) ...[
                const SizedBox(height: 2),
                Text(
                  product['originalPrice'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],

              const SizedBox(height: 8),

              // Slots
              _buildSlotSection(product),

              const SizedBox(height: 8),

              // Button
              Container(
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFAA2F6A),
                      Color(0xFFD64E56),
                      Color(0xFFEEBE4B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _getButtonText(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
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

  // Pressed layout - title overlay on image
  Widget _buildPressedLayout(Map<String, dynamic> product, bool isFlashSale, double cardWidth, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Flash Sale Timer atau Timer badge
        if (isFlashSale)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Ends in: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Color(0xFFE91E63),
                        Color(0xFFAD1457),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      '01:25:30',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (index == 2)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, color: Colors.black87, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'Ends in: ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFAA2F6A),
                          Color(0xFFD64E56),
                          Color(0xFFEEBE4B),
                        ],
                      ).createShader(bounds),
                      child: Text(
                        '01:25:30',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Image with title overlay and badges
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13, 
              vertical: isFlashSale ? 0 : 8, // No vertical padding for flash sale, bigger image
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: (product['image'] as String?) != null
                        ? Image.asset(
                            product['image'] as String,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey[400],
                            ),
                          ),
                  ),
                ),

                // Title overlay at bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      (product['title'] as String?) ?? 'Product',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                _buildBadges(product, isFlashSale, true), // true = pressed layout
              ],
            ),
          ),
        ),

        // Product content without title
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 0, 13, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price
              Text(
                (product['price'] as String?) ?? 'Rp0',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),

              // Original price
              if ((product['originalPrice'] as String?) != null) ...[
                const SizedBox(height: 2),
                Text(
                  product['originalPrice'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],

              const SizedBox(height: 8),

              // Slots
              _buildSlotSection(product),

              const SizedBox(height: 8),

              // Button
              Container(
                width: double.infinity,
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFAA2F6A),
                      Color(0xFFD64E56),
                      Color(0xFFEEBE4B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _getButtonText(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
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

  // Badges for both layouts
  Widget _buildBadges(Map<String, dynamic> product, bool isFlashSale, bool isPressedLayout) {
    return Stack(
      children: [
        // Spots Left badge (for flash sale)
        if (isFlashSale && (product['spotsLeft'] as int?) != null)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF7043),
                    Color(0xFFE91E63),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Only ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '${product['spotsLeft']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\nSpots Left!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        // Discount badge - positioned differently for pressed layout
        else if ((product['discount'] as String?) != null)
          Positioned(
            // If pressed layout, position just above title overlay
            bottom: isPressedLayout ? 47 : 8,
            right: 8,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF7043),
                    Color(0xFFE91E63),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Discount\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '${product['discount'] as String}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSlotSection(Map<String, dynamic> product) {
    // Get slot info from product dengan safe casting
    int current = (product['currentSlot'] as int?) ?? 8;
    int total = (product['totalSlot'] as int?) ?? 10;
    bool isFull = current >= total;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Slot text aligned right
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '$current/$total slot',
              style: TextStyle(
                fontSize: 11,
                color: isFull ? Colors.grey : Color(0xFF19395B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // Progress bar (only show if not full)
        if (!isFull)
          Container(
            width: double.infinity,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: current / total,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF19395B),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),

        // Show "Slots filled" when full - positioned below slot count
        if (isFull) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Slots filled',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  String _getButtonText(int index) {
    switch (index) {
      case 0:
        return 'Join Now';
      case 1:
        return 'Open New Patungan';
      case 2:
        return 'Join Now';
      default:
        return 'Join Now';
    }
  }
}
