import Flutter
import UIKit
import IOSSecuritySuite
public class SecurityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "security", binaryMessenger: registrar.messenger())
    let instance = SecurityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  let value = IOSSecuritySuite.getMachOFileHashValue(.custom("IOSSecuritySuite"))

    result("My name is \(value)." )
  }
}
