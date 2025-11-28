import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart'; //
import 'package:patungan/features/cart/presentation/widgets/button_back.dart'; //
import 'package:patungan/features/cart/presentation/widgets/checkout_button.dart'; //

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // State untuk Delivery Mode (0: Home, 1: Pickup)
  int _deliveryMode = 0;
  
  // State untuk Payment Method
  String _paymentMethod = "Virtual Account";

  // Dummy Data (Nanti bisa dioper dari CartPage)
  final List<Map<String, dynamic>> items = [
    {
      "title": "Beras Premium Mentik Wangi 10 kg",
      "image": "assets/images/beras.png",
      "group": "Group A (Host: Weasley)",
      "price": 145000,
      "qty": 1,
    },
    {
      "title": "Minyak Goreng 2L Pouch (3 Pcs)",
      "image": "assets/images/minyak.png",
      "group": "Group A (Host: Ron)",
      "price": 48000,
      "qty": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Hitung-hitungan sederhana
    int subtotal = 193000;
    int deliveryFee = 15000;
    int serviceFee = 3000;
    int total = subtotal + deliveryFee + serviceFee;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2), // Background abu muda
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0xffF2F2F2),
        foregroundColor: const Color(0xFF19395B), // Warna Navy Utama
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: const Color(0xFF19395B)),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ButtonBack(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        toolbarHeight: 75,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // --- 1. DELIVERY MODE ---
            const Text(
              "Delivery Mode",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildDeliveryButton("HOME DELIVERY", 0),
                const SizedBox(width: 12),
                _buildDeliveryButton("PICK UP STORE", 1),
              ],
            ),
            const SizedBox(height: 24),

            // --- 2. SHIPPING TO ---
            const Text(
              "Shipping to",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Momo Meowng",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "(+62) 812345678",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Number 4, Privet Drive, Little Whinging, Surrey.",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit, size: 20, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 3. ORDER SUMMARY ---
            const Text(
              "Order Summary",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Grup Patungan dari Toko Makmur Sentosa",
              style: TextStyle(
                color: const Color(0xFFD64E56), // Warna Pink/Merah Brand
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.local_shipping_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  "SiCepat Reguler (3 - 5 days)",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // List Items
            ...items.map((item) => _buildItemCard(item)),

            const SizedBox(height: 24),

            // --- 4. PAYMENT DETAILS ---
            const Text(
              "Payment Details",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildSummaryRow("Subtotal", subtotal),
                  _buildSummaryRow("Delivery Fee", deliveryFee),
                  _buildSummaryRow("Service Fee", serviceFee),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TOTAL",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(total, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 5. PAYMENT METHOD ---
            const Text(
              "Payment Method",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildRadioTile("COD", "Rp", false),
                  const Divider(height: 1, color: Colors.grey),
                  _buildRadioTile("Transfer Bank", "", true, icon: Icons.account_balance),
                  const Divider(height: 1, color: Colors.grey),
                  _buildRadioTile("Virtual Account", "", true, icon: Icons.credit_card),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- 6. PAY NOW BUTTON ---
            CheckoutButton(
              label: "Pay Now",
              isGradient: true, // Gradient button
              onPressed: () {
                // Handle Payment Action
              },
            ),
            const SizedBox(height: 12),

            // Notes
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600, height: 1.4),
                children: const [
                  TextSpan(
                    text: "Notes:\n",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF19395B)),
                  ),
                  TextSpan(
                    text: "Payment held by Escrow. Funds release to seller only after group success or order is 'Received'.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPERS ---
  Widget _buildDeliveryButton(String text, int index) {
    bool isSelected = _deliveryMode == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _deliveryMode = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF19395B) : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFF19395B),
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: isSelected ? Colors.white : const Color(0xFF19395B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item['group'],
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item['qty']} slots x ${CurrencyFormat.convertToIdr(item['price'], 0)}",
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(item['price'] * item['qty'], 0),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFFD64E56), // Pink Price
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, int value) {
    return Padding(
      padding: const EdgeInsets.only(left:10, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            CurrencyFormat.convertToIdr(value, 0),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String label, String prefix, bool useIcon, {IconData? icon}) {
    bool isSelected = _paymentMethod == label;
    return InkWell(
      onTap: () => setState(() => _paymentMethod = label),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            // Icon / Prefix
            SizedBox(
              width: 24,
              child: useIcon 
                ? Icon(icon, size: 20, color: Colors.black87)
                : Text(prefix, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(width: 12),
            
            // Label
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),

            // Radio Button Custom Color (Orange/Gold sesuai gambar)
            Radio<String>(
              value: label,
              groupValue: _paymentMethod,
              activeColor: const Color(0xFFE08750), 
              onChanged: (val) => setState(() => _paymentMethod = val!),
            ),
          ],
        ),
      ),
    );
  }
}