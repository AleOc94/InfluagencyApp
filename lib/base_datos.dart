import 'package:cloud_firestore/cloud_firestore.dart';

class BaseDatos {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> guardarDatosUsuario(String nombreUsuario, String correoUsuario, String tipoUsuario) async {
    try {
      final Map<String, dynamic> userData = {
        'nombre': nombreUsuario,
        'correo': correoUsuario,
        // Otros campos según sea necesario
      };

      final String nombreColeccion = tipoUsuario == 'marca' ? 'marcas' : 'influencers';

      await _firestore.collection(nombreColeccion).doc(nombreUsuario).set(userData);
      print('Datos de usuario guardados en Firestore');
    } catch (e) {
      print('Error al guardar datos de usuario en Firestore: $e');
    }
  }

  Future<Map<String, dynamic>?> obtenerDatosUsuario(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDataSnapshot =
          await _firestore.collection('usuarios').doc(userId).get();
      return userDataSnapshot.data();
    } catch (e) {
      print('Error al obtener datos de usuario desde Firestore: $e');
      return null; // Retorna null en caso de error
    }
  }

  Future<void> guardarAccionSwipe(String userId, String influencerId, String accion) async {
    try {
      await _firestore.collection('acciones_swipe').doc(userId).collection('acciones').doc(influencerId).set({
        'accion': accion,
        // Otros campos necesarios
      });
      print('Acción de swipe guardada en Firestore');
    } catch (e) {
      print('Error al guardar acción de swipe en Firestore: $e');
    }
  }

  // Otros métodos para actualizar datos de usuario, obtener acciones de swipe, etc.
}