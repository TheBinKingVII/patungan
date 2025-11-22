import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/category/presentation/widgets/join_button.dart';

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
                        CurrencyFormat.convertToIdr(productData['price'], 0),
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFD64E56),
                            ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(productData['discount'], 0),
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
                            '20%',
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
            Text(
              '5/6 slot filled',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(30),
                    value: productData['value'],
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.black12,
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Ends ${productData['count_down']}',
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
              onPressed: () {},
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
}
