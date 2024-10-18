import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:business_messaging_sdk/business_messaging_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBusinessMessagingSdk platform = MethodChannelBusinessMessagingSdk();
  const MethodChannel channel = MethodChannel('business_messaging_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });


}
