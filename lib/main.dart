import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'registro_correo.dart'; // Importa la nueva pantalla
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully.'); // Mensaje de depuración
  } catch (error) {
    print('Error initializing Firebase: $error'); // Mensaje de depuración
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influagency',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 133, 25, 240), // Morado
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromARGB(255, 255, 214, 90)), // Amarillo
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Fondo morado
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/influagency_logo.png', // Asegúrate de tener esta imagen en tu carpeta de assets
                height: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                'Al tocar en entrar, usted acepta nuestros Términos. Sepa cómo procesamos sus datos en nuestra Política de Privacidad y Política de cookies.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Términos',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: '. Sepa cómo procesamos sus datos en nuestra ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Política de Privacidad',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' y ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Política de cookies',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                imagePath: 'assets/images/google_icon.png',
                text: 'ENTRAR CON GOOGLE    ',
                onPressed: () {
                  // Acción para el botón de Google
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                imagePath: 'assets/images/correo_icon.png',
                text: 'ENTRAR CON E-MAIL      ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroCorreoScreen()), // Navega a la nueva pantalla
                  );
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                imagePath: 'assets/images/facebook_icon.png',
                text: 'ENTRAR CON FACEBOOK',
                onPressed: () {
                  // Acción para el botón de Facebook
                },
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
        backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
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