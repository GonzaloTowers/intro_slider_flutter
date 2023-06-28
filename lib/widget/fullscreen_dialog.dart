import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'carousel.dart';
import 'carousel_item.dart';

class FullScreenDialog extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  late Color _themeColor;
  late List<CarouselItem> _carouselItems;
  late String _skipText;

  set themeColor(Color color) {
    _themeColor = color;
  }

  set carouselItems(List<CarouselItem> items) {
    _carouselItems = items;
  }

  set skipText(String text) {
    _skipText = text;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(
          context,
          _themeColor,
          _carouselItems,
        ),
      ),
    );
  }

  Widget _buildOverlayContent(
    BuildContext context,
    Color themeColor,
    List<CarouselItem> items,
  ) {
    int carouselPosition = 0;
    final PageController pageController = PageController(
      initialPage: 0,
    );
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Carousel(
            pageController: pageController,
            height: MediaQuery.of(context).size.height / 1.2,
            onPageChanged: (int page) {
              carouselPosition = page;
            },
            carouselItems: items,
            themeColor: themeColor,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          _skipText,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: items.length,
                    effect: JumpingDotEffect(
                      activeDotColor: _themeColor,
                      verticalOffset: 18,
                    ),
                    onDotClicked: (index) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 18.0,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          if (carouselPosition == items.length - 1) {
                            Navigator.pop(context);
                          } else {
                            pageController.animateToPage(
                              pageController.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 30.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // You can add your own animations for the overlay content
    return SlideTransition(
      //opacity: animation,
      position: Tween(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
      // child: ScaleTransition(
      //   scale: animation,
      //   child: child,
      // ),
    );
  }
}
