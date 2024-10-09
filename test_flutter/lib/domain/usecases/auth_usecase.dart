import 'package:test_flutter/domain/repositories/auth_repository.dart';

class AuthenticationUseCase {
  final AuthRepository authenticationRepository;

  AuthenticationUseCase({required this.authenticationRepository});

  Future<String> loginUser(String email, String password) async {
    return await authenticationRepository.loginUser(email, password);
  }

  Future<String> registerUser(String email, String password) async {
    return await authenticationRepository.registerUser(email, password);
  }
}
