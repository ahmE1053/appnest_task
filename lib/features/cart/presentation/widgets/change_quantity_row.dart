import 'package:appnest_task/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/consts/app_colors.dart';
import '../../domain/cart_item.dart';

class ChangeQuantityRow extends ConsumerWidget {
  const ChangeQuantityRow({
    super.key,
    required this.cartItem,
    required this.cartItemIndexInList,
  });

  final CartItem cartItem;
  final int cartItemIndexInList;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: IconButton(
            style: IconButton.styleFrom(
              foregroundColor: AppColors.grey102,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            onPressed: () {
              ref
                  .read(cartNotifierProvider.notifier)
                  .decreaseQuantity(cartItem, cartItemIndexInList);
            },
            icon:const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${cartItem.quantity}',
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            style: IconButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            onPressed: () {
              ref.read(cartNotifierProvider.notifier).addToCart(
                    cartItem.item,
                  );
            },
            icon:  const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.add,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
