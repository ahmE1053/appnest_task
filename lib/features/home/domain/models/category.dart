class ShopCategory {
  final int id;
  final String name;
  final String imageUrl;

  ShopCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  String toString() => 'ShopItem{id: $id, name: $name, imageUrl: $imageUrl}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopCategory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;
}
