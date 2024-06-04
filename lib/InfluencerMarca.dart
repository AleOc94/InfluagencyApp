import 'package:flutter/material.dart';
import 'demo_swip.dart';
import 'swipeoInfluencers.dart';
import 'base_datos.dart';

enum TipoUsuario {
  influencer,
  marca,
}

class IfluencerMarca extends StatelessWidget {
  const IfluencerMarca({Key? key, required this.correoUsuario}) : super(key: key);

  final String correoUsuario;

  @override
  Widget build(BuildContext context) {
    TipoUsuario tipoUsuarioSeleccionado = TipoUsuario.influencer;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
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
                        tipoUsuarioSeleccionado = TipoUsuario.marca;
                        _guardarDatosUsuario(context, tipoUsuarioSeleccionado, correoUsuario);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DemoSwipe()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 214, 90),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '   Marca   ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 25, 240),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        tipoUsuarioSeleccionado = TipoUsuario.influencer;
                        _guardarDatosUsuario(context, tipoUsuarioSeleccionado, correoUsuario);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SwipeoInfluencers()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 214, 90),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Influencer',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 25, 240),
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
    String nombreColeccion = tipoUsuario == TipoUsuario.marca ? 'marcas' : 'influencers';
    Map<String, dynamic> userData = {
      'nombre': correoUsuario,
      'correo': correoUsuario,
      // Otros campos
    };
    BaseDatos().guardarDatosUsuario(correoUsuario, correoUsuario, tipoUsuario.toString(), userData);
  }
}
