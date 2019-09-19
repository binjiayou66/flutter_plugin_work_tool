import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginWorkTool {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_work_tool');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> hybridNavBack() async {
    await _channel.invokeMethod('hybridNavBack');
  }
}
