import 'dart:convert';

import 'package:app_quiz/core/data/repositories/external_api.dart';
import 'package:app_quiz/features/user/domain/user_entity.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  Future<User> getUserByIDfromAPI(String id, String token) async {

    // Define the URL GET User Api
    const String url = "http://localhost:8080/api/v1/users/";
    
    // Define external api class
    ExternalApi externalApi = ExternalApi();

    // Define the object for result 
    User user = User();

    // Call the External Api Method
    var response;
    await externalApi
      .execute(token, url+id)
      .then((result) => response = result)
      .whenComplete(() {
        // Convert the result json to  user entity 
        Map<String, dynamic> userDecoded = jsonDecode(response['result']);
        user.fromJson(userDecoded);
      });

    // Return the user 
    return user;
  }

}