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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjC3N-QU4da1KOeF20d2xBb33y1fb_ZA4',
    appId: '1:744088180813:android:a6b50745856df907ada404',
    messagingSenderId: '744088180813',
    projectId: 'brightgas-undipa-app',
    storageBucket: 'brightgas-undipa-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGpuAQlH0HTvOXtXH0DlUpDCErfunbG5A',
    appId: '1:744088180813:ios:f3ab84fc5e7a7462ada404',
    messagingSenderId: '744088180813',
    projectId: 'brightgas-undipa-app',
    storageBucket: 'brightgas-undipa-app.appspot.com',
    androidClientId: '744088180813-e9a3fsvmepe2u0uqeadupt1h05gbv2kd.apps.googleusercontent.com',
    iosClientId: '744088180813-6uu8rc0ql6n4b9d1vmv3gv3thmlag8dl.apps.googleusercontent.com',
    iosBundleId: 'id.brightgas.customer',
  );
}
