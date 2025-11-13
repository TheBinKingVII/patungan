import 'package:flutter/material.dart';
import 'package:patungan/features/category/presentation/widgets/back_button.dart';
import 'package:patungan/features/category/presentation/widgets/choiche_chip.dart';
import 'package:patungan/features/category/presentation/widgets/join_button.dart';
import 'package:patungan/features/category/presentation/widgets/search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 30),
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Groceries',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(),
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
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            // bottom: MediaQuery.of(context).viewInsets.bottom+,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              CustomSearchBar(hintText: 'Cari beras'),

              // Kategori
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomChip(
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
                ),
              ),

              // Grid View
              const SizedBox(height: 15),
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 6,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.transparent,
                      elevation: 3,
                      shadowColor: Colors.black45,
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            splashColor: Colors.grey.shade300,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://resepkoki.id/wp-content/uploads/2020/03/Resep-Mie-Setan.jpg',
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),

                                      // Title
                                      SizedBox(height: 8),
                                      Text(
                                        'Beras Premium Mentik Wangi 10 kg',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      // Main Price
                                      SizedBox(height: 6),
                                      Text(
                                        'Rp145.000',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.tertiary,
                                            ),
                                      ),

                                      // Discount Price
                                      Text(
                                        'Rp180.000',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                      ),

                                      // Button
                                      SizedBox(height: 8),
                                      JoinButton(onPressed: () {}),
                                      SizedBox(height: 6),
                                    ],
                                  ),

                                  // Tag
                                  Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xFFAA2F6A),
                                                  Color(0xFFD64E56),
                                                  Color(0xFFEEBE4B),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              "Only 2 Spots left!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                    fontSize: 8,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
