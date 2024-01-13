import 'package:appnest_task/features/home/domain/models/category.dart';

import '../../features/home/domain/models/ad.dart';
import '../../features/home/domain/models/shop_item.dart';

class MockAppData {
  List<ShopItem> get getShopItems {
    return [
      ShopItem(
        id: 1,
        name: 'تفاح',
        imageUrl: getImageUrl('apple'),
        price: 10.0,
        quantity: '5 قطع',
        categoryId: 1,
      ),
      ShopItem(
        id: 2,
        name: 'موز',
        imageUrl: getImageUrl('banana'),
        price: 15.0,
        quantity: '8 قطع',
        categoryId: 1,
      ),
      ShopItem(
        id: 3,
        name: 'فراخ',
        imageUrl: getImageUrl('chicken'),
        price: 80.0,
        quantity: 'كيلو',
        categoryId: 2,
      ),
      ShopItem(
        id: 4,
        name: 'حبوب',
        imageUrl: getImageUrl('grains'),
        price: 5.0,
        quantity: 'نصف كيلو',
        categoryId: 2,
      ),
      ShopItem(
        id: 5,
        name: 'لحم',
        imageUrl: getImageUrl('meat'),
        price: 4500.0,
        quantity: 'كيلو',
        categoryId: 3,
      ),
      ShopItem(
        id: 6,
        name: 'ارز مصري ابيض',
        imageUrl: getImageUrl('rice'),
        price: 35.0,
        quantity: 'كيلو',
        categoryId: 3,
      ),
    ];
  }

  List<ShopAd> get getShopAds {
    return [
      ShopAd(
        id: 1,
        imageUrl: getImageUrl('ad_1'),
      ),
      ShopAd(
        id: 2,
        imageUrl: getImageUrl('ad_1'),
      ),
      ShopAd(
        id: 3,
        imageUrl: getImageUrl('ad_1'),
      ),
    ];
  }

  List<ShopCategory> get getShopCategory {
    return [
      ShopCategory(
        id: 1,
        name: 'حلوى',
        imageUrl: getImageUrl('dessert'),
      ),
      ShopCategory(
        id: 2,
        name: 'مشروبات',
        imageUrl: getImageUrl('drink'),
      ),
      ShopCategory(
        id: 3,
        name: 'سناكس',
        imageUrl: getImageUrl('snacks'),
      ),
      ShopCategory(
        id: 4,
        name: 'طعام',
        imageUrl: getImageUrl('food'),
      ),
      ShopCategory(
        id: 5,
        name: 'حلوى',
        imageUrl: getImageUrl('dessert'),
      ),
      ShopCategory(
        id: 6,
        name: 'مشروبات',
        imageUrl: getImageUrl('drink'),
      ),
      ShopCategory(
        id: 7,
        name: 'سناكس',
        imageUrl: getImageUrl('snacks'),
      ),
      ShopCategory(
        id: 8,
        name: 'مأكولات بحرية',
        imageUrl: getImageUrl('food'),
      ),
      ShopCategory(
        id: 9,
        name: 'حلوى',
        imageUrl: getImageUrl('dessert'),
      ),
      ShopCategory(
        id:10,
        name: 'مشروبات',
        imageUrl: getImageUrl('drink'),
      ),
      ShopCategory(
        id: 11,
        name: 'سناكس',
        imageUrl: getImageUrl('snacks'),
      ),
      ShopCategory(
        id: 12,
        name: 'طعام',
        imageUrl: getImageUrl('food'),
      ),
    ];
  }

  String getImageUrl(String name) => 'assets/images/$name.png';
}
