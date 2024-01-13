import 'package:appnest_task/core/widgets/show_more_row.dart';
import 'package:appnest_task/features/home/presentation/widgets/ad_carousel.dart';
import 'package:appnest_task/features/home/presentation/widgets/app_bar.dart';
import 'package:appnest_task/features/home/presentation/widgets/categories_row.dart';
import 'package:appnest_task/features/home/presentation/widgets/items_grid.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeAppBar(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              cacheExtent: 5000,
              padding: EdgeInsets.zero,
              children: [
                const AdCarousel(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ShowMoreRow(
                    title: 'الفئات الاكثر شيوعا',
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 8),
                const CategoriesRow(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ShowMoreRow(
                    title: 'العروض الحديثة',
                    onTap: () {},
                  ),
                ),
                const ItemsGridView(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
