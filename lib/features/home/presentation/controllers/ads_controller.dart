import 'package:appnest_task/features/home/data/data_source/data_source.dart';
import 'package:appnest_task/features/home/domain/models/ad.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_controller.g.dart';

@riverpod
class AdsNotifier extends _$AdsNotifier {
  late HomeDataSource homeDataSource;

  @override
  Future<List<ShopAd>> build() async {
    homeDataSource=GetIt.I();
    return await homeDataSource.getShopAds();
  }

}
