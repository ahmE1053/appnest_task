
import 'package:flutter/material.dart';

import '../../../../../core/consts/text_styles.dart';
import '../notifications_button.dart';

class WelcomeAndNotificationRow extends StatelessWidget {
  const WelcomeAndNotificationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'مرحبا بعودتك , محمود 👋',
              style: AppTextStyle.getW400(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const NotificationButton(),
      ],
    );
  }
}
