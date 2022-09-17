import UIKit
import Flutter
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseDynamicLinks

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // print(DynamicLinks.performDiagnostics(completion: nil));
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
