import 'package:flutter/material.dart';

class IfluencerMarca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9333f3), // Fondo morado
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '¿ERES MARCA O\nERES INFLUENCER?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Marca"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFffc929), // Fondo amarillo
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '   Marca   ',
                        style: TextStyle(
                          color: Color(0xFF9333f3), // Texto morado
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Influencer"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFffc929), // Fondo amarillo
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Influencer',
                        style: TextStyle(
                          color: Color(0xFF9333f3), // Texto morado
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
