
import 'package:appnest_task/features/home/presentation/widgets/app_bar/welcome_and_notification_row.dart';
import 'package:appnest_task/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'address_selection_row.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WelcomeAndNotificationRow(),
            SizedBox(height: 12),
            AddressSelectionRow(),
            SizedBox(height: 12),
            MySearchBar(),
            SizedBox(height: 12),
            // SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
