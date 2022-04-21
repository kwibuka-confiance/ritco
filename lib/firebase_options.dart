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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBaEmrUzXNMNPv7khL5ybs18_XE1PhfsW8',
    appId: '1:341782083749:web:4ec032f14865f96e7a754c',
    messagingSenderId: '341782083749',
    projectId: 'ritco-app',
    authDomain: 'ritco-app.firebaseapp.com',
    databaseURL: 'https://ritco-app-default-rtdb.firebaseio.com',
    storageBucket: 'ritco-app.appspot.com',
    measurementId: 'G-DDKXF5ZPMS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZu_2bS4g7JzQoOREaT2LJHyN5VvB4F5E',
    appId: '1:341782083749:android:8116d8ff395bfe117a754c',
    messagingSenderId: '341782083749',
    projectId: 'ritco-app',
    databaseURL: 'https://ritco-app-default-rtdb.firebaseio.com',
    storageBucket: 'ritco-app.appspot.com',
  );
}