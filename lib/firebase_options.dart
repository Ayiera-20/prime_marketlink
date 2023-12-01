// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'

    show defaultTargetPlatform, kIsWeb, TargetPlatform;
    Future<void> main() async {
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } catch (e) {
        print('Error initializing Firebase: $e');
      }
    }

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
    apiKey: 'AIzaSyAWgSzwUvTCV2agb3xYKh9lQyhj8EBCs9A',
    appId: '1:799984183169:web:45825689b3df030763ea80',
    messagingSenderId: '799984183169',
    projectId: 'prime-market-link',
    authDomain: 'prime-market-link.firebaseapp.com',
    storageBucket: 'prime-market-link.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEe9KVLCyTA6dxuUut4RykUyRXvZgkGto',
    appId: '1:799984183169:android:16fb460c7c6a6e7363ea80',
    messagingSenderId: '799984183169',
    projectId: 'prime-market-link',
    storageBucket: 'prime-market-link.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9LiH_pTzQMCWC8itukqeo68eAokBX-jk',
    appId: '1:799984183169:ios:6a80bf6145da0fea63ea80',
    messagingSenderId: '799984183169',
    projectId: 'prime-market-link',
    storageBucket: 'prime-market-link.appspot.com',
    iosBundleId: 'com.example.primeMarketlink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9LiH_pTzQMCWC8itukqeo68eAokBX-jk',
    appId: '1:799984183169:ios:12f780b91c21311463ea80',
    messagingSenderId: '799984183169',
    projectId: 'prime-market-link',
    storageBucket: 'prime-market-link.appspot.com',
    iosBundleId: 'com.example.primeMarketlink.RunnerTests',
  );
}