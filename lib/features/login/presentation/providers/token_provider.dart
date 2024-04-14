import 'package:app_quiz/features/user/domain/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/core/domain/use_cases/jwt.dart';

class TokenProvider extends ChangeNotifier{

    String? _token;
    String? _userID;
    User? _userLogged;

    String? get token => _token;
    String? get userID => _userID;
    User? get userLogged => _userLogged;

    void setToken(String? token) {
      _token = token;
      _userID = parseJWT(token.toString());
      notifyListeners();
    }

    void setUserID(String? userID){
      _userID = userID;
      notifyListeners();
    }

    void setUserLogged(User? user){
      _userLogged = user;
      notifyListeners();
    }

}
