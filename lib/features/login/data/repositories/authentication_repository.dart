// data/repositories/authentication_repository.dart

abstract class AuthenticationRepository {
  Future<Map<String?, dynamic>> authenticate(String user);
}

