#ifndef FLUTTER_PLUGIN_BUSINESS_MESSAGING_SDK_PLUGIN_H_
#define FLUTTER_PLUGIN_BUSINESS_MESSAGING_SDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace business_messaging_sdk {

class BusinessMessagingSdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BusinessMessagingSdkPlugin();

  virtual ~BusinessMessagingSdkPlugin();

  // Disallow copy and assign.
  BusinessMessagingSdkPlugin(const BusinessMessagingSdkPlugin&) = delete;
  BusinessMessagingSdkPlugin& operator=(const BusinessMessagingSdkPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace business_messaging_sdk

#endif  // FLUTTER_PLUGIN_BUSINESS_MESSAGING_SDK_PLUGIN_H_
