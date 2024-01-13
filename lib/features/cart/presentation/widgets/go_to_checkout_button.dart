import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/text_styles.dart';
import '../../domain/cart.dart';

class GoToCheckoutButton extends StatelessWidget {
  const GoToCheckoutButton({
    super.key,
    required this.cart,
  });

  final ShopCart cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(24),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'اذهب للدفع',
                style: AppTextStyle.getW500(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius:
                const BorderRadiusDirectional.horizontal(
                  end: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,

                  child: Text(
                    '${cart.totalPrice.toStringAsFixed(2)} \$',
                    style: AppTextStyle.getW500(
                      fontSize: 16,
                      color: AppColors.neutral90,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
