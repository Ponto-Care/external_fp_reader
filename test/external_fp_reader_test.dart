import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:external_fp_reader/external_fp_reader.dart';

void main() {
  const MethodChannel channel = MethodChannel('external_fp_reader');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ExternalFpReader.platformVersion, '42');
  });
}
