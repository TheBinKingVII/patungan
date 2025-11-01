import 'package:flutter/material.dart';
import 'package:patungan/core/themes.dart';
import 'package:patungan/features/category/presentation/pages/category_page.dart';
// import 'package:patungan/screens/main_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false, 
      home: CategoryPage(),
    );
  }
}
