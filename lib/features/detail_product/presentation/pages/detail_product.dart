import 'package:flutter/material.dart';
import 'package:patungan/features/category/presentation/widgets/back_button.dart';
import 'package:patungan/features/detail_product/presentation/widgets/normal_card.dart';
import 'package:patungan/features/detail_product/presentation/widgets/patungan_card.dart';
import 'package:patungan/features/detail_product/presentation/widgets/rating.dart';
import 'package:patungan/features/detail_product/presentation/widgets/rating_summary.dart';
import 'package:patungan/features/detail_product/presentation/widgets/reviews.dart';
import 'package:patungan/features/detail_product/presentation/widgets/toogle_switch.dart';

class DetailProduct extends StatefulWidget {
  final Map<String, dynamic> productData;

  const DetailProduct({super.key, required this.productData});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool isPatungan = true;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        "user": "Payno L",
        "comment":
            "Packing super aman! Minyak goreng rawan bocor, tapi paket ini dibungkus berlapis-lapis. Patungan cepat penuh karena sisa 1 slot, untung kebagian. Toko Suka-Suka memang top.",
        "date": "4 days ago",
        "value": 4.5,
        "avatar": "https://i.pravatar.cc/150?img=12",
      },
      {
        "user": "Sabrina Car",
        "comment":
            "Harga Patungan memang paling murah. Pengiriman dari kurir sedikit lambat, untungnya packing aman.",
        "date": "1 weeks ago",
        "value": 3.0,
        "avatar": "https://i.pravatar.cc/150?img=25",
      },
      {
        "user": "Lottie T",
        "comment":
            "Packing super aman! Minyak tidak ada rembes. Patungan tercepat yang pernah saya ikuti.",
        "date": "2 months ago",
        "value": 5.0,
        "avatar": "https://i.pravatar.cc/150?img=30",
      },
    ];

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
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.productData['image'],
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
                              widget.productData['title'],
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.w900,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            // Rating
                            SizedBox(height: 5),
                            Rating(
                              ratingValue: widget.productData['rating'],
                              size: 15,
                              fontSize: 14,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.productData['toko'],
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
                                  "Only ${widget.productData['maxParticipant'] - widget.productData['currentParticipant']} Spots left",
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

                SizedBox(height: 10),
                ToggleSwitch(
                  isPatungan: isPatungan,
                  onChanged: (value) {
                    setState(() {
                      isPatungan = value;
                    });
                  },
                ),

                SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: isPatungan
                      ? PatunganCard(productData: widget.productData)
                      : NormalCard(productData: widget.productData),
                ),

                SizedBox(height: 10),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Subtitle
                        Text(
                          "Deskripsi Produk",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),

                        SizedBox(height: 8),
                        Builder(
                          builder: (context) {
                            final Map<String, dynamic> details =
                                widget.productData['details'] ?? {};

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                // Review
                SizedBox(height: 10),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Review Produk",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),

                        // Rating Summary
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    widget.productData['rating'].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),

                                  SizedBox(height: 10),
                                  Rating(
                                    ratingValue: widget.productData['rating'],
                                    size: 24,
                                    fontSize: 14,
                                    isShowText: false,
                                  ),

                                  SizedBox(height: 6),
                                  Text(
                                    '(5k reviews)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.grey.shade800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 20),
                            Expanded(
                              child: RatingSummary(
                                ratingValues: [0.8, 0.6, 0.3, 0.2, 0.1],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Reviews(reviewsData: reviews),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
