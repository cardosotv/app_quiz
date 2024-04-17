

import 'dart:convert';

import 'package:app_quiz/core/data/repositories/external_api.dart';

class GameRepository{

  // Define the URL to Post the new game
  final url = "http://localhost:8080/api/v1/games?idSubject=";
  final ExternalApi externalApi = ExternalApi();
  Map<String?, dynamic> game = {};

  Future<Map<String?, dynamic>> createNewGameRepository(String token, String subjectID) async{

    // Concat the subject in a url
    String urlNewGame = url + subjectID.toString();

    // Do the request for the new game
    Map<String?, dynamic> response = await externalApi.postExecute(token, urlNewGame, {});

    // Treat the resul if any error
    //response.then((value) {
      if (response.containsKey("error")) {
        throw Exception(response['error']);
      } else {
        // return the result if it was sucessed 
        game = jsonDecode(response['result']);
      }
    //}); 

    return game;
  }

}