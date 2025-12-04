import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:business_messaging_sdk/ThemeConstant.dart';
import 'business_messaging_sdk_method_channel.dart';
import 'dart:ui';

abstract class BusinessMessagingSdkPlatform extends PlatformInterface {
  /// Constructs a BusinessMessagingSdkPlatform.
  BusinessMessagingSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static BusinessMessagingSdkPlatform _instance = MethodChannelBusinessMessagingSdk();

  /// The default instance of [BusinessMessagingSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelBusinessMessagingSdk].
  static BusinessMessagingSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BusinessMessagingSdkPlatform] when
  /// they register themselves.
  static set instance(BusinessMessagingSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> show(String orgId, String appId, String domain);

  Future<void> setSessionVariable(String appId, List<Map<String, String>> sessionVariables);

  Future<void> updateSessionVariable(String orgId, String appId, String domain, List<Map<String, String>> sessionVariables);

  Future<void> enableLog(bool isLogEnabled);

  Future<void> clearData(String appId);

  Future<void> setTheme(ZDThemeType type);

  Future<void> setLocale(String languageCode, String? countryCode);

  Future<void> setAgentTransferOptionVisibility(bool isVisible);

  Future<void> setContactInfo(String appId, String name, String phone, String email, Map<String,String> additionalInfo);

}
