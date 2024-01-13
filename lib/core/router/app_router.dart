import 'package:auto_route/auto_route.dart';

import '../../features/cart/presentation/views/cart_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/home/presentation/views/base_home_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: BaseHomeRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: CartRoute.page,
            ),
          ],
        ),
      ];
}
