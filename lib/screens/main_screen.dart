import 'package:flutter/material.dart';
import 'package:patungan/features/cart/presentation/pages/cart_page.dart';
import 'package:patungan/features/catalog_product/presentation/pages/catalog_page.dart';
import 'package:patungan/features/groupbuy/presentation/pages/groupby_page.dart';
import 'package:patungan/features/profile/presentation/pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _optionWidgets = <Widget>[
    CatalogPage(),
    GroupbyPage(),
    CartPage(),
    ProfilePage(),
  ];

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.receipt_long_rounded,
    Icons.shopping_cart_outlined,
    Icons.person_outline_rounded,
  ];

  final List<String> labels = ["Home", "Group By", "Cart", "Account"];
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _optionWidgets.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                _onTapped(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icons[index],
                      size: 26,
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    labels[index],
                    style: isSelected
                        ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
