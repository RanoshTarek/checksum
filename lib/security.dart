
import 'security_platform_interface.dart';

class Security {
  Future<String?> getPlatformVersion() {
    return SecurityPlatform.instance.getPlatformVersion();
  }
}
