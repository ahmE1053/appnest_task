import 'package:appnest_task/core/mock/mock_data.dart';
import 'package:appnest_task/features/home/domain/models/ad.dart';
import 'package:appnest_task/features/home/domain/models/category.dart';
import 'package:appnest_task/features/home/domain/models/shop_item.dart';

abstract class HomeDataSource {
  Future<List<ShopCategory>> getShopCategories();

  Future<List<ShopItem>> getShopItems();

  Future<List<ShopItem>> getShopItemsByCategory(int categoryId);

  Future<List<ShopAd>> getShopAds();

  const HomeDataSource();
}

class MockHomeDataSourceImpl extends HomeDataSource {
  MockHomeDataSourceImpl(this.mockAppData);

  final MockAppData mockAppData;

  @override
  Future<List<ShopAd>> getShopAds() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAppData.getShopAds;
  }

  @override
  Future<List<ShopCategory>> getShopCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAppData.getShopCategory;
  }

  @override
  Future<List<ShopItem>> getShopItems() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAppData.getShopItems;
  }

  @override
  Future<List<ShopItem>> getShopItemsByCategory(int categoryId) async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAppData.getShopItems
        .where((element) => element.categoryId == categoryId)
        .toList();
  }
}
