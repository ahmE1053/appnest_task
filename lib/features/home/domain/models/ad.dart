class ShopAd {
  final int id;
  final String imageUrl;

  ShopAd({
    required this.id,
    required this.imageUrl,
  });

  @override
  String toString() => 'ShopItem{id: $id, imageUrl: $imageUrl}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopAd &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode;
}
