import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/catalog_controller.dart';
import 'package:patungan/features/category/presentation/pages/category_page.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatalogController>();
    final screenWidth = MediaQuery.of(context).size.width;
    
    double itemWidth = 130; 

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 16, 17, 0),
            child: Text(
              'What are you looking for today?',
              style: TextStyle(
                fontSize: screenWidth < 350 ? 14 : 20,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 150, 
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                
                return GestureDetector(
                  onTap: () {
                    controller.selectCategory(index); 

                    // Cek judul kategorinya, kalau 'Groceries' langsung pindah halaman
                    if (category['title'] == 'Groceries') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: itemWidth,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 0, // Left padding for first item
                      right: index == controller.categories.length - 1 ? 17 : 16, // Right padding for last item
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 111,  
                          height: 111, 
                          decoration: BoxDecoration(
                            color: Colors.grey[300], // Warna abu-abu
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipOval(
                              child: category['image'] != null 
                                ? Image.asset(
                                    category['image']!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[400], 
                                        child: Icon(
                                          Icons.image,
                                          size: 40, 
                                          color: Colors.grey[400],
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: Colors.grey[400], // Warna abu-abu untuk fallback
                                    child: Center(
                                      child: Text(
                                        category['icon'] ?? '📦',
                                        style: const TextStyle(fontSize: 30), // Diperbesar
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category['title'] ?? 'Category',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}