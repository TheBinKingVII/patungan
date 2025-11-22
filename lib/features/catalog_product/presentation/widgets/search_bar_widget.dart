import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/catalog_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CatalogController>();
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      child: SizedBox(
        height: 40, // Set tinggi tetap
        child: TextField(
          onChanged: controller.updateSearchText,
          decoration: InputDecoration(
            hintText: 'Gabung grup belanja murah bareng teman!',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13, fontWeight: FontWeight.w100),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(27, 9, 0, 10), 
              child: Icon(Icons.search, color: Colors.grey[400], size: 18),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            isDense: true, 
          ),
          textAlignVertical: TextAlignVertical.center, 
        ),
      ),
    );
  }
}