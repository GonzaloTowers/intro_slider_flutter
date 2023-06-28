import 'package:flutter_test/flutter_test.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/intro_slider_platform_interface.dart';
import 'package:intro_slider/intro_slider_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIntroSliderPlatform
    with MockPlatformInterfaceMixin
    implements IntroSliderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IntroSliderPlatform initialPlatform = IntroSliderPlatform.instance;

  test('$MethodChannelIntroSlider is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIntroSlider>());
  });

  test('getPlatformVersion', () async {
    IntroSlider introSliderPlugin = IntroSlider();
    MockIntroSliderPlatform fakePlatform = MockIntroSliderPlatform();
    IntroSliderPlatform.instance = fakePlatform;

    expect(await introSliderPlugin.getPlatformVersion(), '42');
  });
}
