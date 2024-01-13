import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/consts/text_styles.dart';

class AddressSelectionRow extends StatelessWidget {
  const AddressSelectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/gps.svg',
        ),
        Text(
          'عباس العقاد مصطفي النحاس',
          style: AppTextStyle.getW400(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          'assets/icons/arrow_down.svg',
        ),
      ],
    );
  }
}
