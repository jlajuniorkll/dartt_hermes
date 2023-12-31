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
    apiKey: 'AIzaSyDpMHZRrgYFobqR9pWxHC3hMpLdSddZMO0',
    appId: '1:762443333409:web:68ae6fc521a35f655bc860',
    messagingSenderId: '762443333409',
    projectId: 'dartt-hermes',
    authDomain: 'dartt-hermes.firebaseapp.com',
    storageBucket: 'dartt-hermes.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLc7vMoRNpKXXw8BJ8QPv2nQh2mfxcxLE',
    appId: '1:762443333409:android:ed6267b5453d9a0a5bc860',
    messagingSenderId: '762443333409',
    projectId: 'dartt-hermes',
    storageBucket: 'dartt-hermes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBpCMLzwCSPCGb3sHRvZ5hbKD9OZDk0lA',
    appId: '1:762443333409:ios:66a8a910eb21034b5bc860',
    messagingSenderId: '762443333409',
    projectId: 'dartt-hermes',
    storageBucket: 'dartt-hermes.appspot.com',
    iosClientId: '762443333409-5gf82tg3r37bno5656qmdcgciqsogqo2.apps.googleusercontent.com',
    iosBundleId: 'com.example.darttHermes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBpCMLzwCSPCGb3sHRvZ5hbKD9OZDk0lA',
    appId: '1:762443333409:ios:cbd69c26e48caaa85bc860',
    messagingSenderId: '762443333409',
    projectId: 'dartt-hermes',
    storageBucket: 'dartt-hermes.appspot.com',
    iosClientId: '762443333409-4leivvjo74hor0qrh9nnn7a7bd2eevn1.apps.googleusercontent.com',
    iosBundleId: 'com.example.darttHermes.RunnerTests',
  );
}
