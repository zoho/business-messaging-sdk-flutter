import 'package:flutter_test/flutter_test.dart';
import 'package:business_messaging_sdk/business_messaging_sdk.dart';
import 'package:business_messaging_sdk/business_messaging_sdk_platform_interface.dart';
import 'package:business_messaging_sdk/business_messaging_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';



void main() {
  final BusinessMessagingSdkPlatform initialPlatform = BusinessMessagingSdkPlatform.instance;

  test('$MethodChannelBusinessMessagingSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBusinessMessagingSdk>());
  });


}
