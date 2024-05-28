import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flip_card/flip_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoSwipe(),
    );
  }
}

class DemoSwipe extends StatefulWidget {
  @override
  _DemoSwipeState createState() => _DemoSwipeState();
}

class _DemoSwipeState extends State<DemoSwipe> {
  List<String> images = [
    'assets/images/jp.png',
    'assets/images/hg.png',
    'assets/images/EM.jpeg',
  ];

  List<String> descriptions = [
    'Descripción de JP',
    'Descripción de HG',
    'Descripción de EM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Example'),
        backgroundColor: Color.fromARGB(255, 255, 214, 90),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()), // Navega a la nueva pantalla
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 133, 25, 240), // Fondo morado
        child: Stack(
          children: <Widget>[
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return FlipCard(
                  direction: FlipDirection.HORIZONTAL, // Dirección de voltear
                  front: Card(
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                  back: Card(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          descriptions[index],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: images.length,
              itemWidth: MediaQuery.of(context).size.width * 0.9,
              itemHeight: MediaQuery.of(context).size.height * 0.6,
              layout: SwiperLayout.STACK,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/like_icon.png', // Usa la imagen personalizada
                  width: 75.0,
                  height: 75.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/arrow_back.png', // Usa la imagen personalizada
                  color: Colors.white,
                  width: 75.0,
                  height: 75.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/dislike_icon.png', // Usa la imagen personalizada
                  width: 75.0,
                  height: 75.0,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 255, 214, 90),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
