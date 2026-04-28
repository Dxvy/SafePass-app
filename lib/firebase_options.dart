// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// This file is a placeholder. Run `flutterfire configure` with your Firebase
// project to replace it with your actual credentials.
//
// Steps:
//   1. Create a Firebase project at https://console.firebase.google.com
//   2. Run: flutterfire configure
//   3. Select your project and target platforms (android, ios)
//
// Until then, the app runs fully in Demo Mode (no Firebase required).

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // ⚠️ PLACEHOLDER — Replace with your Firebase project values
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_WEB_API_KEY',
    appId: '1:000000000000:web:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'your-safepass-project',
    authDomain: 'your-safepass-project.firebaseapp.com',
    storageBucket: 'your-safepass-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_ANDROID_API_KEY',
    appId: '1:000000000000:android:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'your-safepass-project',
    storageBucket: 'your-safepass-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: '1:000000000000:ios:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'your-safepass-project',
    storageBucket: 'your-safepass-project.appspot.com',
    iosBundleId: 'com.safepass.app',
  );
}
