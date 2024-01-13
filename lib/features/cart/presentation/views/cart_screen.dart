import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/consts/text_styles.dart';
import 'package:appnest_task/features/cart/presentation/controllers/cart_controller.dart';
import 'package:appnest_task/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../widgets/go_to_checkout_button.dart';

@RoutePage()
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartNotifierProvider);
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 250,
      ),
      child: cart.items.isEmpty
          ? const EmptyCartWidget()
          : SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) =>
                          index == cart.items.length
                              ? const SizedBox(height: 120)
                              : SizedBox(
                                  height: 160,
                                  child: Center(
                                    child: SizedBox(
                                      height: 125,
                                      child: CartItemWidget(
                                        cartItemIndexInList: index,
                                        cartItem: cart.items[index],
                                      ),
                                    ),
                                  ),
                                ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: cart.items.length + 1,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: const Alignment(0.0, 0.9),
                        child: GoToCheckoutButton(cart: cart),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/lottie/empty_cart.json',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'لا يوجد اي منتجات ف السلة',
          style: AppTextStyle.getW500(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () => AutoTabsRouter.of(context).setActiveIndex(0),
          child: Text(
            'اذهب للتسوق',
            style: AppTextStyle.getW500(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
