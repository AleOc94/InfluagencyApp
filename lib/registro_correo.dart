import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_datos.dart';
import 'bienvenida.dart';
import 'iniciarsesion.dart';
import 'package:flutter/gestures.dart';

// Define el enum TipoUsuario
enum TipoUsuario {
  marca,
  influencer,
}

class RegistroCorreoScreen extends StatefulWidget {
  RegistroCorreoScreen({Key? key}) : super(key: key);

  @override
  _RegistroCorreoScreenState createState() => _RegistroCorreoScreenState();
}

class _RegistroCorreoScreenState extends State<RegistroCorreoScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TipoUsuario _tipoUsuarioSeleccionado = TipoUsuario.influencer;
  bool _emailVerified = false;

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
            CheckboxListTile(
              title: const Text(
                '¿Eres Influencer?',
                style: TextStyle(color: Colors.white),
              ),
              value: _tipoUsuarioSeleccionado == TipoUsuario.influencer,
              onChanged: (bool? value) {
                setState(() {
                  _tipoUsuarioSeleccionado = value! ? TipoUsuario.influencer : TipoUsuario.marca;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.yellow,
              checkColor: Colors.white,
            ),
            CheckboxListTile(
              title: const Text(
                '¿Eres Marca?',
                style: TextStyle(color: Colors.white),
              ),
              value: _tipoUsuarioSeleccionado == TipoUsuario.marca,
              onChanged: (bool? value) {
                setState(() {
                  _tipoUsuarioSeleccionado = value! ? TipoUsuario.marca : TipoUsuario.influencer;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.yellow,
              checkColor: Colors.white,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {
                    _crearUsuarioConCorreo(context, _emailController.text, _passwordController.text, _tipoUsuarioSeleccionado);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingresa un correo válido')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 214, 90),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Continuar', style: TextStyle(color: Color.fromARGB(255, 133, 25, 240), fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: '¿Ya tienes cuenta? ',
                style: TextStyle(color: Color.fromARGB(255, 133, 25, 240), fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Iniciar sesión',
                    style: TextStyle(color: Color.fromARGB(255, 133, 25, 240), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
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

  void _crearUsuarioConCorreo(BuildContext context, String email, String password, TipoUsuario tipoUsuario) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      // Envía un correo electrónico de verificación
      userCredential.user?.sendEmailVerification().then((_) {
        setState(() {
          _emailVerified = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Se ha enviado un correo de verificación')),
        );
        // Guarda los datos del usuario en la colección correspondiente de Firestore
        _guardarDatosUsuario(userCredential.user?.uid, email, password, tipoUsuario);
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar el correo de verificación: ${error.toString()}')),
        );
      });
    }).catchError((error) {
      if (error is FirebaseAuthException && error.code == 'email-already-in-use') {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((userCredential) {
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

  void _guardarDatosUsuario(String? uid, String email, String password, TipoUsuario tipoUsuario) {
    if (uid != null) {
      String collectionName = tipoUsuario == TipoUsuario.marca ? 'marcas' : 'influencers';
      FirebaseFirestore.instance.collection(collectionName).doc(uid).set({
        'email': email,
        'password': password, // Considera no guardar contraseñas en texto plano
        'tipoUsuario': tipoUsuario.toString().split('.').last,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos del usuario guardados correctamente')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar los datos del usuario: ${error.toString()}')),
        );
      });
    }
  }
}
