import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // Importa kIsWeb desde foundation.dart

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return androidOptions;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return iOSOptions;
    } else if (kIsWeb) { // Verifica si se está ejecutando en la plataforma web
      return webOptions;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      return windowsOptions;
    } else {
      throw UnsupportedError('Plataforma no soportada');
    }
  }

  static FirebaseOptions androidOptions = const FirebaseOptions(
    appId: '1:886077325287:android:9dcfb382f2ab691c580742',
    apiKey: 'AIzaSyBnDHAXDq2q0YfJzFiYRm-VaDUTEWThOg8',
    messagingSenderId: '', // Puedes dejarlo vacío si no estás utilizando Firebase Cloud Messaging
    projectId: 'influagency-bddba',
    databaseURL: 'https://influagency-bddba.firebaseio.com',
    storageBucket: 'influagency-bddba.appspot.com',
  );

  static FirebaseOptions iOSOptions = const FirebaseOptions(
    appId: '1:886077325287:ios:f55a09771f0c34d7580742',
    apiKey: 'AIzaSyBnDHAXDq2q0YfJzFiYRm-VaDUTEWThOg8',
    messagingSenderId: '', // Puedes dejarlo vacío si no estás utilizando Firebase Cloud Messaging
    projectId: 'influagency-bddba',
    databaseURL: 'https://influagency-bddba.firebaseio.com',
    storageBucket: 'influagency-bddba.appspot.com',
  );

  static FirebaseOptions webOptions = const FirebaseOptions(
    appId: '1:886077325287:web:0ff1bd19fd4b39f4580742',
    apiKey: 'AIzaSyBnDHAXDq2q0YfJzFiYRm-VaDUTEWThOg8',
    messagingSenderId: '', // Puedes dejarlo vacío si no estás utilizando Firebase Cloud Messaging
    projectId: 'influagency-bddba',
    databaseURL: 'https://influagency-bddba.firebaseio.com',
    storageBucket: 'influagency-bddba.appspot.com',
  );

  static FirebaseOptions windowsOptions = const FirebaseOptions(
    appId: '1:886077325287:web:79505f88fe05071d580742',
    apiKey: 'AIzaSyBnDHAXDq2q0YfJzFiYRm-VaDUTEWThOg8',
    messagingSenderId: '', // Puedes dejarlo vacío si no estás utilizando Firebase Cloud Messaging
    projectId: 'influagency-bddba',
    databaseURL: 'https://influagency-bddba.firebaseio.com',
    storageBucket: 'influagency-bddba.appspot.com',
  );
}