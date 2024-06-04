import 'package:flutter/material.dart';
import 'demo_swip.dart'; 

class BuscarPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'title': 'Deporte',
      'description': 'Dónde creadores de contenido y marcas de todo tipo de deporte se encuentran.',
      'image': 'assets/deportes.jpg' // Agrega las imágenes en la carpeta assets
    },
    {
      'title': 'Entretenimiento',
      'description': 'Aquí se encuentran creadores de contenido y marcas relacionadas con el entretenimiento.',
      'image': 'assets/entretenimiento.jpg'
    },
    {
      'title': 'Humor',
      'description': 'Todo lo relacionado con la risa y el humor se encuentra aquí.',
      'image': 'assets/humor.jpg'
    },
    {
      'title': 'Belleza',
      'description': 'Espacio dedicado a todos los creadores de contenido y marcas relacionados con la belleza.',
      'image': 'assets/belleza.jpg'
    },
    {
      'title': 'Tecnología',
      'description': 'El mundo de la tecnología uniendo a creadores de contenido y marcas.',
      'image': 'assets/tecnologia.jpg'
    },
    {
      'title': 'Gastronomía',
      'description': 'El mundo de la cocina se da cita en este apartado.',
      'image': 'assets/gastronomia.jpg'
    },
    {
      'title': 'Música',
      'description': 'Espacio dedicado a todos los artistas de la industria de la música.',
      'image': 'assets/musica.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/influagency_logo.png', height: 40), // Agrega el logo en la carpeta assets
        backgroundColor: Color(0xFF9333F3),
      ),
      body: Container(
        color: Color(0xFF9333F3),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    categories[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(categories[index]['title']!,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    subtitle: Text(categories[index]['description']!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFC929),
                      ),
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      child: Text('Buscar'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}