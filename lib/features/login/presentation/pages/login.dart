import 'dart:convert';

import 'package:app_quiz/features/home/presentation/pages/home.dart';
import 'package:app_quiz/features/login/data/usecases/authentication.dart';
import 'package:app_quiz/features/login/domain/usecases/login_uc.dart';
import 'package:app_quiz/features/user/domain/user_entity.dart';
import 'package:app_quiz/features/user/domain/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_quiz/core/domain/models/error.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static const routeName = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () { 
                _login(context);
              },
              child: const Text('Login'),
            )
        ),
    );
  }
}

void _login(BuildContext context) {
  final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
  Authentication authenticationRepository = Authentication();
  LoginUseCase loginUseCase = LoginUseCase(authenticationRepository);
  bool isLogged = false;
  UserUseCase userUseCase = UserUseCase();

  // loginUseCase.execute("cce99011-cfee-4759-b5e4-e6d085753f71").then((token) {
  loginUseCase.execute("cce99011-cfee-4759-b5e4-e6d085753f71").then((token) {
    if (token.isNotEmpty && token.containsKey('token')) {
      // Update the token to provider session
      tokenProvider.setToken(token['token']);
      isLogged = true;
      // Call the home screen 
      Navigator.pushNamed(context, '/home');
      // Navigator.pushNamed(context, Home.routeName);
    } else if (token.isNotEmpty && token.containsKey('error')) {
        // Map<String, dynamic> er = jsonDecode(token['error']);
        Error er = Error();
        er.fromJson(jsonDecode(token['error']));
        throw Exception('Authenticate Failed: ${er.message}');
    }
    // ignore: body_might_complete_normally_catch_error
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
            snackBarCustom(context, '$error')
      );
  }).whenComplete(() {
    if (isLogged == true) {
      User user = userUseCase
        .getUserByID(tokenProvider.userID.toString()
                    , tokenProvider.token.toString());
      print(user.name.toString());
    }
  });
}

SnackBar snackBarCustom(context, String message) {
  return SnackBar(
    content: Text(message, style: const TextStyle(fontSize: 20), 
      textAlign: TextAlign.center,),
    backgroundColor: Colors.redAccent,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 300,
      left: 10,
      right: 10,
    ),
  );
}