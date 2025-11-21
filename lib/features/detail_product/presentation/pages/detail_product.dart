import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:patungan/features/category/presentation/widgets/back_button.dart';
import 'package:patungan/features/detail_product/presentation/widgets/rating.dart';
// import 'package:patungan/features/category/presentation/widgets/choiche_chip.dart';
// import 'package:patungan/features/category/presentation/widgets/search_bar.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetailProduct extends StatelessWidget {
  final Map<String, dynamic> productData;
  const DetailProduct({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 30),
        backgroundColor: const Color(0xffF2F2F2),
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Detail Product',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontSize: 20),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 30),
          child: CustomBackButton(),
        ),
        toolbarHeight: 75,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(10),
              minimumSize: Size(40, 40),
              elevation: 0,
            ),
            child: Icon(Icons.share_outlined, size: 20, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          productData['image'],
                          width: double.infinity,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            SizedBox(height: 170),
                            Text(
                              productData['title'],
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w900,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
            
                            // Rating
                            SizedBox(height: 5),
                            Rating(ratingValue: 4.5, size: 15, fontSize: 14),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  productData['toko'],
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.verified_rounded,
                                  size: 15,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
            
                            // // Main Price
                            // SizedBox(height: 6),
                            // Text(
                            //   productData['price'],
                            //   style: Theme.of(context).textTheme.bodyLarge
                            //       ?.copyWith(
                            //         fontWeight: FontWeight.w900,
                            //         color: Theme.of(context).colorScheme.tertiary,
                            //       ),
                            // ),
            
                            // // Discount Price
                            // Text(
                            //   productData['discount'],
                            //   style: Theme.of(context).textTheme.bodySmall
                            //       ?.copyWith(
                            //         color: Colors.grey.shade700,
                            //         decoration: TextDecoration.lineThrough,
                            //       ),
                            // ),
            
                            // // Count Down
                            // Text(
                            //   'Ends ${productData['count_down']}',
                            //   style: Theme.of(context).textTheme.labelSmall
                            //       ?.copyWith(color: Colors.grey),
                            // ),
            
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: LinearProgressIndicator(
                            //         minHeight: 6,
                            //         borderRadius: BorderRadius.circular(30),
                            //         value: productData['value'],
                            //         color: Theme.of(context).colorScheme.primary,
                            //         backgroundColor: Colors.black12,
                            //       ),
                            //     ),
                            //     SizedBox(width: 10),
                            //     Text(
                            //       '5/6',
                            //       style: Theme.of(context).textTheme.bodySmall
                            //           ?.copyWith(
                            //             fontWeight: FontWeight.w800,
                            //             color: Theme.of(
                            //               context,
                            //             ).colorScheme.primary,
                            //           ),
                            //     ),
                            //   ],
                            // ),
            
                            // Button
                            // SizedBox(height: 8),
                            // JoinButton(onPressed: () {}),
                            // SizedBox(height: 6),
                          ],
                        ),
                      ),
            
                      // Tag
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
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
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  productData['label'],
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: 16),
                Card(
                  elevation: 0,
                  color: Colors.white, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi Produk",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101828),
                          ),
                        ),
                        SizedBox(height: 12),
            
                        Builder(
                          builder: (context) {
                            final Map<String, dynamic> details =
                                productData['details'] ?? {};
            
                            if (details.isEmpty) {
                              return Text("Tidak ada deskripsi detail.");
                            }
            
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...details.entries.map((entry) {
                                  String kategori = entry.key;
            
                                  List<String> points = List<String>.from(
                                    entry.value,
                                  );
            
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Judul Sub-Kategori
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8,
                                          top: 8,
                                        ),
                                        child: Text(
                                          kategori,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
            
                                      ...points.map((point) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 4,
                                            left: 8,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "• ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  point,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey[500],
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      SizedBox(height: 8),
                                    ],
                                  );
                                }).toList(),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            
                SizedBox(height: 30), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
