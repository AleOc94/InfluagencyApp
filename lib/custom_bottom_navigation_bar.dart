import 'package:flutter/material.dart';
import 'package:influmeet/buscar.dart';
import 'package:influmeet/demo_swip.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  CustomBottomNavigationBar({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/images/logo.png'),
          ),
          label: 'Guardado',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 255, 214, 90),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DemoSwipe()),
            );
            break;
          case 1:
            // Acción al pulsar "Guardado"
            // Aquí puedes añadir la navegación a la pantalla correspondiente
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuscarScreen()), // Cambiar a DemoSwip
            );
            break;
        }
      },
    );
  }
}