import 'package:test_flutter/data/datasources/firebase/auth_datasource.dart';
import 'package:test_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({required this.authDatasource});

  @override
  Future<String> loginUser(String email, String password) async {
    try {
      return await authDatasource.loginUser(email, password);
    } catch (e) {
      return 'Error al iniciar sesión: ${e.toString()}';
    }
  }

  @override
  Future<String> registerUser(String email, String password) async {
    try {
      return await authDatasource.registerUser(email, password);
    } catch (e) {
      return 'Error al registrar usuario: ${e.toString()}';
    }
  }
}