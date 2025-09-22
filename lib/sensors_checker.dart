import 'package:flutter/services.dart';

class SensorsChecker {
  static const _channel = MethodChannel('sensors_checker');

  static Future<bool> hasBarometer() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasBarometer');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> hasGyroscope() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasGyroscope');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> hasAccelerometer() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasAccelerometer');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> hasMagnetometer() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasMagnetometer');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> hasTemperatureSensor() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasTemperatureSensor');
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }
}
