import 'package:flutter/services.dart';

class BLEAddresPlatformChannel {
  static const platform = MethodChannel('flutter.native/ble_mac_address');
  static Future<String> getBLEMACAddress() async {
    var macAddress = await platform.invokeMethod<String>("get_ble_mac");
    return macAddress ?? "";
  }
}
