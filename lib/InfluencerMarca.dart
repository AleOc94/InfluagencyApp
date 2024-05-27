// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IfluencerMarca extends StatelessWidget {
  const IfluencerMarca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9333f3), // Fondo morado
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
              ),
              const SizedBox(height: 20),
              const Center(
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
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Marca"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFffc929), // Fondo amarillo
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '   Marca   ',
                        style: TextStyle(
                          color: Color(0xFF9333f3), // Texto morado
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Influencer"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFffc929), // Fondo amarillo
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
