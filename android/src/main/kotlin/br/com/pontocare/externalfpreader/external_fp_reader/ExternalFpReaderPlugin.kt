package br.com.pontocare.externalfpreader.external_fp_reader

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.embedding.engine.plugins.activity.ActivityAware

import asia.kanopi.fingerscan.Fingerprint
import asia.kanopi.fingerscan.Status
import android.os.Handler
import android.os.Looper
import android.os.Message
/** ExternalFpReaderPlugin */
class ExternalFpReaderPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var context: Context
  private lateinit var activity: Activity
  private val fingerprint: Fingerprint? = Fingerprint();

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "external_fp_reader")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "scan") {
      var printHandler: Handler = object : Handler(Looper.getMainLooper()) {
        override fun handleMessage(msg: Message) {
          val status: Int = msg.data.getInt("status")
          if (status == Status.SUCCESS) {
            result.success(msg.data.getByteArray("img"));
          } else {
            result.error(msg.data.getString("errorMessage"))
          }
        }
      }
      fingerprint?.scan(context, printHandler)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

}
