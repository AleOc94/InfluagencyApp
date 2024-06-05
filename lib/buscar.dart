import 'package:flutter/material.dart';

class BuscarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuscarScreen(),
    );
  }
}

class BuscarScreen extends StatelessWidget {
  final Color purpleColor = Color(0xFF9333F3);
  final Color yellowColor = Color(0xFFFFC929);

  final List<Map<String, String>> sections = [
    {
      "title": "Tecnología",
      "description":
          "Empresas e influencers que se dediquen al mundo de la tecnología. Aquí hay sitio para todos los sectores, ya sean informáticos, ingenieros, IA y muchos más!",
      "image": "assets/images/tecnologia.jpg",
    },
    {
      "title": "Deportes",
      "description":
          "A todos los amantes del deporte, ya seas marca o influencer, este es vuestro espacio. Aquí tenéis la oportunidad de buscar patrocinios y colaboraciones con quién os interese, ¡vamos a ello!",
      "image": "assets/images/deportes.jpg",
    },
    {
      "title": "Gastronomía",
      "description":
          "La cultura de la gastronomía está presente en las redes y en las empresas. ¡Miles de empresas y creadores de contenido os están esperando para dar sabor al mundo!",
      "image": "assets/images/gastronomia.jpg",
    },
    {
      "title": "Belleza",
      "description":
          "Para todas las empresas e influencers que dediquen su tiempo al mundo de la belleza, ¡estáis más cerca que nunca!",
      "image": "assets/images/belleza.jpg",
    },
    {
      "title": "Humor",
      "description":
          "La risa mueve el mundo. Este espacio es más necesario que nunca, a todos aquellos creadores que nos alegráis los días, ¡seguid haciéndolo!",
      "image": "assets/images/humor.jpg",
    },
    {
      "title": "Música",
      "description":
          "La música es eterna en todos sus sentidos. Evoluciona y se adapta a los nuevos formatos. A todos los músicos que estéis empezando, ¡este espacio es dedicado a vosotros! ¡dadle más visibilidad a vuestra música!",
      "image": "assets/images/musica.jpg",
    },
    {
      "title": "Entretenimiento",
      "description":
          "Para todos aquellos que nos entretenéis a diario con vuestros videos, publicaciones, reels y demás, ¡aquí tenéis vuestro sitio!",
      "image": "assets/images/entretenimiento.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor, // Cambia el color de fondo del Scaffold
      appBar: AppBar(
        backgroundColor: yellowColor, // Cambia el color del AppBar
        title: Text('Buscar'),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return SectionCard(
            title: sections[index]["title"]!,
            description: sections[index]["description"]!,
            imagePath: sections[index]["image"]!,
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
  final String imagePath;
  final Color backgroundColor;
  final Color buttonColor;

  const SectionCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: backgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: backgroundColor.withOpacity(0.7), // Ajusta la opacidad para hacer el fondo más claro
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                      child: Text('Buscar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}