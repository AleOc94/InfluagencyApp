import 'package:flutter/material.dart';
import 'package:influmeet/InfluencerMarca.dart';
import 'package:influmeet/registro_correo.dart';
import 'base_datos.dart'; // Importa la clase BaseDatos donde se define guardarDatosUsuario

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({Key? key}) : super(key: key);

  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Color de fondo morado
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Color de la AppBar morado
        elevation: 0, // Sin sombra
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿CÓMO TE LLAMAS?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Introduce tu nombre:',
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Así es como se mostrará en tu perfil\nPODRÁS CAMBIARLO MÁS TARDE.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  _guardarDatosUsuario(context, _nameController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IfluencerMarca(correoUsuario: _nameController.text)), // Corrección aquí
                  );
                } else {
                  // Muestra un mensaje de error si el nombre está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingresa un nombre válido')),
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
                'Continuar',
                style: TextStyle(
                  color: Color.fromARGB(255, 133, 25, 240), // Texto morado
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarDatosUsuario(BuildContext context, String nombreUsuario) {
    BaseDatos().guardarDatosUsuario(nombreUsuario, _nameController.text, ''); // Cambio en el llamado de la función
  }
}

