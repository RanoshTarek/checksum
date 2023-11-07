import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'security_platform_interface.dart';

/// An implementation of [SecurityPlatform] that uses method channels.
class MethodChannelSecurity extends SecurityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('security');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
