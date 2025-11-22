import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/detail_product/presentation/widgets/counter_button.dart';
import 'package:patungan/features/detail_product/presentation/widgets/buy_now_button.dart';

class NormalCard extends StatefulWidget {
  final Map<String, dynamic> productData;

  const NormalCard({super.key, required this.productData});

  @override
  State<NormalCard> createState() => _NormalCardState();
}

class _NormalCardState extends State<NormalCard> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    int pricePerItem = widget.productData['price'];
    int totalPrice = pricePerItem * qty;

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Harga Normal",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Harga per Kg: ${CurrencyFormat.convertToIdr(widget.productData['discount'], 0)}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              'Stok tersedia: 50 karung',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade200),

            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'TOTAL BELANJA',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Color(0xFFD64E56),
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(
                          totalPrice,
                          0,
                        ), 
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),

                CounterButton(
                  qty: qty,
                  onDecrement: () => setState(() => qty > 1 ? qty-- : null),
                  onIncrement: () => setState(() => qty++),
                ),
              ],
            ),

            SizedBox(height: 20),
            BuyNowButton(
              onPressed: () {},
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
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
