import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: searchController,
              style: AppTextStyle.getW400(
                fontSize: 14,
                color: AppColors.grey101,
              ),
              decoration: InputDecoration(
                hintText: 'ابحث عن ما تريد',
                prefixIcon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.grey101,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
                surfaceTintColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
