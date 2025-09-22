package eu.paamand.sensors_checker  // adjust if needed

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class SensorsCheckerPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "sensors_checker")
        channel.setMethodCallHandler(this)
        context = binding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "hasBarometer" -> {
                val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
                val barometer = sensorManager.getDefaultSensor(Sensor.TYPE_PRESSURE)
                result.success(barometer != null)
            }
            "hasGyroscope" -> {
                val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
                val gyroscope = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE)
                result.success(gyroscope != null)
            }
            "hasAccelerometer" -> {
                val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
                val accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
                result.success(accelerometer != null)
            }
            "hasMagnetometer" -> {
                val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
                val magnetometer = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD)
                result.success(magnetometer != null)
            }
            "hasTemperatureSensor" -> {
                val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
                val temperatureSensor = sensorManager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE)
                result.success(temperatureSensor != null)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
