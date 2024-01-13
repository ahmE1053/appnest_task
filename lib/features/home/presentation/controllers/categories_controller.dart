import 'package:appnest_task/features/home/data/data_source/data_source.dart';
import 'package:appnest_task/features/home/domain/models/category.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';


@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  late HomeDataSource homeDataSource;

  @override
  Future<List<ShopCategory>> build() async {
    homeDataSource=GetIt.I();
    return await homeDataSource.getShopCategories();
  }

}
