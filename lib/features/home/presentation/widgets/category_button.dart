import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:appnest_task/features/home/domain/models/category.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.shopCategory,
  });

  final ShopCategory shopCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 64,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5000),
              child: Image.asset(
                shopCategory.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                shopCategory.name,
                style: AppTextStyle.getW500(
                  fontSize: 12,
                  color: AppColors.neutral90
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
