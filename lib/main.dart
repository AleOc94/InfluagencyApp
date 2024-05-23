import 'package:flutter/material.dart';
import 'registro_correo.dart'; // Importa la nueva pantalla
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influagency',
      theme: ThemeData(
        primaryColor: Color(0xFF9333f3), // Morado
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFffc929)), // Amarillo
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9333f3), // Fondo morado
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              
              Image.asset(
                'assets/images/influagency_logo.png', // Asegúrate de tener esta imagen en tu carpeta de assets
                height: 200,
              ),
              SizedBox(height: 50),
              Text(
                'Al tocar en entrar, usted acepta nuestros Términos. Sepa cómo procesamos sus datos en nuestra Política de Privacidad y Política de cookies.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
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
              SizedBox(height: 30),
              ButtonWidget(
                imagePath: 'assets/images/google_icon.png',
                text: 'ENTRAR CON GOOGLE    ',
                onPressed: () {
                  // Acción para el botón de Google
                },
              ),
              SizedBox(height: 20),
              ButtonWidget(
                imagePath: 'assets/images/correo_icon.png',
                text: 'ENTRAR CON E-MAIL      ',
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroCorreoScreen()), // Navega a la nueva pantalla
                  );
                },
              ),
              SizedBox(height: 20),
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

  ButtonWidget({required this.imagePath, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFffc929), // Fondo amarillo
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            color: Color(0xFF9333f3),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF9333f3), // Texto morado
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

