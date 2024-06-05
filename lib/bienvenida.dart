import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'demo_swip.dart'; // Importa las pantallas correspondientes
import 'swipeoInfluencers.dart';

class BienvenidaScreen extends StatelessWidget {
  final String tipoUsuario;

  const BienvenidaScreen({super.key, required this.tipoUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Fondo morado
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
                onPressed: () {
                  if (tipoUsuario == 'marca') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DemoSwipe()),
                    );
                  } else if (tipoUsuario == 'influencer') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SwipeoInfluencers()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Acepto',
                  style: TextStyle(
                    color: Color.fromARGB(255, 133, 25, 240), // Texto morado
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
