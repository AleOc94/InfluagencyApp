import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:influmeet/bienvenida.dart';
import 'package:influmeet/iniciarsesion.dart'; // Importa la pantalla de iniciar sesión
import 'package:flutter/gestures.dart'; // Importa gestos

class RegistroCorreoScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistroCorreoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 25, 240),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REGÍSTRATE',
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
                  if (_emailController.text.isNotEmpty) {
                    _crearUsuarioConCorreo(context, _emailController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingresa un correo válido')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 214, 90),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 133, 25, 240),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: '¿Ya tienes cuenta? ',
                style: const TextStyle(color: Colors.white, fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Iniciar sesión',
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IniciarSesionScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _crearUsuarioConCorreo(BuildContext context, String email) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: _passwordController.text, // Utiliza la contraseña del campo de texto
    )
        .then((userCredential) {
      userCredential.user?.sendEmailVerification().then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Se ha enviado un correo de verificación')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar el correo de verificación: ${error.toString()}')),
        );
      });
    }).catchError((error) {
      if (error is FirebaseAuthException && error.code == 'email-already-in-use') {
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: _passwordController.text, // Utiliza la contraseña del campo de texto
        ).then((userCredential) {
          if (userCredential.user!.emailVerified) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BienvenidaScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Por favor, verifica tu correo electrónico')),
            );
          }
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al iniciar sesión: ${error.toString()}')),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar usuario: ${error.toString()}')),
        );
      }
    });
  }
}