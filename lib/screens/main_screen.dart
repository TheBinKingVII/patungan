import 'package:flutter/material.dart';
import 'package:patungan/features/cart/presentation/pages/card_page.dart';
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

  static List<Widget> _optionWidgets = <Widget>[
    CatalogPage(),
    GroupbyPage(),
    CardPage(),
    ProfilePage(),
  ];

  void _onTapped(int index) {
    if (index >= 3) {
      print("Print ${index}");
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: _optionWidgets.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          _onTapped(value);
        },

        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Groupby",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Card",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
