import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';

class ShowMoreRow extends StatelessWidget {
  const ShowMoreRow({
    super.key,
    this.fontSize,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: AppTextStyle.getW500(
                fontSize: 14,
                color: AppColors.neutral90,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            'رؤية المزيد',
            style: AppTextStyle.getW400(
              fontSize: 12,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
