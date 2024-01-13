import 'dart:math';

import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/features/cart/presentation/controllers/cart_controller.dart';
import 'package:appnest_task/features/home/domain/models/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ItemCartButton extends ConsumerStatefulWidget {
  const ItemCartButton({
    super.key,
    required this.shopItem,
    required this.initialIsItemInCart,
  });

  final ShopItem shopItem;
  final bool initialIsItemInCart;

  @override
  ConsumerState<ItemCartButton> createState() => _ItemCartButtonState();
}

class _ItemCartButtonState extends ConsumerState<ItemCartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> firstIconOpacity,
      secondIconOpacity,
      firstIconRotation,
      secondIconRotation;

  late final Animation<Color?> colorAnimation;
  late bool isItemInCart;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      cartNotifierProvider,
      (previous, next) {
        isItemInCart = ref
            .read(cartNotifierProvider.notifier)
            .isItemInCart(widget.shopItem);
        if (isItemInCart) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
      },
    );
    return ListenableBuilder(
      listenable: animationController,
      builder: (context, child) => IconButton(
        style: IconButton.styleFrom(
          backgroundColor: colorAnimation.value,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        onPressed: () {
          if (isItemInCart) {
            ref
                .read(cartNotifierProvider.notifier)
                .removeFromCart(widget.shopItem);
          } else {
            ref.read(cartNotifierProvider.notifier).addToCart(widget.shopItem);
          }
        },
        icon: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Opacity(
                opacity: firstIconOpacity.value,
                child: Transform.rotate(
                  angle: pi * firstIconRotation.value,
                  child: SvgPicture.asset(
                    'assets/icons/add.svg',
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: secondIconOpacity.value,
              child: Transform.rotate(
                angle: pi * secondIconRotation.value,
                child: SvgPicture.asset(
                  'assets/icons/trash.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      value: widget.initialIsItemInCart ? 1.0 : 0.0,
    );
    colorAnimation = ColorTween(
      begin: AppColors.primaryColor,
      end: Colors.redAccent,
    ).animate(animationController);
    firstIconOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5),
      ),
    );
    secondIconOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1.0),
      ),
    );
    firstIconRotation = Tween(begin: 0.0, end: 0.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5),
      ),
    );
    secondIconRotation = Tween(begin: -0.2, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1.0),
      ),
    );
    isItemInCart = widget.initialIsItemInCart;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
