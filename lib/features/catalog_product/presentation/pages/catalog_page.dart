import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patungan/features/catalog_product/presentation/widgets/group_section.dart';
import '../controllers/catalog_controller.dart';
import '../widgets/catalog_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_section.dart';
import '../widgets/popular_section.dart';


class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(CatalogController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            SizedBox(height: 28),
            SearchBarWidget(),
            SizedBox(height: 8),
            CategorySection(),
            SizedBox(height: 33),
            PopularSection(),
            SizedBox(height: 39),
            GroupSection(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}