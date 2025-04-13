package br.com.webeleven.rekognitionFaceLiveness.rekognition_face_liveness

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import android.util.Log
import com.amplifyframework.auth.cognito.AWSCognitoAuthPlugin
import com.amplifyframework.core.Amplify

/** RekognitionFaceLivenessPlugin */
class RekognitionFaceLivenessPlugin: FlutterPlugin {
  private val TAG = "RekognitionFaceLivenessPlugin"
  
  /// The event channel that will handle communication between Flutter and native Android
  private lateinit var eventChannel : EventChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val handler = EventStreamHandler()
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "face_liveness_event")
    eventChannel.setStreamHandler(handler)

    flutterPluginBinding
      .platformViewRegistry
      .registerViewFactory("face_liveness_view", FaceLivenessViewFactory(handler))

    Amplify.addPlugin(AWSCognitoAuthPlugin())
    Amplify.configure(flutterPluginBinding.applicationContext)
      
    Log.i(TAG, "RekognitionFaceLivenessPlugin initialized with custom credentials provider")
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    // No cleanup needed
  }
}

class EventStreamHandler: EventChannel.StreamHandler {
  private var eventSink: EventChannel.EventSink? = null

  fun onComplete() {
    eventSink?.success("complete")
  }

  fun onError(code: String) {
    eventSink?.success(code)
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }
}