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
        throw UnsupportedError('Unsupported platform');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD32uhsO3l3uFNTXFtbtkDotc8pIO5FUhc',
    appId: '1:676612275331:android:8193ed9d2e1f34f1c46fb6',
    messagingSenderId: '676612275331',
    projectId: 'todo-app-077',
    authDomain: 'todo-app-077.firebaseapp.com',
    databaseURL: 'https://todo-app-077-default-rtdb.firebaseio.com',
    storageBucket: 'todo-app-077.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD32uhsO3l3uFNTXFtbtkDotc8pIO5FUhc',
    appId: '1:676612275331:android:8193ed9d2e1f34f1c46fb6',
    messagingSenderId: '676612275331',
    projectId: 'todo-app-077',
    databaseURL: 'https://todo-app-077-default-rtdb.firebaseio.com',
    storageBucket: 'todo-app-077.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD32uhsO3l3uFNTXFtbtkDotc8pIO5FUhc',
    appId: '1:676612275331:android:8193ed9d2e1f34f1c46fb6',
    messagingSenderId: '676612275331',
    projectId: 'todo-app-077',
    databaseURL: 'https://todo-app-077-default-rtdb.firebaseio.com',
    storageBucket: 'todo-app-077.firebasestorage.app',
    iosBundleId: 'com.example.todo_app',
  );
}