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
    apiKey: 'AIzaSyCYvWzBDmYYJRadClErwjvGWmPqNPyhEI4',
    appId: '1:510782302427:web:eb375acfd9314e4c2e44fe',
    messagingSenderId: '510782302427',
    projectId: 'ecommerce-349b3',
    authDomain: 'ecommerce-349b3.firebaseapp.com',
    storageBucket: 'ecommerce-349b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSiISkMrYErZ32yK6r5wFH2vqK_kh2p_4',
    appId: '1:510782302427:android:dbe4f1a079ba34322e44fe',
    messagingSenderId: '510782302427',
    projectId: 'ecommerce-349b3',
    storageBucket: 'ecommerce-349b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnkOAEYmYOnQOOwhXaRpJ9m00CUvi9PmA',
    appId: '1:510782302427:ios:b7a2980d2e3c9a0c2e44fe',
    messagingSenderId: '510782302427',
    projectId: 'ecommerce-349b3',
    storageBucket: 'ecommerce-349b3.appspot.com',
    iosBundleId: 'com.example.mysecondapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnkOAEYmYOnQOOwhXaRpJ9m00CUvi9PmA',
    appId: '1:510782302427:ios:abb682ff20b15fe92e44fe',
    messagingSenderId: '510782302427',
    projectId: 'ecommerce-349b3',
    storageBucket: 'ecommerce-349b3.appspot.com',
    iosBundleId: 'com.example.mysecondapp.RunnerTests',
  );
}