import 'package:flutter/material.dart';
import 'InfluencerMarca.dart'; // Importa la clase IfluencerMarca
import 'base_datos.dart'; // Importa la clase BaseDatos donde se define guardarDatosUsuario
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameInputScreen extends StatefulWidget {
  final String correoUsuario;

  const NameInputScreen({Key? key, required this.correoUsuario, required tipoUsuario}) : super(key: key);

  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  String _selectedCategory = 'Deporte';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Deporte', 'icon': FontAwesomeIcons.futbol},
    {'name': 'Entretenimiento', 'icon': FontAwesomeIcons.film},
    {'name': 'Humor', 'icon': FontAwesomeIcons.laugh},
    {'name': 'Belleza', 'icon': FontAwesomeIcons.palette},
    {'name': 'Tecnologías', 'icon': FontAwesomeIcons.laptop},
    {'name': 'Gastronomía', 'icon': FontAwesomeIcons.utensils},
    {'name': 'Música', 'icon': FontAwesomeIcons.music},
  ];

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
      body: SingleChildScrollView(
        child: Padding(
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
              const Text(
                '¿En qué categoría te identificas?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['name'],
                    child: Row(
                      children: [
                        FaIcon(category['icon'], color: Colors.white),
                        const SizedBox(width: 10),
                        Text(category['name']),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                dropdownColor: Colors.purple[800],
              ),
              const SizedBox(height: 20),
              const Text(
                'Cuéntanos sobre tí',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                maxLength: 150,
                decoration: InputDecoration(
                  hintText: 'Escribe una breve descripción:',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              const Text(
                'Deja tu link (opcional):',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _linkController,
                decoration: InputDecoration(
                  hintText: 'Introduce tu link de Instagram u otra red social:',
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
              SizedBox(
                width: double.infinity, // Make the button as wide as the parent
                child: ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      _guardarDatosUsuario(context, _nameController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IfluencerMarca(correoUsuario: widget.correoUsuario)),
                      );
                    } else {
                      // Muestra un mensaje de error si el nombre está vacío
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, ingresa un nombre válido')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20), // Increase the button height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _guardarDatosUsuario(BuildContext context, String nombreUsuario) async {
    final Map<String, dynamic> datosAdicionales = {
      'biografia': _descriptionController.text,
      'categorias': [_selectedCategory],
      'foto_perfil': '',
      'linksRedesSociales': {'instagram': _linkController.text, 'tiktok': '', 'youtube': ''},
    };

    final BaseDatos baseDatos = BaseDatos();
    await baseDatos.guardarDatosUsuario(
      nombreUsuario,
      widget.correoUsuario,
      'influencer',
      datosAdicionales,
    );
  }
}
