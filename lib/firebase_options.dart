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
    apiKey: 'AIzaSyCyVqPA1Zl_yOpebmXMoLO3ozZSFawmqjI',
    appId: '1:595643143884:web:7c4606537050391877d469',
    messagingSenderId: '595643143884',
    projectId: 'gerenciador-senhas-72094',
    authDomain: 'gerenciador-senhas-72094.firebaseapp.com',
    storageBucket: 'gerenciador-senhas-72094.appspot.com',
    measurementId: 'G-RP53C3WF3X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-h3_aLcXVFDUfqftxF-fDrr4nrhYCz5A',
    appId: '1:595643143884:android:97dd9cceb82153b777d469',
    messagingSenderId: '595643143884',
    projectId: 'gerenciador-senhas-72094',
    storageBucket: 'gerenciador-senhas-72094.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg1ZF4T3h5esdoOhxL7vwVfeQqIEwU60o',
    appId: '1:595643143884:ios:928d963cdf06eadb77d469',
    messagingSenderId: '595643143884',
    projectId: 'gerenciador-senhas-72094',
    storageBucket: 'gerenciador-senhas-72094.appspot.com',
    iosClientId: '595643143884-k710aaca2fqrbehqvpsovf3iqqd5hpfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.gerenciador',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg1ZF4T3h5esdoOhxL7vwVfeQqIEwU60o',
    appId: '1:595643143884:ios:c840c1e85e11621a77d469',
    messagingSenderId: '595643143884',
    projectId: 'gerenciador-senhas-72094',
    storageBucket: 'gerenciador-senhas-72094.appspot.com',
    iosClientId: '595643143884-k2pp9jap6218q9plpro1kh1f2mk2at82.apps.googleusercontent.com',
    iosBundleId: 'com.example.gerenciador.RunnerTests',
  );
}