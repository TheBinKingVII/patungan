import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/category/presentation/widgets/join_button.dart';
import 'package:patungan/features/groupbuy/presentation/pages/groupby_detailed.dart';

class PatunganCard extends StatelessWidget {
  final Map<String, dynamic> productData;

  const PatunganCard({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harga Patungan",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        CurrencyFormat.convertToIdr(productData['discount'], 0),
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFD64E56),
                            ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(productData['price'], 0),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFFAA2F6A),
                          Color(0xFFD64E56),
                          Color(0xFFEEBE4B),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'HEMAT',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "${((productData['price']! - productData['discount']!) / productData['price']! * 100).toStringAsFixed(0)}%",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Builder(
              builder: (context) {
                final int current =
                    (productData['currentParticipant'] ?? 0) as int;
                final int max = (productData['maxParticipant'] ?? 0) as int;
                final text = (max > 0)
                    ? '$current/$max slot filled'
                    : '$current slot filled';
                return Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final int current =
                          (productData['currentParticipant'] ?? 0) as int;
                      final int max =
                          (productData['maxParticipant'] ?? 0) as int;
                      double value = 0;
                      if (max > 0) {
                        value = current / max;
                      } else if (productData['value'] != null) {
                        value = (productData['value'] as num).toDouble();
                      }
                      return LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(30),
                        value: value.clamp(0, 1),
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.black12,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey, size: 18),
                    SizedBox(width: 6),
                    Text(
                      _buildCountdownText(),
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            JoinButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupbyDetailedPage(productData: productData)),
                    );
              },
              label: 'Join Groups',
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              height: 35,
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  String _buildCountdownText() {
    final dynamic endAt = productData['endAt'];
    if (endAt is Timestamp) {
      final diff = endAt.toDate().difference(DateTime.now());
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
    // Fallback ke string lama jika masih ada
    final dynamic legacy = productData['count_down'];
    if (legacy is String && legacy.isNotEmpty) {
      return legacy;
    }
    return '--:--:--';
  }
}
