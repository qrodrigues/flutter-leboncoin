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
    apiKey: 'AIzaSyDCgk3e3AOu1yuXxSqGRkZ_9IeRnS741PA',
    appId: '1:466996665553:web:e7828db41290d7c4a539f0',
    messagingSenderId: '466996665553',
    projectId: 'market-place-app-e8464',
    authDomain: 'market-place-app-e8464.firebaseapp.com',
    storageBucket: 'market-place-app-e8464.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA127R2zIG0X2LR8p9fkS4tH-owMzdmKQk',
    appId: '1:466996665553:android:3eca8c3fcdfa262da539f0',
    messagingSenderId: '466996665553',
    projectId: 'market-place-app-e8464',
    storageBucket: 'market-place-app-e8464.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-uLO2WvGogbH3GRAYB23oARiRQxTFKGg',
    appId: '1:466996665553:ios:4c73ac2b88081c63a539f0',
    messagingSenderId: '466996665553',
    projectId: 'market-place-app-e8464',
    storageBucket: 'market-place-app-e8464.appspot.com',
    iosClientId: '466996665553-9p2jafetttf4lo94ss37v2suhq5kmvsf.apps.googleusercontent.com',
    iosBundleId: 'com.example.myTestApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-uLO2WvGogbH3GRAYB23oARiRQxTFKGg',
    appId: '1:466996665553:ios:4c73ac2b88081c63a539f0',
    messagingSenderId: '466996665553',
    projectId: 'market-place-app-e8464',
    storageBucket: 'market-place-app-e8464.appspot.com',
    iosClientId: '466996665553-9p2jafetttf4lo94ss37v2suhq5kmvsf.apps.googleusercontent.com',
    iosBundleId: 'com.example.myTestApp',
  );
}
