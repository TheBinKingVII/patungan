import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  // Observable variables
  var searchText = ''.obs;
  var selectedCategory = 0.obs;
  var pressedProductIndex = (-1).obs; // -1 means no product is pressed

  // Data untuk categories
  final categories = [
    {
      'title': 'Groceries',
      'icon': '🛒',
      'image': 'assets/images/catalog/groceries.png',
    },
    {
      'title': 'Electronics',
      'icon': '📱',
      'image': 'assets/images/catalog/electronics.png',
    },
    {
      'title': 'Fashion',
      'icon': '👕',
      'image': 'assets/images/catalog/fashion.png',
    },
    {
      'title': 'Daily Essentials',
      'icon': '🧴',
      'image': 'assets/images/catalog/daily_essentials.png',
    },
    {
      'title': 'Healthy & Beauty',
      'icon': '💄',
      'image': 'assets/images/catalog/health_beauty.png',
    },
  ].obs;

  // Data untuk popular products
  final popularProducts = [
    {
      'title': 'Beras Premium Mentik Wangi 10 kg',
      'price': 'Rp75.000',
      'image': 'assets/images/catalog/beras.png',
      'discount': null,
      'currentSlot': 8,
      'totalSlot': 10,
      'flashSale': false,
    },
    {
      'title': 'TWS Bluetooth Pro',
      'price': 'Rp250.000',
      'originalPrice': 'Rp450.000',
      'image': 'assets/images/catalog/tws.png',
      'discount': '44%',
      'currentSlot': 10,
      'totalSlot': 10,
      'flashSale': false,
    },
    {
      'title': '4-in-1 Daily Laundry & Cleaning Set',
      'price': 'Rp149.000',
      'originalPrice': 'Rp199.000',
      'image': 'assets/images/catalog/cleaning.png',
      'discount': '40%',
      'currentSlot': 25,
      'totalSlot': 30,
      'flashSale': true, 
    },
    {
      'title': 'Beras Premium Mentik Wangi 10 kg',
      'price': 'Rp145.000',
      'originalPrice': 'Rp180.000',
      'image': 'assets/images/catalog/beras.png',
      'discount': null,
      'currentSlot': 8,
      'totalSlot': 10,
      'flashSale': true, 
      'spotsLeft': 2, 
    },
  ].obs;

  // Data untuk group recommendations
  final groupRecommendations = [
    {
      'title': 'Patungan Cemilan Yuk!',
      'image': 'assets/images/catalog/group1.png',
      'overlayColor': Color(0xFFE08750), // Orange
    },
    {
      'title': 'Lagi Viral: Body Care',
      'image': 'assets/images/catalog/group2.png',
      'overlayColor': Color(0xFF19395B), // Blue
    },
    {
      'title': 'Ibu & Anak: Popok Diskon',
      'image': 'assets/images/catalog/group3.png',
      'overlayColor': Color(0xFF8E24AA), // Purple
    },
    {
      'title': 'Bundling: Kopi & Cemilan',
      'image': 'assets/images/catalog/group4.png',
      'overlayColor': Color(0xFFEEBE4B), // Yellow/Gold
    },
  ].obs;

  // Methods
  void updateSearchText(String value) {
    searchText.value = value;
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  void onProductTap(Map<String, dynamic> product) {
    // Handle product tap
    Get.snackbar(
      'Product',
      'Tapped on ${product['title'] ?? 'Unknown Product'}',
    );
  }

  void toggleProductPress(int index) {
    // Toggle pressed state
    if (pressedProductIndex.value == index) {
      pressedProductIndex.value = -1; // Unpress if already pressed
    } else {
      pressedProductIndex.value = index; // Press this product
    }
  }

  void onGroupTap(Map<String, dynamic> group) {
    // Handle group tap
    Get.snackbar(
      'Group',
      'Tapped on ${group['title'] ?? 'Unknown Group'}',
    );
  }
}