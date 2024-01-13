import 'package:appnest_task/features/home/domain/models/shop_item.dart';

class CartItem {
  final ShopItem item;
  final int quantity;

  double get itemPrice => item.price;

  const CartItem({
    required this.item,
    required this.quantity,
  });

  CartItem get removeQuantity => copyWith(quantity: quantity - 1);

  factory CartItem.fromItem(ShopItem item) => CartItem(
        item: item,
        quantity: 1,
      );

  CartItem get addQuantity => copyWith(quantity: quantity + 1);

  CartItem copyWith({
    ShopItem? item,
    int? quantity,
  }) {
    return CartItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          item == other.item &&
          quantity == other.quantity;

  @override
  int get hashCode => item.hashCode ^ quantity.hashCode;
}
