import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if(context.mounted) {
          context.replaceRoute(const BaseHomeRoute());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Transform.scale(
          scale: 1.7,
          child: Lottie.asset(
            'assets/lottie/splash.json',
            repeat: false,
          ),
        ),
      ),
    );
  }
}
