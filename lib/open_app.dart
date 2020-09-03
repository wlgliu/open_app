import 'dart:async';

import 'package:flutter/services.dart';

class OpenApp {
  static const MethodChannel _channel = const MethodChannel('open_app');

  static Future<bool> openApp(String packageName) async {
    final bool isOpenApp = await _channel.invokeMethod('openApp', <String, String>{'package_name': packageName});
    return isOpenApp;
  }

  static Future<bool> isInstalledApp(String packageName) async {
    final bool isInstalledApp = await _channel.invokeMethod('isInstalledApp', <String, String>{'package_name': packageName});
    return isInstalledApp;
  }
}
