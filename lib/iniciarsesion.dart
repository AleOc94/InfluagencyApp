import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'demo_swip.dart';
import 'swipeoInfluencers.dart';

class IniciarSesionScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  IniciarSesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240), // Fondo morado
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'INICIAR SESIÓN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                labelText: 'Introducir correo',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'ejemplo@correo.com',
                hintStyle: const TextStyle(color: Colors.white60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                labelText: 'Introducir contraseña',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: '********',
                hintStyle: const TextStyle(color: Colors.white60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                    _iniciarSesion(context, _emailController.text, _passwordController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingresa el correo y la contraseña')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 214, 90), // Fondo amarillo
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 133, 25, 240), // Texto morado
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _iniciarSesion(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        if (user.emailVerified) {
          // Intentar obtener el tipo de usuario de ambas colecciones
          DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('marcas').doc(user.uid).get();
          
          if (!snapshot.exists) {
            snapshot = await FirebaseFirestore.instance.collection('influencers').doc(user.uid).get();
          }

          if (snapshot.exists) {
            String tipoUsuario = snapshot.data()!['tipoUsuario'];
            if (tipoUsuario == 'marca') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DemoSwipe()),
              );
            } else if (tipoUsuario == 'influencer') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SwipeoInfluencers()),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error: No se encontró el tipo de usuario')),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor, verifica tu correo electrónico')),
          );
        }
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión: ${error.toString()}')),
      );
    }
  }
}
