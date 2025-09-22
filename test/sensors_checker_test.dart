import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensors_checker/sensors_checker.dart';

void main() {
  const MethodChannel channel = MethodChannel('sensors_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Default: device has a barometer
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'hasBarometer') {
        return true;
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('hasBarometer returns true from mock', () async {
    expect(await SensorsChecker.hasBarometer(), true);
  });

  test('hasBarometer returns false when mock returns false', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'hasBarometer') {
        return false;
      }
      return null;
    });

    expect(await SensorsChecker.hasBarometer(), false);
  });

  test('hasBarometer returns false when mock returns null', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      if (methodCall.method == 'hasBarometer') {
        return null;
      }
      return null;
    });

    expect(await SensorsChecker.hasBarometer(), false);
  });

  test('hasBarometer returns false on PlatformException', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      throw PlatformException(code: 'ERROR', message: 'Platform error');
    });

    expect(await SensorsChecker.hasBarometer(), false);
  });
}
