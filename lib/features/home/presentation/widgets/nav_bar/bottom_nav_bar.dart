import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/features/home/presentation/widgets/nav_bar/nav_bar_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final void Function() routerListener;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.viewPaddingOf(context).bottom,
      ),
      indicatorColor: AppColors.primaryColor,
      dividerColor: Colors.transparent,
      controller: tabController,
      onTap: (value) {
        if (value > 1) {
          tabController.animateTo(currentIndex);
          return;
        }
        AutoTabsRouter.of(context).setActiveIndex(value);
      },
      tabs: [
        NavBarItem(
          itemIndex: 0,
          currentIndex: currentIndex,
          title: 'الرئيسية',
          imageName: 'home',
        ),
        NavBarItem(
          itemIndex: 1,
          currentIndex: currentIndex,
          title: 'السلة',
          imageName: 'cart',
        ),
        NavBarItem(
          itemIndex: 2,
          currentIndex: currentIndex,
          title: 'المفضلة',
          imageName: 'heart',
        ),
        NavBarItem(
          itemIndex: 3,
          currentIndex: currentIndex,
          title: 'التصنيفات',
          imageName: 'category',
        ),
        NavBarItem(
          itemIndex: 4,
          currentIndex: currentIndex,
          title: 'الملف الشخصي',
          imageName: 'person',
        ),
      ],
    );
  }

  @override
  void initState() {
    tabController = TabController(
      length: 5,
      vsync: this,
      animationDuration: const Duration(milliseconds: 250),
    );
    routerListener = () {
      currentIndex = AutoTabsRouter.of(context).activeIndex;
      tabController.animateTo(currentIndex);
      setState(() {});
    };
    AutoTabsRouter.of(context).addListener(routerListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    AutoTabsRouter.of(context).removeListener(routerListener);

    super.dispose();
  }
}
