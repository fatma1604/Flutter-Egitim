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
    apiKey: 'AIzaSyBWi-bv-RvbmQXNTbPYVvbFdHN82fSmqPI',
    appId: '1:327349589311:web:565988a55ba790d4666f8a',
    messagingSenderId: '327349589311',
    projectId: 'flutetr-firabase-app',
    authDomain: 'flutetr-firabase-app.firebaseapp.com',
    storageBucket: 'flutetr-firabase-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWsTCFEBasTS1vaDf_C6-VaOvNwFlqpWU',
    appId: '1:327349589311:android:1c1cc8708b821313666f8a',
    messagingSenderId: '327349589311',
    projectId: 'flutetr-firabase-app',
    storageBucket: 'flutetr-firabase-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAS2EJPqahKv9QvXZq4qdDr0k8HbNReQ9g',
    appId: '1:327349589311:ios:e7840388c9bca8e2666f8a',
    messagingSenderId: '327349589311',
    projectId: 'flutetr-firabase-app',
    storageBucket: 'flutetr-firabase-app.appspot.com',
    iosBundleId: 'com.example.flutterfire',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAS2EJPqahKv9QvXZq4qdDr0k8HbNReQ9g',
    appId: '1:327349589311:ios:d0ad028e4438233c666f8a',
    messagingSenderId: '327349589311',
    projectId: 'flutetr-firabase-app',
    storageBucket: 'flutetr-firabase-app.appspot.com',
    iosBundleId: 'com.example.flutterfire.RunnerTests',
  );
}