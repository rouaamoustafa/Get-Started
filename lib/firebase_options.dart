// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB7q-kX2gDSZZt_ie4hbh1mZy0aQy-XqDo',
    appId: '1:1096043376516:web:4c7548ce060bce1206f7d1',
    messagingSenderId: '1096043376516',
    projectId: 'getstartedcommerce',
    authDomain: 'getstartedcommerce.firebaseapp.com',
    storageBucket: 'getstartedcommerce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK37RKR2ljYD-7lj2FvdiTJvH6272VgdE',
    appId: '1:1096043376516:android:a985c3f8ddb512a906f7d1',
    messagingSenderId: '1096043376516',
    projectId: 'getstartedcommerce',
    storageBucket: 'getstartedcommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzKyP2CNPTrFRJRgLgXLR3Uo8vRMLb-SU',
    appId: '1:1096043376516:ios:c69a79f47066889f06f7d1',
    messagingSenderId: '1096043376516',
    projectId: 'getstartedcommerce',
    storageBucket: 'getstartedcommerce.appspot.com',
    iosBundleId: 'com.example.getStarted',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzKyP2CNPTrFRJRgLgXLR3Uo8vRMLb-SU',
    appId: '1:1096043376516:ios:c69a79f47066889f06f7d1',
    messagingSenderId: '1096043376516',
    projectId: 'getstartedcommerce',
    storageBucket: 'getstartedcommerce.appspot.com',
    iosBundleId: 'com.example.getStarted',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7q-kX2gDSZZt_ie4hbh1mZy0aQy-XqDo',
    appId: '1:1096043376516:web:46a0b5d20596c10506f7d1',
    messagingSenderId: '1096043376516',
    projectId: 'getstartedcommerce',
    authDomain: 'getstartedcommerce.firebaseapp.com',
    storageBucket: 'getstartedcommerce.appspot.com',
  );
}