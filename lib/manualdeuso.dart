import 'package:flutter/material.dart';
import 'bienvenida.dart';
import 'demo_swip.dart'; // Importa la pantalla DemoSwipe
import 'swipeoInfluencers.dart'; // Importa la pantalla SwipeoInfluencers

class ManualDeUsoScreen extends StatelessWidget {
  final String tipoUsuario;

  const ManualDeUsoScreen({Key? key, required this.tipoUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9333F3), // Fondo morado
      appBar: AppBar(
        title: const Text('Manual de Uso'),
        backgroundColor: const Color(0xFFFFC929), // Fondo amarillo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Instrucciones básicas de la aplicación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildInstruction(
              Icons.settings,
              'Botón Setting',
              'Este botón situado en la parte superior derecha con forma de "rueda dentada" te va a dirigir a tu perfil, con todas las funciones que necesites modificar o borrar del mismo.',
            ),
            _buildInstruction(
              Icons.info,
              'Botón de información',
              'Este botón situado en la zona superior derecha de las tarjetas de swipeo va a darte la opción de "voltear" la tarjeta y ver información específica sobre el perfil que estás visitando.',
            ),
            _buildInstruction(
              Icons.favorite,
              'Corazón de "like"',
              'Este botón te va a permitir darle "like" o "me gusta" al perfil que estás viendo actualmente.',
            ),
            _buildInstruction(
              Icons.undo,
              'Flecha de volver',
              'Este botón en forma de flecha ondulada situada en la parte inferior central de la pantalla te va a dar la opción de volver atrás por si diste "like" o "dislike" de forma equivocada o simplemente si quieres volver a ver la tarjeta anterior.',
            ),
            _buildInstruction(
              Icons.close,
              'Cruz',
              'El botón de la X sirve para dar "dislike" o "no me interesa" a la tarjeta que estás viendo actualmente.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Menú inferior',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildInstruction(
              Icons.home,
              'Botón Home',
              'Este botón en forma de "casa" tiene la función de volver a la página principal de la aplicación desde cualquier parte de la misma.',
            ),
            _buildInstruction(
              Icons.search,
              'Botón Buscar',
              'Este botón en forma de "lupa" tiene la funcionalidad de dirigirte a una nueva página en la que puedes filtrar tus gustos de forma específica.',
            ),
            _buildInstruction(
              Icons.bookmark,
              'Botón de guardado',
              'Este botón en forma de lupa con dos puntas debajo sirve para visualizar los "likes" y "matchs" que tienes con otros perfiles.',
            ),
            const SizedBox(height: 20),
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
                  backgroundColor: const Color(0xFFFFC929), // Fondo amarillo
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Aceptar',
                  style: TextStyle(
                    color: Color(0xFF9333F3), // Texto morado
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}