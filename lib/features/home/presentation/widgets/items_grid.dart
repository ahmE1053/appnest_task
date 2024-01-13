import 'package:appnest_task/core/widgets/base_shimmer.dart';
import 'package:appnest_task/features/home/presentation/controllers/items_controller.dart';
import 'package:appnest_task/features/home/presentation/widgets/shop_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsGridView extends ConsumerWidget {
  const ItemsGridView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final items = ref.watch(itemsNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: items.when(
        data: (data) => GridView.builder(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisExtent: 217,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => ShopItemWidget(
            shopItem: data[index],
          ),
          itemCount: data.length,
        ),
        error: (error, stackTrace) => const Center(
          child: Text(
            'error',
          ),
        ),
        loading: () => GridView.builder(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisExtent: 217,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) => const BaseShimmer(),
          itemCount: 8,
        ),
      ),
    );
  }
}
