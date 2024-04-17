import 'dart:convert';

import 'package:app_quiz/core/data/repositories/external_api_repository.dart';
import 'package:http/http.dart' as http;

class ExternalApi extends ExternalApiRepository{

  ExternalApi();

  @override 
  Future<Map<String?, dynamic>> getExecute(String token, String url) async {
   try {
          final response = await http.get(Uri.parse(url), headers: {
              "token": token
            });
          if (response.statusCode == 200) {
            return {'result': response.body};
            // return jsonDecode(response.body) as Map<String?, dynamic>;
          } else {
            return {'error': response.body};
          }
        } catch (e) {
            throw Exception('Failed to request from: $url');
        }
  }

  @override
  Future<Map<String?, dynamic>> postExecute(String token
                                  , String url
                                  , Map<String?, dynamic> bodyObject) async {
    try {
          final response = await http.post(Uri.parse(url)
                                    , headers: {"token": token}
                                    , body: jsonEncode(bodyObject)
          );

          if ( response.statusCode == 200 || response.statusCode == 201 ) {
            return {'result': response.body};

          } else {
            return {'error': response.body};

          }
        } catch (e) {
            throw Exception('Failed to post the data on: $url');
    }
  }
}