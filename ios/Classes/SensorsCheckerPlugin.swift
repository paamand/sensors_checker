import Flutter
import UIKit
import CoreMotion

public class SensorsCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sensors_checker", binaryMessenger: registrar.messenger())
    let instance = SensorsCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "hasBarometer":
      result(CMAltimeter.isRelativeAltitudeAvailable())
    case "hasGyroscope":
      let motionManager = CMMotionManager()
      result(motionManager.isGyroAvailable)
    case "hasAccelerometer":
      let motionManager = CMMotionManager()
      result(motionManager.isAccelerometerAvailable)
    case "hasMagnetometer":
      let motionManager = CMMotionManager()
      result(motionManager.isMagnetometerAvailable)
    case "hasTemperatureSensor":
      // iOS does not have a direct API for temperature sensors, returning false
      result(false)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
