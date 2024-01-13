import 'package:appnest_task/core/widgets/base_shimmer.dart';
import 'package:appnest_task/features/home/presentation/controllers/categories_controller.dart';
import 'package:appnest_task/features/home/presentation/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesRow extends ConsumerWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categories = ref.watch(categoriesNotifierProvider);
    return SizedBox(
      height: 86,
      child: categories.when(
        data: (data) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: 80,
            itemBuilder: (context, index) => CategoryButton(
              shopCategory: data[index],
            ),
            itemCount: data.length,
          );
        },
        error: (error, stackTrace) => const Center(
          child: Text('error'),
        ),
        loading: () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 80,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 64,
                  child: BaseShimmer(
                    borderRadius: 5000,
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: BaseShimmer(
                    borderRadius: 10,
                  ),
                ),
              ],
            ),
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
