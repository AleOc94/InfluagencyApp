import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'comotellamas.dart'; // Importa la biblioteca de gestos

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9333f3), // Fondo morado
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Image.asset(
                'assets/images/influagency_logo.png', // Asegúrate de tener esta imagen en tu carpeta de assets
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'BIENVENIDO A INFLUAGENCY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Por favor, sigue nuestras normas internas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRuleText('SÉ TU MISMO', 'Asegúrate de que las fotos, edad y biografía que aparecen en tu perfil reflejan fielmente quién eres.'),
                  _buildRuleText('LA SEGURIDAD ES LO PRIMERO', 'No compartas tu información personal a la ligera. ', isLink: true),
                  _buildRuleText('TÓMATELO CON CALMA', 'Respeta a los demás y trata a todo el mundo como te gustaría que te tratasen a ti.'),
                  _buildRuleText('TOMA LA INICIATIVA', 'Denuncia siempre cualquier conducta inapropiada.'),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NameInputScreen()), // Navega a la nueva pantalla
                  );
                  // Acción cuando se presiona el botón "Acepto"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFffc929), // Fondo amarillo
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Acepto',
                  style: TextStyle(
                    color: Color(0xFF9333f3), // Texto morado
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleText(String title, String description, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              recognizer: isLink ? (TapGestureRecognizer()..onTap = () {}) : null, // Aquí puedes agregar la acción para el link
            ),
          ],
        ),
      ),
    );
  }
}
