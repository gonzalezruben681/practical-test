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
    apiKey: 'AIzaSyC6KVa3TUw6LFnaicKMsHXr8_GRRZk0sOM',
    appId: '1:6852483431:web:439d29d32b3ffe9899b7c2',
    messagingSenderId: '6852483431',
    projectId: 'votaciones-ipum',
    authDomain: 'votaciones-ipum.firebaseapp.com',
    databaseURL: 'https://votaciones-ipum-default-rtdb.firebaseio.com',
    storageBucket: 'votaciones-ipum.appspot.com',
    measurementId: 'G-PHB9BJ2C0M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEAMsKE-eg_2Y0jfAFWtwbFkYWEo3-iL4',
    appId: '1:6852483431:android:fa977393309d86d299b7c2',
    messagingSenderId: '6852483431',
    projectId: 'votaciones-ipum',
    databaseURL: 'https://votaciones-ipum-default-rtdb.firebaseio.com',
    storageBucket: 'votaciones-ipum.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByrRu63hlzlFFAgga9hVLsSjGJllxg4yo',
    appId: '1:6852483431:ios:fb2ef8c09d22b9a499b7c2',
    messagingSenderId: '6852483431',
    projectId: 'votaciones-ipum',
    databaseURL: 'https://votaciones-ipum-default-rtdb.firebaseio.com',
    storageBucket: 'votaciones-ipum.appspot.com',
    iosClientId:
        '6852483431-jq9l8fl0akcnfq4eqsgv8l4t6opj1mc4.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrCodeGestor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByrRu63hlzlFFAgga9hVLsSjGJllxg4yo',
    appId: '1:6852483431:ios:fb2ef8c09d22b9a499b7c2',
    messagingSenderId: '6852483431',
    projectId: 'votaciones-ipum',
    databaseURL: 'https://votaciones-ipum-default-rtdb.firebaseio.com',
    storageBucket: 'votaciones-ipum.appspot.com',
    iosClientId:
        '6852483431-jq9l8fl0akcnfq4eqsgv8l4t6opj1mc4.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrCodeGestor',
  );
}
