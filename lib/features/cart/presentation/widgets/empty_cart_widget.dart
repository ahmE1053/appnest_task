import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/text_styles.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/lottie/empty_cart.json',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'لا يوجد اي منتجات ف السلة',
          style: AppTextStyle.getW500(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () => AutoTabsRouter.of(context).setActiveIndex(0),
          child: Text(
            'اذهب للتسوق',
            style: AppTextStyle.getW500(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
