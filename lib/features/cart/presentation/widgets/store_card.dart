import 'package:flutter/material.dart';
import 'package:patungan/core/utils/rupiah_format.dart';
import 'package:patungan/features/cart/presentation/widgets/counter.dart'; // Pastikan import CounterButton yang sudah ada

class StoreCard extends StatelessWidget {
  final Map<String, dynamic> storeData;
  final int index;

  const StoreCard({super.key, required this.storeData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey.shade400),

          // HEADER TOKO
          SizedBox(height: 5),
          Row(
            children: [
              Radio(
                value: index,
                groupValue: 0, // Logic selection
                onChanged: (val) {},
                activeColor: Theme.of(context).colorScheme.primary,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
              ),

              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        storeData['store_name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Color(0xFF19395B),
                        ),
                      ),

                      const SizedBox(width: 4),
                      if (storeData['is_verified'] == true)
                        const Icon(
                          Icons.verified,
                          size: 14,
                          color: Color(0xFF633584),
                        ),
                    ],
                  ),
                  Text(
                    'Menggabungkan semua Patungan dari toko ini',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),

          // LIST PRODUK DALAM SATU TOKO
          SizedBox(height: 15),
          ...List.generate(storeData['items'].length, (itemIndex) {
            final item = storeData['items'][itemIndex];

            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,

              background: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.only(left: 24), 
                decoration: BoxDecoration(
                  color: const Color(0xFFD64E56), 
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft, 
                child: const Icon(
                  Icons.delete_outline_rounded, 
                  color: Colors.white,
                  size: 28,
                ),
              ),

              confirmDismiss: (direction) async {
                return await showModalBottomSheet<bool>(
                  context: context,
                  backgroundColor: Colors.white,
                  // isScrollControlled: true, // Aktifkan ini kalau kontennya panjang banget (opsional)
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + MediaQuery.of(context).viewPadding.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          // garis kecil
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Title
                          const Text(
                            "Remove an Item",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Content Text (RichText)
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontFamily: 'Montserrat', // Sesuaikan font
                                height: 1.5,
                              ),
                              children: [
                                const TextSpan(text: "Are you sure you want to remove\n"),
                                TextSpan(
                                  text: item['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD64E56), // Warna Pink/Merah
                                  ),
                                ),
                                const TextSpan(text: " from\nyour cart?"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // --- TOMBOL AKSI ---
                          Row(
                            children: [
                              // 1. Tombol Back
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => Navigator.of(context).pop(false), // Return False
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Color(0xFF19395B)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 14), // Sedikit lebih tinggi
                                  ),
                                  child: const Text(
                                    "Back",
                                    style: TextStyle(
                                      color: Color(0xFF19395B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // 2. Tombol Remove
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(true), // Return True
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD64E56),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: const Text(
                                    "Remove",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              
              // LOGIC SAAT DIHAPUS
              onDismissed: (direction) {
                // Di sini nanti panggil fungsi hapus data dari Controller/State
                // Contoh dummy:
                // storeData['items'].removeAt(itemIndex);
              },

              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Gambar Produk
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'],
                        width: 100,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Detail Produk
                    const SizedBox(width: 22),
                    // SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w900,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          // Group Info
                          const SizedBox(height: 2),
                          Text(
                            item['group_info'],
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Color(0xFFE08750),
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 2),

                          // Harga
                          Row(
                            children: [
                              Text(
                                CurrencyFormat.convertToIdr(item['price'], 0),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              Text(
                                ' x 1 slot',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // Counter
                              CounterButton(
                                qty: item['qty'],
                                onDecrement: () {},
                                onIncrement: () {},
                                // onDecrement: () => setState(() => qty > 1 ? qty-- : null),
                                // onIncrement: () => setState(() => qty++),
                              ),

                              // Warning
                              const SizedBox(width: 8),
                              if (item['max_slots'] != null)
                                Text(
                                  "Max ${item['max_slots']} slots",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          // ADD ANOTHER GROUP BUY
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D3E50), // Dark Navy
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  minimumSize: const Size(0, 32),
                ),
                child: Text(
                  "Add Another Group Buy",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
