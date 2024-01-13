class ShopItem {
  final int id;
  final int categoryId;
  final String name;
  final String imageUrl;
  final double price;
  final String quantity;

  ShopItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.categoryId,
  });

  @override
  String toString() =>
      'ShopItem{id: $id, name: $name, imageUrl: $imageUrl, price: $price, quantity: $quantity, categoryId: $categoryId}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          categoryId == other.categoryId &&
          price == other.price &&
          quantity == other.quantity;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      categoryId.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      quantity.hashCode;
}
