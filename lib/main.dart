import 'package:app_quiz/features/quiz_answer/presentation/pages/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/presentation/pages/quiz_result.dart';
import 'package:app_quiz/features/quiz_answer/presentation/pages/quiz_start.dart';
import 'package:app_quiz/features/home/presentation/pages/home.dart';
import 'package:app_quiz/features/login/presentation/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => TokenProvider(),
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Login.routeName,
        routes: {
          Login.routeName:(context) => const Login(),
          '/home': (context) => const Home(),
          // Home.routeName: (context) => const Home(),
          QuizMainQuestion.routeName: (context) => const QuizMainQuestion(),
          '/questionResult': (context) => const QuestionResult(),
          QuestionSelected.routeName: (context) => const QuestionSelected()
        },
      );
  }
}


// MaterialApp( 
//       initialRoute: Home.routeName,
//       routes: {
//         Home.routeName:(context) => const Home(),
//         QuizMainQuestion.routeName:(context) => const QuizMainQuestion(),
//         QuestionResult.routeName:(context) => const QuestionResult(),
//         QuestionSelected.routeName:(context) => const QuestionSelected()
//     },
//     );
