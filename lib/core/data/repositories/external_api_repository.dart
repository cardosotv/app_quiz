

abstract class ExternalApiRepository {
  Future<Map<String?, dynamic>> execute(String token, String url);
}