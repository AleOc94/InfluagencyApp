import 'package:flutter/material.dart';
import 'demo_swip.dart';
import 'swipeoInfluencers.dart';
import 'base_datos.dart'; // Importa la clase BaseDatos donde se define guardarDatosUsuario
import 'package:influmeet/demo_swip.dart';
import 'package:influmeet/swipeoInfluencers.dart';

enum TipoUsuario {
  influencer,
  marca,
}
// Define la clase ManualDeUsoScreen como un StatelessWidget
class ManualDeUsoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual de Uso'),
      ),
      body: Center(
        child: Text('Contenido del Manual de Uso'),
      ),
    );
  }
}

class IfluencerMarca extends StatelessWidget {
  const IfluencerMarca({Key? key, required this.correoUsuario}) : super(key: key);

  final String correoUsuario;

  @override
  Widget build(BuildContext context) {
    TipoUsuario tipoUsuarioSeleccionado = TipoUsuario.influencer; // Inicializa el tipo de usuario seleccionado como influencer

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Fondo morado
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '¿ERES MARCA O\nERES INFLUENCER?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tipoUsuarioSeleccionado = TipoUsuario.marca; // Selecciona el tipo de usuario como marca
                        _guardarDatosUsuario(context, tipoUsuarioSeleccionado, correoUsuario);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DemoSwipe()),
                          MaterialPageRoute(builder: (context) => SwipeoInfluencers()), // Navega a la nueva pantalla
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '   Marca   ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 25, 240), // Texto morado
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        tipoUsuarioSeleccionado = TipoUsuario.influencer; // Selecciona el tipo de usuario como influencer
                        _guardarDatosUsuario(context, tipoUsuarioSeleccionado, correoUsuario);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SwipeoInfluencers()),
                        );
                          MaterialPageRoute(builder: (context) => DemoSwipe()), // Navega a la nueva pantalla
                         );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Influencer',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 25, 240), // Texto morado
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

 void _guardarDatosUsuario(BuildContext context, TipoUsuario tipoUsuario, String correoUsuario) {
    // Determina la colección según el tipo de usuario
    String nombreColeccion = tipoUsuario == TipoUsuario.marca ? 'marcas' : 'influencers';

    // Crea un mapa con los datos del usuario
    Map<String, dynamic> userData = {
      'nombre': correoUsuario,
      'correo': correoUsuario,
      // Otros campos necesarios
    };

    // Llama al método para guardar los datos en Firestore
    BaseDatos().guardarDatosUsuario(correoUsuario, correoUsuario, nombreColeccion);
  }
}
}
