import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'intro_slider_platform_interface.dart';

/// An implementation of [IntroSliderPlatform] that uses method channels.
class MethodChannelIntroSlider extends IntroSliderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('intro_slider');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
