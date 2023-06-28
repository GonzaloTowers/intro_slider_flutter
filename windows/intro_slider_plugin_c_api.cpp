#include "include/intro_slider/intro_slider_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "intro_slider_plugin.h"

void IntroSliderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  intro_slider::IntroSliderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
