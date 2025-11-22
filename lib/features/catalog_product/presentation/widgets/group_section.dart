import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/catalog_controller.dart';

class GroupSection extends StatelessWidget {
  const GroupSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatalogController>();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
            child: const Text(
              'Group you may like',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Grid untuk group cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                controller.groupRecommendations.length,
                (index) {
                  final group = controller.groupRecommendations[index];
                  
                  return Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 21 : 0, // Left padding for first item
                      right: index == controller.groupRecommendations.length - 1 ? 21 : 12, // Right padding for last item
                    ),
                    child: Stack(
                      children: [
                        // Background container dengan fallback color
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (group['overlayColor'] as Color).withValues(alpha: 0.6), // Fallback color
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              group['image'] as String,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback jika gambar tidak ditemukan
                                return Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        (group['overlayColor'] as Color).withValues(alpha: 0.6),
                                        (group['overlayColor'] as Color),
                                      ],
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.group,
                                    size: 40,
                                    color: Colors.white.withValues(alpha: 0.3),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        
                        // Gradient overlay
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.3),
                                (group['overlayColor'] as Color).withValues(alpha: 0.6),
                              ],
                              stops: [0.0, 0.4, 1.0],
                            ),
                          ),
                        ),
                        
                        // Text overlay
                        Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Text(
                            group['title'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 3,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        // Tap gesture
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => controller.onGroupTap(group),
                              child: Container(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}