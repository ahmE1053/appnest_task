import 'package:appnest_task/features/cart/domain/cart.dart';
import 'package:appnest_task/features/cart/domain/cart_item.dart';
import 'package:appnest_task/features/home/domain/models/shop_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_controller.g.dart';

@Riverpod(keepAlive: true)
class CartNotifier extends _$CartNotifier {
  @override
  ShopCart build() {
    return ShopCart(
      items: [],
      totalPrice: 0,
    );
  }

  void addToCart(ShopItem shopItem) {
    final oldItemIndex = state.items.indexWhere(
      (element) => element.item == shopItem,
    );
    final newPrice = state.totalPrice + shopItem.price;

    late final List<CartItem> newItems;
    if (oldItemIndex == -1) {
      newItems = List<CartItem>.from(state.items)
        ..add(
          CartItem.fromItem(shopItem),
        );
    } else {
      final newCartItem = state.items[oldItemIndex].addQuantity;
      newItems = List<CartItem>.from(state.items)..[oldItemIndex] = newCartItem;
    }

    state = ShopCart(
      items: newItems,
      totalPrice: newPrice,
    );
  }

  bool isItemInCart(ShopItem item) =>
      state.items.indexWhere((element) => element.item == item) != -1;

  void removeFromCart(ShopItem shopItem) {
    final cartItemIndex =
        state.items.indexWhere((element) => element.item == shopItem);
    final cartItem = state.items[cartItemIndex];
    final newPrice =
        state.totalPrice - (cartItem.itemPrice * cartItem.quantity);
    final newItems = List<CartItem>.from(state.items)..removeAt(cartItemIndex);
    state = state.copyWith(
      items: newItems,
      totalPrice: newPrice,
    );
  }

  void decreaseQuantity(CartItem cartItem, int index) {
    final newPrice = state.totalPrice - cartItem.itemPrice;

    late final List<CartItem> newItems;
    if (cartItem.quantity == 1) {
      newItems = List<CartItem>.from(state.items)..removeAt(index);
    } else {
      newItems = List<CartItem>.from(state.items)
        ..[index] = cartItem.removeQuantity;
    }

    state = state.copyWith(
      items: newItems,
      totalPrice: newPrice,
    );
  }
}
