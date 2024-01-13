import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:appnest_task/features/cart/domain/cart_item.dart';
import 'package:appnest_task/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'change_quantity_row.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.cartItemIndexInList,
  });

  final CartItem cartItem;
  final int cartItemIndexInList;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              cartItem.item.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        cartItem.item.name,
                        style: AppTextStyle.getW500(
                          fontSize: 16,
                          color: AppColors.neutral90,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        ref.read(cartNotifierProvider.notifier).removeFromCart(
                              cartItem.item,
                            ),
                    icon: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.close,
                        color: AppColors.grey101,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                cartItem.item.quantity,
                style: AppTextStyle.getW500(
                  fontSize: 14,
                  color: AppColors.grey101,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ChangeQuantityRow(
                        cartItem: cartItem,
                        cartItemIndexInList: cartItemIndexInList,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            '${cartItem.item.price} \$',
                            style: AppTextStyle.getW500(
                              fontSize: 18,
                              color: AppColors.neutral90,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
