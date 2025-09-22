import 'package:flutter/material.dart';
import 'package:sensors_checker/sensors_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? hasBarometer;
  bool? hasGyroscope;
  bool? hasAccelerometer;
  bool? hasMagnetometer;
  bool? hasTemperatureSensor;

  @override
  void initState() {
    super.initState();
    checkSensors();
  }

  Future<void> checkSensors() async {
    final barometerResult = await SensorsChecker.hasBarometer();
    final gyroscopeResult = await SensorsChecker.hasGyroscope();
    final accelerometerResult = await SensorsChecker.hasAccelerometer();
    final magnetometerResult = await SensorsChecker.hasMagnetometer();
    final temperatureSensorResult = await SensorsChecker.hasTemperatureSensor();

    setState(() {
      hasBarometer = barometerResult;
      hasGyroscope = gyroscopeResult;
      hasAccelerometer = accelerometerResult;
      hasMagnetometer = magnetometerResult;
      hasTemperatureSensor = temperatureSensorResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sensor Checker Example')),
        body: Center(
          child: hasBarometer == null
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hasBarometer!
                          ? '✅ Device has a barometer'
                          : '❌ No barometer found',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      hasGyroscope!
                          ? '✅ Device has a gyroscope'
                          : '❌ No gyroscope found',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      hasAccelerometer!
                          ? '✅ Device has an accelerometer'
                          : '❌ No accelerometer found',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      hasMagnetometer!
                          ? '✅ Device has a magnetometer'
                          : '❌ No magnetometer found',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      hasTemperatureSensor!
                          ? '✅ Device has a temperature sensor'
                          : '❌ No temperature sensor found',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
