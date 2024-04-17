

abstract class ExternalApiRepository {
  Future<Map<String?, dynamic>> getExecute(String token, String url);

  Future<Map<String?, dynamic>> postExecute(String token
                                  , String url
                                  , Map<String?, dynamic> body);
}