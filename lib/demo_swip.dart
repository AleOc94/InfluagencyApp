import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tcard/tcard.dart';
import 'package:flip_card/flip_card.dart';
import 'brand_profile.dart'; // Importa la pantalla de perfil
import 'main.dart'; 
import 'buscar.dart'; // Importa la pantalla de buscar

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Color.fromARGB(255, 255, 214, 90),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DemoSwipe()),
            );
          },
          child: Text('Go to DemoSwipe'),
        ),
      ),
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

  List<Widget> cards = [];
  TCardController _controller = TCardController();
  bool noMoreCards = false;
  bool canGoBack = false; // Para controlar si se puede volver a la tarjeta anterior
  int currentIndex = 0; // Índice de la tarjeta actual
  int _selectedIndex = 0; // Para el índice seleccionado del BottomNavigationBar

  @override
  void initState() {
    super.initState();
    cards = List.generate(
      images.length,
      (index) => FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          children: [
            Card(
              margin: EdgeInsets.all(0), // Eliminar margen para el borde blanco
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/information_icon.png'),
              ),
            ),
          ],
        ),
        back: Stack(
          children: [
            Card(
              margin: EdgeInsets.all(0), // Eliminar margen para el borde blanco
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
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
            Positioned(
              top: 10,
              right: 10,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/information_icon.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleSwipe(bool isLiked) {
    if (isLiked) {
      Fluttertoast.showToast(
        msg: "Estás interesado en este Influencer.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "No estás interesado en este Influencer.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setState(() {
      canGoBack = true; // Permitir volver a la tarjeta actual
      currentIndex++;
      if (currentIndex >= cards.length) {
        noMoreCards = true;
      }
    });
  }

  void handleGoBack() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        canGoBack = false; // No permitir volver a la tarjeta actual nuevamente
      });
      _controller.back();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuscarScreen()), // Navega a la pantalla de buscar
        );
        break;
      case 2:
        // Acciones para el tercer ítem
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 20.0; // Espacio uniforme entre los elementos

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
                MaterialPageRoute(builder: (context) => SettingsPage()), // Navega a la pantalla de configuración
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 133, 25, 240), // Fondo morado
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: spacing), // Espacio debajo del AppBar
            noMoreCards
                ? Center(
                    child: Text(
                      "Por el momento no hay más influencers.",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: TCard(
                          controller: _controller,
                          size: Size(MediaQuery.of(context).size.width * 0.85,
                              MediaQuery.of(context).size.height * 0.55), // Reducir tamaño de la tarjeta
                          cards: cards,
                          onForward: (index, info) {
                            if (info.direction == SwipDirection.Right) {
                              handleSwipe(true);
                            } else if (info.direction == SwipDirection.Left) {
                              handleSwipe(false);
                            }
                          },
                          onEnd: () {
                            setState(() {
                              noMoreCards = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: spacing), // Espacio entre la tarjeta y los iconos
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/dislike_icon.png'),
                              ),
                              onPressed: () {
                                handleSwipe(false);
                                _controller.forward();
                              },
                            ),
                            IconButton(
                              icon: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/arrow_back.png'),
                              ),
                              onPressed: canGoBack
                                  ? () {
                                      handleGoBack();
                                    }
                                  : null,
                            ),
                            IconButton(
                              icon: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/like_icon.png'),
                              ),
                              onPressed: () {
                                handleSwipe(true);
                                _controller.forward();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 255, 214, 90),
        onTap: _onItemTapped,
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  void _logout(BuildContext context) {
    // Aquí puedes agregar la lógica de cierre de sesión
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 255, 214, 90),
      ),
      body: Container(
        color: Color.fromARGB(255, 133, 25, 240), // Fondo morado
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Perfil', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BrandProfile()), // Navega a la pantalla de perfil
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white),
              title: Text('Cuenta', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Acción para "Cuenta"
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
              onTap: () {
                _logout(context); // Llama a la función de cierre de sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
