import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/dependency_injection.dart';
import 'package:appnest_task/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/consts/text_styles.dart';

void main() {
  injector();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GetIt.I<AppRouter>().config(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.secondaryColor,
            ),
          ),
          hintStyle: AppTextStyle.getW400(
            fontSize: 13,
            color: AppColors.grey101,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
