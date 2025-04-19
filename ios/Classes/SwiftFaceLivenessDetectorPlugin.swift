import Flutter
import UIKit
import face_liveness_detector

public class SwiftFaceLivenessDetectorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Forward registration to our actual plugin implementation
    FaceLivenessPlugin.register(with: registrar)
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
} 