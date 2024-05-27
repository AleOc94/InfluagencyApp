import 'package:flutter/material.dart';
import 'InfluencerMarca.dart';

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isNameValid = false;

  NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8E44AD), // Color de fondo morado
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E44AD), // Color de la AppBar morado
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
              onChanged: (value) {
                setState(() {
                  _isNameValid = value.trim().isNotEmpty;
                });
              },
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
                                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IfluencerMarca()),
                  );
                } else {
                  // Muestra un mensaje de error si el correo está vacío
                                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingresa un nombre válido')),
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
