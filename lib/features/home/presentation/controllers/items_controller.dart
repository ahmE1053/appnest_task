import 'package:appnest_task/features/home/data/data_source/data_source.dart';
import 'package:appnest_task/features/home/domain/models/shop_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';

part 'items_controller.g.dart';

@riverpod
class ItemsNotifier extends _$ItemsNotifier {
  late HomeDataSource homeDataSource;
  int? _shopCategoryId;

  @override
  Future<List<ShopItem>> build() async {    homeDataSource=GetIt.I();

    if (_shopCategoryId != null) {
      return await homeDataSource.getShopItemsByCategory(_shopCategoryId!);
    }
    return await homeDataSource.getShopItems();
  }

  void setCategory(int categoryId) {
    _shopCategoryId = categoryId;
    ref.invalidateSelf();
  }

  void reset() {
    _shopCategoryId = null;
    ref.invalidateSelf();
  }
}
