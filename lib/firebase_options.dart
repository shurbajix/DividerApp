// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwWPTlKnSI2KQwpWdXJOpoVRZxXcfqr1s',
    appId: '1:69575353123:web:5eb87d3c540fec4b056296',
    messagingSenderId: '69575353123',
    projectId: 'derivative-89e54',
    authDomain: 'derivative-89e54.firebaseapp.com',
    storageBucket: 'derivative-89e54.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDERqE9YGcz0fOjd2_wS_BwRkCsK6VNZBE',
    appId: '1:69575353123:android:a14b76e7265e17c1056296',
    messagingSenderId: '69575353123',
    projectId: 'derivative-89e54',
    storageBucket: 'derivative-89e54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTsCoeKpBYH4-KDbzoLFBs9mcPO8lNWtU',
    appId: '1:69575353123:ios:fe94e87a1b8934a7056296',
    messagingSenderId: '69575353123',
    projectId: 'derivative-89e54',
    storageBucket: 'derivative-89e54.appspot.com',
    iosClientId: '69575353123-85ub9apnmao2tn27k5re27hc59laqhjl.apps.googleusercontent.com',
    iosBundleId: 'com.example.derivtive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTsCoeKpBYH4-KDbzoLFBs9mcPO8lNWtU',
    appId: '1:69575353123:ios:fe94e87a1b8934a7056296',
    messagingSenderId: '69575353123',
    projectId: 'derivative-89e54',
    storageBucket: 'derivative-89e54.appspot.com',
    iosClientId: '69575353123-85ub9apnmao2tn27k5re27hc59laqhjl.apps.googleusercontent.com',
    iosBundleId: 'com.example.derivtive',
  );
}
