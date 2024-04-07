import 'package:app_quiz/features/home/presentation/pages/home.dart';
import 'package:app_quiz/features/login/data/usecases/authentication.dart';
import 'package:app_quiz/features/login/domain/usecases/login_uc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';

class Login extends StatelessWidget {
  static const routeName = "/login";
  const Login({Key? key}) : super(key: key);

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      body: showMessage(),
    ));
  }
}


// In charge of show the error message on  screen
// by Tiago Cardoso at 07/04/2024
class showMessage extends StatelessWidget {
  const showMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
         onPressed: () { 
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarCustom(context, 'Authenticate Failed!')
          );
          },
          child: const Text('Login'),
        )
      ),
    );
  }
}

SnackBar snackBarCustom(context, String message) {
  return SnackBar(
    content: Text(message, style: const TextStyle(fontSize: 20), 
      textAlign: TextAlign.center,),
    backgroundColor: Colors.redAccent,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 200,
      left: 10,
      right: 10,
    ),
  );
}

void _login(BuildContext context) {
  final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
  Authentication authenticationRepository = Authentication();
  LoginUseCase login = LoginUseCase(authenticationRepository);

  login.execute("cce99011-cfee-4759-b5e4-e6d085753f71").then((token) {
    if (token.isNotEmpty && token.containsKey('token')) {
      // Update the token to provider session
      tokenProvider.setToken(token['token']);

      // Call the home screen
      Navigator.pushNamed(context, Home.routeName);
    } else if (token.isNotEmpty && token.containsKey('error')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(token['error'].toString())),
      );
    }
    // ignore: body_might_complete_normally_catch_error
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  });
}
