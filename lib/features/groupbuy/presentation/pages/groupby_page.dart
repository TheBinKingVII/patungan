import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/detail_product/presentation/pages/detail_product.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/choiche_chip.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/join_button.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:patungan/features/groupbuy/presentation/pages/groupby_detailed.dart'; 

class GroupbyPage extends StatefulWidget {
  const GroupbyPage({super.key});

  @override
  State<GroupbyPage> createState() => _GroupbyPageState();
}

class _GroupbyPageState extends State<GroupbyPage> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Paling Urgent',
    'Diskon Tertinggi',
    'Slot Terbanyak',
  ];

  final List<Map<String, dynamic>> product = [
    {
      "title": "Beras Premium Mentik Wangi 10 kg",
      "image": "assets/images/beras.png",
      "label": "Only 2 Spots left!",
      "price": 145000,
      "discount": 180000,
      "count_down": "01:20:30",
      "value": 0.8,
      "rating": 4.5,
      "toko": "Toko Makmur Sentosa",
      "details": {
        "Spesifikasi": [
          "Jenis Beras: Mentik Wangi Super",
          "Berat Bersih: 10 kg",
          "Tekstur: Pulen, Wangi Alami",
          "Sertifikasi: Halal MUI, SNI 6729-2016",
        ],
        "Informasi Patungan": [
          "Minimum Order: 1 Karung (10kg)",
          "Total Kuota: 10 Slot",
          "Hemat: 20% dari harga normal",
        ],
        "Pengiriman": [
          "Pengemasan: Karung Ganda (Anti Bocor)",
          "Disarankan pakai Instan/Sameday",
        ],
      },
    },
    {
      "title": "Minyak Goreng 2L Pouch (3 Pcs)",
      "image": "assets/images/minyak.png",
      "label": "Only 1 Spots left!",
      "price": 48000,
      "discount": 60000,
      "count_down": "01:25:30",
      "value": 0.9,
      "rating": 4.5,
      "toko": "Toko Makmur Sentosa",
      "details": {
        "Spesifikasi": [
          "Jenis Beras: Mentik Wangi Super",
          "Berat Bersih: 10 kg",
          "Tekstur: Pulen, Wangi Alami",
          "Sertifikasi: Halal MUI, SNI 6729-2016",
        ],
        "Informasi Patungan": [
          "Minimum Order: 1 Karung (10kg)",
          "Total Kuota: 10 Slot",
          "Hemat: 20% dari harga normal",
        ],
        "Pengiriman": [
          "Pengemasan: Karung Ganda (Anti Bocor)",
          "Disarankan pakai Instan/Sameday",
        ],
      },
    },
    {
      "title": "Hoodie BASIC ESSENTIALS",
      "image": "assets/images/jaket.png",
      "label": "Only 1 Spots left!",
      "price": 179000,
      "discount": 300000,
      "count_down": "00:45:12",
      "value": 0.9,
      "rating": 4.5,
      "toko": "Toko Makmur Sentosa",
      "details": {
        "Spesifikasi": [
          "Jenis Beras: Mentik Wangi Super",
          "Berat Bersih: 10 kg",
          "Tekstur: Pulen, Wangi Alami",
          "Sertifikasi: Halal MUI, SNI 6729-2016",
        ],
        "Informasi Patungan": [
          "Minimum Order: 1 Karung (10kg)",
          "Total Kuota: 10 Slot",
          "Hemat: 20% dari harga normal",
        ],
        "Pengiriman": [
          "Pengemasan: Karung Ganda (Anti Bocor)",
          "Disarankan pakai Instan/Sameday",
        ],
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.primary,

        // Search Bar
        title: CustomSearchBar(hintText: 'Cari patungan murah'),
        toolbarHeight: 75,

        // Tune Button
        actionsPadding: EdgeInsets.only(right: 20),
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
            child: Icon(Icons.tune, size: 20, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            // bottom: MediaQuery.of(context).viewInsets.bottom+,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomChip(
                        label: categories[index],
                        selected: selectedIndex == index,
                        onSelected: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Title
              SizedBox(height: 10),
              Text(
                'Daftar Patungan Aktif',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),

              // Grid View
              const SizedBox(height: 10),
              Expanded(
                child: MasonryGridView.builder(
                  itemCount: product.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 6,
                  itemBuilder: (context, index) {
                    final data = product[index];

                    return Card(
                      color: Colors.transparent,
                      elevation: 3,
                      shadowColor: Colors.black45,
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            splashColor: Colors.grey.shade300,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailProduct(productData: data),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          data['image'],
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      // Title
                                      SizedBox(height: 8),
                                      Text(
                                        data['title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w900,
                                            ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      // Main Price
                                      SizedBox(height: 6),
                                      Text(
                                        CurrencyFormat.convertToIdr(data['price'], 0),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.tertiary,
                                            ),
                                      ),

                                      // Discount Price
                                      Text(
                                        CurrencyFormat.convertToIdr(data['discount'], 0),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Colors.grey.shade700,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                      ),

                                      // Count Down
                                      Text(
                                        'Ends ${data['count_down']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(color: Colors.grey),
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              minHeight: 6,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              value: data['value'],
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              backgroundColor: Colors.black12,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '5/6',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                ),
                                          ),
                                        ],
                                      ),

                                      // Button
                                      SizedBox(height: 8),
                                      JoinButton(onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GroupbyDetailedPage(
                                              productData: data,
                                            ),
                                          ),
                                        );
                                      }),
                                      SizedBox(height: 6),
                                    ],
                                  ),

                                  // Tag
                                  Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              data['label'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
