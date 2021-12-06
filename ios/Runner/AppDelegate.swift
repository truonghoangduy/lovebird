import UIKit
import Flutter
import CoreBluetooth


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let rootViewController : FlutterViewController = window?.rootViewController as! FlutterViewController

      
      let ble_mac_platfrom_channel_name = "flutter.native/ble_mac_address"
      
      let ble_mac_platfrom_channel = FlutterMethodChannel(name: ble_mac_platfrom_channel_name, binaryMessenger: rootViewController as! FlutterBinaryMessenger)
      
      ble_mac_platfrom_channel.setMethodCallHandler {(call: FlutterMethodCall, result: FlutterResult) -> Void in
          if (call.method == "get_ble_mac") {
              CBCentralManager.
          }
      }
      GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    
    
}
