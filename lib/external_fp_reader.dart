
import 'dart:async';

import 'package:flutter/services.dart';

class ExternalFpReader {
  static const MethodChannel _channel =
      const MethodChannel('external_fp_reader');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
