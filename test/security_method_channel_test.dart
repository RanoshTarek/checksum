import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security/security_method_channel.dart';

void main() {
  MethodChannelSecurity platform = MethodChannelSecurity();
  const MethodChannel channel = MethodChannel('security');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
