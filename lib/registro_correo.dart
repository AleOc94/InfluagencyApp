import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:influmeet/bienvenida.dart'; // Importa Firebase Auth

class RegistroCorreoScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  RegistroCorreoScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9333f3), // Fondo morado
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
                hintText: 'ejemplo@correo.com', // Aquí se añade el hint
                hintStyle: const TextStyle(color: Colors.white60), // Color del hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Verifica si el campo de correo electrónico no está vacío
                if (_emailController.text.isNotEmpty) {
                  // Llama a la función para crear un usuario con correo y contraseña
                  _crearUsuarioConCorreo(context, _emailController.text);
                } else {
                  // Muestra un mensaje de error si el correo está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingresa un correo válido')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFffc929), // Fondo amarillo
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(
                  color: Color(0xFF9333f3), // Texto morado
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para crear un usuario con correo y contraseña
  void _crearUsuarioConCorreo(BuildContext context, String email) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: 'password', // Aquí debes agregar una contraseña predeterminada
    )
        .then((userCredential) {
      // Envía un correo de verificación al usuario
      userCredential.user?.sendEmailVerification().then((_) {
        // Muestra un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Se ha enviado un correo de verificación')),
        );
      }).catchError((error) {
        // Muestra un mensaje de error si ocurre algún problema al enviar el correo de verificación
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar el correo de verificación: ${error.toString()}')),
        );
      });
    }).catchError((error) {
      // Verifica si el error se debe a que el usuario ya existe
      if (error is FirebaseAuthException && error.code == 'email-already-in-use') {
        // Recupera el usuario existente con el correo electrónico proporcionado
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: 'password', // Aquí debes agregar la contraseña que utilizaste para registrar usuarios
        ).then((userCredential) {
          // Verifica si el correo electrónico del usuario está verificado
          if (userCredential.user!.emailVerified) {
            // Navega a la pantalla de bienvenida si el usuario está registrado y su correo electrónico está verificado
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BienvenidaScreen()),
            );
          } else {
            // Muestra un mensaje si el correo electrónico del usuario no está verificado
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Por favor, verifica tu correo electrónico')),
            );
          }
        }).catchError((error) {
          // Muestra un mensaje de error si ocurre algún problema al iniciar sesión con el usuario existente
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al iniciar sesión: ${error.toString()}')),
          );
        });
      } else {
        // Muestra un mensaje de error si ocurre algún problema al crear el usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al crear el usuario: ${error.toString()}')),
        );
      }
    });
  }
}