import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Example'),
        backgroundColor: Colors.amber,
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
        color: Color(0xFF9333f3), // Fondo morado
        child: Stack(
          children: <Widget>[
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Image.asset(images[index], fit: BoxFit.cover),
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
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                  size: 50.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 50.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.thumb_down,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ],
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
        backgroundColor: Color(0xFFffc929),
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

