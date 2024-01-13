import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.itemIndex,
    required this.currentIndex,
    required this.title,
    required this.imageName,
  });

  final int itemIndex;
  final int currentIndex;
  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = itemIndex == currentIndex;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: selectedIndex
                ? SvgPicture.asset(
              key:const  ValueKey('notFilled'),
                    'assets/icons/${imageName}_filled.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(
              key:const  ValueKey('filled'),
                    'assets/icons/$imageName.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.neutral90,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: AppTextStyle.getW500(
              fontSize: 8,
              color: selectedIndex ? AppColors.primaryColor : AppColors.neutral90,
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
