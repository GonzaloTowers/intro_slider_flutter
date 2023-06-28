library intro_slider;

import 'package:flutter/material.dart';
import 'package:intro_slider/widget/carousel_item.dart';
import 'package:intro_slider/widget/fullscreen_dialog.dart';

import 'intro_slider_platform_interface.dart';

class IntroSlider {
  Future<String?> getPlatformVersion() {
    return IntroSliderPlatform.instance.getPlatformVersion();
  }

  static IntroSlider introSlider = IntroSlider();

  static IntroSlider getInstance() {
    return introSlider;
  }

  void show({
    required BuildContext context,
    Color color = Colors.redAccent,
    List<CarouselItem> items = const [],
    String skipText = 'Skip',
  }) {
    FullScreenDialog fullScreenDialog = FullScreenDialog();
    fullScreenDialog.themeColor = color;
    fullScreenDialog.carouselItems = items;
    fullScreenDialog.skipText = skipText;
    Navigator.of(context).push(fullScreenDialog);
  }
}
