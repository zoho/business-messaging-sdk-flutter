import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:business_messaging_sdk/ThemeConstant.dart';
import 'business_messaging_sdk_platform_interface.dart';
import 'dart:ui';

/// An implementation of [BusinessMessagingSdkPlatform] that uses method channels.
class MethodChannelBusinessMessagingSdk extends BusinessMessagingSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('business_messaging_sdk');

  @override
  Future<void> show(String orgId, String appId, String domain) async {
    await methodChannel.invokeMethod("show", {"orgId": orgId, "appId": appId, "domain": domain});
  }

  @override
  Future<void> setSessionVariable(String appId,List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('setSessionVariable', {"appId": appId, "sessionVariables": sessionVariables});
  }

  @override
  Future<void> updateSessionVariable(String orgId, String appId, String domain, List<Map<String, String>> sessionVariables) async {
    await methodChannel.invokeMethod('updateSessionVariable', {"orgId": orgId, "appId": appId, "domain": domain, "sessionVariables": sessionVariables});
  }

  @override
  Future<void> enableLog(bool isLogEnabled) async {
    await methodChannel.invokeMethod('enableLog', {"isLogEnabled" : isLogEnabled});
  }

  @override
  Future<void> clearData(String appId) async {
    await methodChannel.invokeMethod('clearData', {"appId" : appId});
  }

  @override
  Future<void> setTheme(ZDThemeType type) async {
    await methodChannel.invokeMethod("setTheme", {"type":type.rawValue});
  }

  @override
  Future<void> setLocale(String languageCode, String? countryCode) async {
    await methodChannel.invokeMethod('setLocale', {"languageCode": languageCode, "countryCode": countryCode,});
  }

  @override
  Future<void> setAgentTransferOptionVisibility(bool isVisible) async {
    await methodChannel.invokeMethod('setAgentTransferOptionVisibility', {"isVisible":isVisible});
  }

  @override
  Future<void> setContactInfo(String appId, String name, String phone, String email, Map<String, String> additionalInfo) async{
    await methodChannel.invokeMethod('setContactInfo', {"appId": appId, "name": name, "phone" : phone, "email" : email, "additionalInfo" : additionalInfo});
  }

}
