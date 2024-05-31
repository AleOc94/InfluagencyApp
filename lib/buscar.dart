import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color purpleColor = Color(0xFF9333F3);
  final Color yellowColor = Color(0xFFFFC929);

  final List<Map<String, String>> sections = [
    {
      "title": "Tecnología",
      "description":
          "Empresas e influencers que se dediquen al mundo de la tecnología. Aquí hay sitio para todos los sectores, ya sean informáticos, ingenieros, IA y muchos más!",
    },
    {
      "title": "Deportes",
      "description":
          "A todos los amantes del deporte, ya seas marca o influencer, este es vuestro espacio. Aquí tenéis la oportunidad de buscar patrocinios y colaboraciones con quién os interese, ¡vamos a ello!",
    },
    {
      "title": "Gastronomía",
      "description":
          "La cultura de la gastronomía está presente en las redes y en las empresas. ¡Miles de empresas y creadores de contenido os están esperando para dar sabor al mundo!",
    },
    {
      "title": "Belleza",
      "description":
          "Para todas las empresas e influencers que dediquen su tiempo al mundo de la belleza, ¡estáis más cerca que nunca!",
    },
    {
      "title": "Humor",
      "description":
          "La risa mueve el mundo. Este espacio es más necesario que nunca, a todos aquellos creadores que nos alegráis los días, ¡seguid haciéndolo!",
    },
    {
      "title": "Música",
      "description":
          "La música es eterna en todos sus sentidos. Evoluciona y se adapta a los nuevos formatos. A todos los músicos que estéis empezando, ¡este espacio es dedicado a vosotros! ¡dadle más visibilidad a vuestra música!",
    },
    {
      "title": "Entretenimiento",
      "description":
          "Para todos aquellos que nos entretenéis a diario con vuestros videos, publicaciones, reels y demás, ¡aquí tenéis vuestro sitio!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
        title: Text('InflugAgency'),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return SectionCard(
            title: sections[index]["title"]!,
            description: sections[index]["description"]!,
            backgroundColor: purpleColor,
            buttonColor: yellowColor,
          );
        },
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final Color buttonColor;

  const SectionCard({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image.png', // Reemplaza con la ruta de tu imagen
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: backgroundColor.withOpacity(0.7),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
 backgroundColor: const Color.fromARGB(255, 133, 25, 240),                  ),
                  child: Text('Buscar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}