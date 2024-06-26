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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBTOeqxPlwm3QAjN5ctOBDhnvjvfmAtMx0',
    appId: '1:901804151640:web:34d405d02cf99d86778b2d',
    messagingSenderId: '901804151640',
    projectId: 'health-fba0e',
    authDomain: 'health-fba0e.firebaseapp.com',
    databaseURL: 'https://health-fba0e-default-rtdb.firebaseio.com',
    storageBucket: 'health-fba0e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtDm1MFLQs53yci0RCVplWXiaUg06PWtA',
    appId: '1:901804151640:android:f53e645536c1d0c8778b2d',
    messagingSenderId: '901804151640',
    projectId: 'health-fba0e',
    databaseURL: 'https://health-fba0e-default-rtdb.firebaseio.com',
    storageBucket: 'health-fba0e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1WeiIzQqGEwYLRlq9SI1D5A6lU8VrjjY',
    appId: '1:901804151640:ios:4d6fe0e78a7ae562778b2d',
    messagingSenderId: '901804151640',
    projectId: 'health-fba0e',
    databaseURL: 'https://health-fba0e-default-rtdb.firebaseio.com',
    storageBucket: 'health-fba0e.appspot.com',
    iosClientId: '901804151640-b9i833or66bfrl3nomg9a76lsv9hfdvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappUi',
  );
}