import 'package:flutter/material.dart';

class RegistroCorreoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9333f3), // Fondo morado
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'REGÍSTRATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Obviar el texto de "Inicia sesión para continuar"
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CORREO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'jlara.montes@gmail.com',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Acción para el botón de Login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFffc929), // Color de fondo del botón
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF9333f3), // Color del texto del botón
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

