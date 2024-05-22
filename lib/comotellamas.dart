import 'package:flutter/material.dart';

class NameInputScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8E44AD), // Color de fondo morado
      appBar: AppBar(
        backgroundColor: Color(0xFF8E44AD), // Color de la AppBar morado
        elevation: 0, // Sin sombra
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
            Text(
              '¿CÓMO TE LLAMAS?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Introduce tu nombre:',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Así es como se mostrará en tu perfil\nPODRÁS CAMBIARLO MÁS TARDE.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}