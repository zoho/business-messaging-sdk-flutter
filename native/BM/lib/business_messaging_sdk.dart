import 'dart:ui';
import 'business_messaging_sdk_platform_interface.dart';
import 'package:business_messaging_sdk/ThemeConstant.dart';

class BusinessMessagingSdk {
  static Future<void> show(String orgId, String appId, String domain) => BusinessMessagingSdkPlatform.instance.show(orgId, appId, domain);
  static Future<void> setSessionVariable(String appId, List<Map<String, String>> sessionVariables) => BusinessMessagingSdkPlatform.instance.setSessionVariable(appId, sessionVariables);
  static Future<void> updateSessionVariable(String orgId, String appId, String domain, List<Map<String, String>> sessionVariables) => BusinessMessagingSdkPlatform.instance.updateSessionVariable(orgId, appId, domain, sessionVariables);
  static Future<void> enableLog(bool isLogEnabled) => BusinessMessagingSdkPlatform.instance.enableLog(isLogEnabled);
  static Future<void> clearData(String appId) => BusinessMessagingSdkPlatform.instance.clearData(appId);
  static Future<void> setTheme(ZDThemeType type) => BusinessMessagingSdkPlatform.instance.setTheme(type);
  static Future<void> setLocale(Locale locale) => BusinessMessagingSdkPlatform.instance.setLocale(locale.languageCode, locale.countryCode);
}
