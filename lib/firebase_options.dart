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
    apiKey: 'AIzaSyC3w2ToVrRQTYuvGvC_dfY4-Wr3pRsO07s',
    appId: '1:706858136369:web:542b0fbe74212f2766b610',
    messagingSenderId: '706858136369',
    projectId: 'market1-ece41',
    authDomain: 'market1-ece41.firebaseapp.com',
    storageBucket: 'market1-ece41.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAZh0OwIK3WMvxQsf1ioIF5l9Bd9243tI',
    appId: '1:706858136369:android:d49d1e3f1bb7f26666b610',
    messagingSenderId: '706858136369',
    projectId: 'market1-ece41',
    storageBucket: 'market1-ece41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByfuz8iIFd0UsYdCvE2bKRHrurt2n-GQo',
    appId: '1:706858136369:ios:fa98ea1739f1579166b610',
    messagingSenderId: '706858136369',
    projectId: 'market1-ece41',
    storageBucket: 'market1-ece41.appspot.com',
    iosClientId: '706858136369-eb3gct0v2uht2vissg1c3e7jug7m9afh.apps.googleusercontent.com',
    iosBundleId: 'com.example.market1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByfuz8iIFd0UsYdCvE2bKRHrurt2n-GQo',
    appId: '1:706858136369:ios:fa98ea1739f1579166b610',
    messagingSenderId: '706858136369',
    projectId: 'market1-ece41',
    storageBucket: 'market1-ece41.appspot.com',
    iosClientId: '706858136369-eb3gct0v2uht2vissg1c3e7jug7m9afh.apps.googleusercontent.com',
    iosBundleId: 'com.example.market1',
  );
}
