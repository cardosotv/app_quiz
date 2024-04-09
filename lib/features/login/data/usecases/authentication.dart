import 'dart:convert';

import 'package:app_quiz/features/login/data/repositories/authentication_repository.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';
import 'package:http/http.dart' as http;


class Authentication implements AuthenticationRepository{

@override
    Future<Map<String?, dynamic>> authenticate(String user) async{

        final String apiUrl = 'http://localhost:8080/api/auth';

        try {
          // final response = await http.get(Uri.parse(apiUrl, headers: headers));
          final response = await http.get(Uri.parse(apiUrl), headers: {
              "userId": user
            });

          if (response.statusCode == 200) {
            //Map<String?, dynamic> result = jsonDecode(response.body);
            return jsonDecode(response.body) as Map<String?, dynamic>;
          } else {
            return {'error': response.body};
            //throw Exception('Failed to authenticate user');
          }
        } catch (e) {
            throw Exception('Failed to authenticate user: $e');
        }
    }

}