import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'intro_slider_method_channel.dart';

abstract class IntroSliderPlatform extends PlatformInterface {
  /// Constructs a IntroSliderPlatform.
  IntroSliderPlatform() : super(token: _token);

  static final Object _token = Object();

  static IntroSliderPlatform _instance = MethodChannelIntroSlider();

  /// The default instance of [IntroSliderPlatform] to use.
  ///
  /// Defaults to [MethodChannelIntroSlider].
  static IntroSliderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IntroSliderPlatform] when
  /// they register themselves.
  static set instance(IntroSliderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
