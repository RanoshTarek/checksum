import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'security_method_channel.dart';

abstract class SecurityPlatform extends PlatformInterface {
  /// Constructs a SecurityPlatform.
  SecurityPlatform() : super(token: _token);

  static final Object _token = Object();

  static SecurityPlatform _instance = MethodChannelSecurity();

  /// The default instance of [SecurityPlatform] to use.
  ///
  /// Defaults to [MethodChannelSecurity].
  static SecurityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SecurityPlatform] when
  /// they register themselves.
  static set instance(SecurityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
