import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/cart/presentation/widgets/button_back.dart';
import 'package:patungan/features/cart/presentation/widgets/checkout_button.dart';
import 'package:patungan/features/cart/presentation/widgets/store_card.dart';
import 'package:patungan/features/cart/presentation/widgets/switch.dart';
import 'package:patungan/screens/main_screen.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isPatungan = true;

  // DUMMUY
  final List<Map<String, dynamic>> cartData = [
    {
      "store_name": "Toko Makmur Sentosa",
      "is_verified": true,
      "items": [
        {
          "title": "Beras Premium Mentik Wangi 10 kg",
          "image": "assets/images/beras.png",
          "group_info": "Group A (Host: Weasley)",
          "price": 145000,
          "qty": 1,
          "max_slots": 2,
        },
        {
          "title": "Beras Premium Mentik Wangi 10 kg",
          "image": "assets/images/beras.png",
          "group_info": "Group A (Host: Weasley)",
          "price": 145000,
          "qty": 1,
          "max_slots": 2,
        },
      ],
    },
    {
      "store_name": "BASIC WARDROBE Official Store",
      "is_verified": true,
      "items": [
        {
          "title": "Hoodie BASIC ESSENTIALS",
          "image": "assets/images/jaket.png",
          "group_info": "Group B (Host: Dobby)",
          "price": 179000,
          "qty": 1,
          "max_slots": 1,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalPrice = 145000 + 179000;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0xffF2F2F2),
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Detail Product',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 30),
          child: ButtonBack(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
        ),
        toolbarHeight: 75,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SwitchToggle(
                isPatungan: isPatungan,
                onChanged: (value) {
                  setState(() {
                    isPatungan = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // --- LIST STORE OTOMATIS ---
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  // Panggil Widget Reusable tadi
                  return StoreCard(storeData: cartData[index], index: index);
                },
              ),
            ),

            // --- BAGIAN CHECKOUT BAWAH ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Selected Items (1)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                      'Total: ${CurrencyFormat.convertToIdr(totalPrice, 0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CheckoutButton(
                    isGradient: true,
                    label: 'Checkout',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
