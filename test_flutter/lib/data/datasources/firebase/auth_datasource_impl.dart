import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter/data/datasources/firebase/auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<String> loginUser(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final emailUser = userCredential.user?.email ?? '';
      return emailUser;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No se encontró un usuario con ese correo electrónico.';
        case 'wrong-password':
          return 'La contraseña proporcionada es incorrecta.';
        default:
          return 'Ocurrió un error. Por favor, inténtalo de nuevo.';
      }
    } catch (e) {
      return 'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';
    }
  }

  @override
  Future<String> registerUser(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final emailUser = userCredential.user?.email ?? '';
      return emailUser;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'La dirección de correo electrónico ya está en uso por otra cuenta.';
        case 'weak-password':
          return 'La contraseña proporcionada es demasiado débil.';
        default:
          return 'Ocurrió un error. Por favor, inténtalo de nuevo.';
      }
    } catch (e) {
      return 'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';
    }
  }
}
