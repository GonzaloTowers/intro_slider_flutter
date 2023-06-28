import 'package:flutter/material.dart';

import 'carousel_item.dart';

class Carousel extends StatelessWidget {
  final double height;
  final double viewportFraction;
  final List<CarouselItem> carouselItems;
  final int initialPage;
  final int? itemCount;
  final PageController? pageController;
  final void Function(int)? onPageChanged;
  final Color? themeColor;

  const Carousel({
    Key? key,
    this.height = 400.0,
    this.viewportFraction = 0.9,
    required this.carouselItems,
    this.initialPage = 0,
    this.itemCount,
    this.pageController,
    this.onPageChanged,
    this.themeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //Text('Carousel $carouselIndex'),
        SizedBox(
          height: height,
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.right,
            color: themeColor ?? Colors.lime,
            child: PageView.builder(
              itemCount: itemCount ?? carouselItems.length,
              controller: pageController ??
                  PageController(
                    initialPage: initialPage,
                    viewportFraction: viewportFraction,
                  ),
              onPageChanged: onPageChanged,
              itemBuilder: (BuildContext context, int itemIndex) {
                return carouselItems[itemIndex];
              },
            ),
          ),
        )
      ],
    );
  }
}
