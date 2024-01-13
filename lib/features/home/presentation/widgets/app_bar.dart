import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_bar/app_bar_body.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: AppColors.primaryColor,
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.03,
            child: SvgPicture.asset(
              'assets/images/doodles.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const AppBarBody(),
      ],
    );
  }
}
