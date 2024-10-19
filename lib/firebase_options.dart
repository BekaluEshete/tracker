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
    apiKey: 'AIzaSyDA8NZh9SEDyTbKXQAe74XYs86RIdh75Lk',
    appId: '1:38879352746:web:f4b5c7cab3ced90bf2fdd3',
    messagingSenderId: '38879352746',
    projectId: 'fitness-tracker-bc4b5',
    authDomain: 'fitness-tracker-bc4b5.firebaseapp.com',
    storageBucket: 'fitness-tracker-bc4b5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoJuZRlOLILXT2jHPlAo_RwCJ1Et2_MdY',
    appId: '1:38879352746:android:270e2073582db5fbf2fdd3',
    messagingSenderId: '38879352746',
    projectId: 'fitness-tracker-bc4b5',
    storageBucket: 'fitness-tracker-bc4b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_IQRgoYWjyB3chCzzT55b3xjCcTmB9s8',
    appId: '1:38879352746:ios:a44c432175603c13f2fdd3',
    messagingSenderId: '38879352746',
    projectId: 'fitness-tracker-bc4b5',
    storageBucket: 'fitness-tracker-bc4b5.appspot.com',
    iosBundleId: 'com.example.fitnessTracker',
  );

}