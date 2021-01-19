import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class ExternalFpReader {
  String base64Image;

  static const MethodChannel _channel =
      const MethodChannel('external_fp_reader');

  static Future<String> scan() async {
    try {
      return await _channel.invokeMethod('scan');
    } on PlatformException catch (e) {
      print("error: " + e.details);
    }

    return null;
  }

  Future<void> delayed() async {
    try {
      final bytes = await _channel.invokeMethod("img");
      if (bytes != null) {
        base64Image = base64Encode(bytes);
        print(base64Image);
      }

      print(bytes);
    } catch (err) {}
  }
}
