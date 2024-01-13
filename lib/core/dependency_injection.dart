import 'package:appnest_task/core/mock/mock_data.dart';
import 'package:appnest_task/core/router/app_router.dart';
import 'package:appnest_task/features/home/data/data_source/data_source.dart';
import 'package:get_it/get_it.dart';

void injector() {
  GetIt.I.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
  GetIt.I.registerLazySingleton<MockAppData>(
        () => MockAppData(),
  );
  GetIt.I.registerLazySingleton<HomeDataSource>(
        () => MockHomeDataSourceImpl(GetIt.I<MockAppData>()),
  );
}
