import 'package:appnest_task/core/consts/app_colors.dart';
import 'package:appnest_task/core/widgets/base_shimmer.dart';
import 'package:appnest_task/features/home/presentation/controllers/ads_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdCarousel extends ConsumerStatefulWidget {
  const AdCarousel({super.key});

  @override
  ConsumerState<AdCarousel> createState() => _AdCarouselState();
}

class _AdCarouselState extends ConsumerState<AdCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final adsProvider = ref.watch(adsNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 160,
        child: adsProvider.when(
          data: (data) => Stack(
            fit: StackFit.expand,
            children: [
              CarouselSlider(
                items: data
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            e.imageUrl,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  disableCenter: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  autoPlayInterval: const Duration(seconds: 3),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.8),
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: data.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Colors.white,
                    dotColor: AppColors.secondaryColor,
                    expansionFactor: 4,
                  ),
                ),
              )
            ],
          ),
          error: (error, stackTrace) {
            return const Text('error');
          },
          loading: () => const BaseShimmer(borderRadius: 8),
        ),
      ),
    );
  }
}
