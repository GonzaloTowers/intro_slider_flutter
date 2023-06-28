#ifndef FLUTTER_PLUGIN_INTRO_SLIDER_PLUGIN_H_
#define FLUTTER_PLUGIN_INTRO_SLIDER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace intro_slider {

class IntroSliderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  IntroSliderPlugin();

  virtual ~IntroSliderPlugin();

  // Disallow copy and assign.
  IntroSliderPlugin(const IntroSliderPlugin&) = delete;
  IntroSliderPlugin& operator=(const IntroSliderPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace intro_slider

#endif  // FLUTTER_PLUGIN_INTRO_SLIDER_PLUGIN_H_
