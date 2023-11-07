import 'package:flutter_test/flutter_test.dart';
import 'package:security/security.dart';
import 'package:security/security_platform_interface.dart';
import 'package:security/security_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSecurityPlatform
    with MockPlatformInterfaceMixin
    implements SecurityPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SecurityPlatform initialPlatform = SecurityPlatform.instance;

  test('$MethodChannelSecurity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSecurity>());
  });

  test('getPlatformVersion', () async {
    Security securityPlugin = Security();
    MockSecurityPlatform fakePlatform = MockSecurityPlatform();
    SecurityPlatform.instance = fakePlatform;

    expect(await securityPlugin.getPlatformVersion(), '42');
  });
}
