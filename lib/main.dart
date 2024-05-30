import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'user_screen.dart'; // Importamos el widget UserScreen
import 'registro_correo.dart'; // Importamos el widget RegistroCorreoScreen
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter(); // Initialize Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influagency',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 133, 25, 240),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromARGB(255, 255, 214, 90)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  Future<void> _signInWithFacebook(BuildContext context) async {
    print('Starting Facebook sign in...'); // Debug print
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      print('LoginResult: ${result.status}'); // Debug print
      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;
        print('AccessToken: ${accessToken?.tokenString}'); // Debug print
        if (accessToken != null) {
          final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.tokenString);
          await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
          print('Firebase sign in successful'); // Debug print
          // Navigate to UserScreen after successful login
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserScreen(),
            ),
          );
        } else {
          print('Access token is null');
        }
      } else {
        print('Facebook sign in failed: ${result.message}');
      }
    } catch (e) {
      print('Error during Facebook sign in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/influagency_logo.png', height: 200),
              const SizedBox(height: 50),
              // Texts and Buttons...
              ButtonWidget(
                imagePath: 'assets/images/google_icon.png',
                text: 'ENTRAR CON GOOGLE    ',
                onPressed: () {
                  // Action for the Google button
                  print('Google button pressed'); // Debug print
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                imagePath: 'assets/images/correo_icon.png',
                text: 'ENTRAR CON E-MAIL      ',
                onPressed: () {
                  print('Email button pressed'); // Debug print
                  // Navigate to the email registration screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroCorreoScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                imagePath: 'assets/images/facebook_icon.png',
                text: 'ENTRAR CON FACEBOOK',
                onPressed: () => _signInWithFacebook(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const ButtonWidget({Key? key, required this.imagePath, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 214, 90),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 24,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 133, 25, 240), // Texto morado
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}