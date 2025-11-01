import 'package:flutter/material.dart';
import 'package:patungan/features/category/presentation/widgets/back_button.dart';
import 'package:patungan/features/category/presentation/widgets/choiche_chip.dart';
import 'package:patungan/features/category/presentation/widgets/search_bar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Most Urgent',
    'Lowest Price',
    'Most Popular',
    'Nearest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actionsPadding: EdgeInsets.only(right: 30),
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Groceries',
                style: TextTheme.of(context).headlineSmall?.copyWith(),
              ),
              leading: Padding(
                padding: EdgeInsets.only(left: 30),
                child: CustomBackButton(),
              ),
              toolbarHeight: 75,
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(40, 40),
                    elevation: 0,
                  ),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            SliverPadding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              sliver: SliverToBoxAdapter(
                child: CustomSearchBar(hintText: 'Cari beras'),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.only(
                left: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        children: List.generate(
                          categories.length,
                          (index) => CustomChip(
                            label: categories[index],
                            selected: selectedIndex == index,
                            onSelected: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
