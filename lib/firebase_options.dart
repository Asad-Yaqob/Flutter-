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
    apiKey: 'AIzaSyBjJd2ktN9csjqluH7NU4ZjypSyfdl4F9w',
    appId: '1:630025644425:web:649eac6d156baf02fed958',
    messagingSenderId: '630025644425',
    projectId: 'test01-ecfe0',
    authDomain: 'test01-ecfe0.firebaseapp.com',
    storageBucket: 'test01-ecfe0.appspot.com',
    measurementId: 'G-8SVKTBN56L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqTU07AZCLfHXjaedmN652sqiLwg04nHg',
    appId: '1:630025644425:android:a92f26abd1fe3290fed958',
    messagingSenderId: '630025644425',
    projectId: 'test01-ecfe0',
    storageBucket: 'test01-ecfe0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvku0YFQK1AbU0Mf7OwgHIwN6V44D57ow',
    appId: '1:630025644425:ios:ae7286b24333001cfed958',
    messagingSenderId: '630025644425',
    projectId: 'test01-ecfe0',
    storageBucket: 'test01-ecfe0.appspot.com',
    iosBundleId: 'com.example.practiceCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvku0YFQK1AbU0Mf7OwgHIwN6V44D57ow',
    appId: '1:630025644425:ios:c02ba1fae03a773afed958',
    messagingSenderId: '630025644425',
    projectId: 'test01-ecfe0',
    storageBucket: 'test01-ecfe0.appspot.com',
    iosBundleId: 'com.example.practiceCrud.RunnerTests',
  );
}
