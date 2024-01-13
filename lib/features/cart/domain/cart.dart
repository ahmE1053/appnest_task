import 'package:appnest_task/features/cart/domain/cart_item.dart';

class ShopCart {
  final List<CartItem> items;
  final double totalPrice;

  ShopCart({
    required this.items,
    required this.totalPrice,
  });

  ShopCart copyWith({
    List<CartItem>? items,
    double? totalPrice,
  }) {
    return ShopCart(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopCart &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode => items.hashCode ^ totalPrice.hashCode;
}
