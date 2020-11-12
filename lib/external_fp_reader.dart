import 'dart:async';

import 'package:flutter/services.dart';

class ExternalFpReader {
  static const MethodChannel _channel =
      const MethodChannel('external_fp_reader');

  static Future<String> get scan async {
    try {
      return await _channel.invokeMethod('scan');
    } on PlatformException catch (e) {
      print("error: " + e.details);
    }

    return null;
  }
}
