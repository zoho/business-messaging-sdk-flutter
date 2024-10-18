#include "include/business_messaging_sdk/business_messaging_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "business_messaging_sdk_plugin.h"

void BusinessMessagingSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  business_messaging_sdk::BusinessMessagingSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
