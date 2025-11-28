import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/detail_product/presentation/pages/detail_product.dart';
import 'package:patungan/features/groupbuy/domain/entities/group_deal_entity.dart';
import 'package:patungan/features/groupbuy/presentation/controllers/group_deal_controller.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/choiche_chip.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/join_button.dart';
import 'package:patungan/features/groupbuy/presentation/widgets/search_bar.dart';

class GroupbyPage extends StatefulWidget {
  const GroupbyPage({super.key});

  @override
  State<GroupbyPage> createState() => _GroupbyPageState();
}

class _GroupbyPageState extends State<GroupbyPage> {
  int selectedIndex = 0;

  late final GroupDealController _controller;

  final List<String> categories = [
    'Paling Urgent',
    'Diskon Tertinggi',
    'Slot Terbanyak',
  ];

  @override
  void initState() {
    super.initState();
    _controller = Get.put(GroupDealController(), permanent: false);
  }

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
                child: StreamBuilder<List<GroupDealEntity>>(
                  stream: _controller.groupDealsStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Gagal memuat data patungan:\n${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    final deals = snapshot.data ?? [];
                    if (deals.isEmpty) {
                      return Center(
                        child: Text(
                          'Belum ada patungan aktif',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return MasonryGridView.builder(
                      itemCount: deals.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 6,
                      itemBuilder: (context, index) {
                        final GroupDealEntity deal = deals[index];
                        final Map<String, dynamic> data = deal.rawData;

                        final double? progress = _calculateProgress(deal);
                        final String? progressLabel = _progressLabel(
                          deal,
                          progress,
                        );
                        final String imageSource = deal.image;

                        Widget buildImage() {
                          if (imageSource.isEmpty) {
                            return Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: const Icon(Icons.image_not_supported),
                            );
                          }
                          final isNetwork =
                              imageSource.startsWith('http') ||
                              imageSource.startsWith('https');
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: isNetwork
                                ? Image.network(
                                    imageSource,
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 100,
                                      color: Colors.grey.shade200,
                                      child: const Icon(Icons.broken_image),
                                    ),
                                  )
                                : Image.asset(
                                    imageSource,
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          );
                        }

                        final String countdownText = _countdownText(deal.endAt);

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
                                          buildImage(),
                                          const SizedBox(height: 8),
                                          Text(
                                            deal.title,
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
                                          const SizedBox(height: 6),
                                          Text(
                                            CurrencyFormat.convertToIdr(
                                              deal.discount,
                                              0,
                                            ),
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
                                          Text(
                                            CurrencyFormat.convertToIdr(
                                              deal.price,
                                              0,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Colors.grey.shade700,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                          ),
                                          Text(
                                            countdownText,
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
                                                  value: (() {
                                                    final int current =
                                                        deal.currentQuantity ??
                                                        0;
                                                    final int max =
                                                        deal.targetQuantity ??
                                                        0;
                                                    if (max <= 0) {
                                                      return ((progress ?? 0)
                                                              .clamp(0, 1))
                                                          .toDouble();
                                                    }
                                                    return ((current / max)
                                                            .clamp(0, 1))
                                                        .toDouble();
                                                  })(),
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  backgroundColor:
                                                      Colors.black12,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                progressLabel ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          JoinButton(onPressed: () {}),
                                          const SizedBox(height: 6),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentGeometry.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  5,
                                                ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: const [
                                                      Color(0xFFAA2F6A),
                                                      Color(0xFFD64E56),
                                                      Color(0xFFEEBE4B),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Text(
                                                  "Only ${deal.targetQuantity! - deal.currentQuantity!} Spots left",
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

  double? _calculateProgress(GroupDealEntity deal) {
    final int? target = deal.targetQuantity;
    final int? current = deal.currentQuantity;
    if (target != null && target > 0) {
      return (current ?? 0).toDouble() / target.toDouble();
    }
    if (deal.value != null) {
      return deal.value;
    }
    return null;
  }

  String? _progressLabel(GroupDealEntity deal, double? progress) {
    final int? target = deal.targetQuantity;
    final int? current = deal.currentQuantity;
    if (target != null) {
      return '${current ?? 0}/$target';
    }
    if (progress != null) {
      final percentage = (progress * 100).clamp(0, 100).round();
      return '$percentage%';
    }
    return null;
  }

  String _countdownText(DateTime? endAt) {
    if (endAt != null) {
      final diff = endAt.difference(DateTime.now());
      if (diff.isNegative) {
        return '00:00:00';
      }
      final hours = diff.inHours;
      final minutes = diff.inMinutes.remainder(60);
      final seconds = diff.inSeconds.remainder(60);
      final hh = hours.toString().padLeft(2, '0');
      final mm = minutes.toString().padLeft(2, '0');
      final ss = seconds.toString().padLeft(2, '0');
      return '$hh:$mm:$ss';
    }
    return '--:--:--';
  }
}
