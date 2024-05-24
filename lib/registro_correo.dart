import 'package:flutter/material.dart';
import 'bienvenida.dart'; // Importa la pantalla de bienvenida

class RegistroCorreoScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  RegistroCorreoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9333f3), // Fondo morado
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REGÍSTRATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                labelText: 'Introducir correo',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'ejemplo@correo.com', // Aquí se añade el hint
                hintStyle: const TextStyle(color: Colors.white60), // Color del hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isNotEmpty) {
                                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BienvenidaScreen()),
                  );
                } else {
                  // Muestra un mensaje de error si el correo está vacío
                                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingresa un correo válido')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFffc929), // Fondo amarillo
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  color: Color(0xFF9333f3), // Texto morado
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
