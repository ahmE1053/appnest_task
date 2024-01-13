import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:appnest_task/features/cart/presentation/controllers/cart_controller.dart';
import 'package:appnest_task/features/home/domain/models/shop_item.dart';
import 'package:appnest_task/features/home/presentation/widgets/item_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopItemWidget extends ConsumerWidget {
  const ShopItemWidget({
    super.key,
    required this.shopItem,
  });

  final ShopItem shopItem;

  @override
  Widget build(BuildContext context, ref) {
    final isInCart =
        ref.read(cartNotifierProvider.notifier).isItemInCart(shopItem);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 80,
            child: Image.asset(
              shopItem.imageUrl,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              shopItem.name,
              style: AppTextStyle.getW500(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              shopItem.quantity,
              style: AppTextStyle.getW500(
                fontSize: 13,
                color: AppColors.grey102,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: SizedBox(
              height: 37,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          '${shopItem.price.toStringAsFixed(2)} جنيه مصري',
                          style: AppTextStyle.getW500(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 37,
                    child: ItemCartButton(
                      initialIsItemInCart: isInCart,
                      shopItem: shopItem,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
