import 'package:flutter/material.dart';

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
        colorScheme:ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFffc929)), // Amarillo
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
      backgroundColor: Color(0xFFFFC929), // Fondo amarillo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Image.asset(
                'assets/images/influagency_logo.png', // Asegúrate de tener esta imagen en tu carpeta de assets
                height: 100,
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF9333f3),
              child: Icon(
                Icons.person,
                size: 50,
                color: Color(0xFFFFC929),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón de inicio de sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9333f3), // Color de fondo del botón
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Color(0xFFFFC929), // Color del texto del botón
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para el botón de registro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9333f3), // Color de fondo del botón
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFFFFC929), // Color del texto del botón
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
