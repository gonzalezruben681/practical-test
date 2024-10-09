abstract interface class AuthDatasource {
  Future<String> loginUser(String email, String password);
  Future<String> registerUser(String email, String password);
}
