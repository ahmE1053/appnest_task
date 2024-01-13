import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white10,
      ),
      onPressed: () {},
      icon: Badge(
        label: const Text('2'),
        backgroundColor: Colors.redAccent,
        child: SvgPicture.asset(
          'assets/icons/notification.svg',
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
