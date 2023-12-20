import 'package:app_quiz/features/quiz_answer/view/pages/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_result.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_start.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';


void main() {
  runApp(const MyApp());
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
        initialRoute: Home.routeName,
        routes: {
          Home.routeName: (context) => const Home(),
          QuizMainQuestion.routeName: (context) => const QuizMainQuestion(),
          QuestionResult.routeName: (context) => const QuestionResult(),
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
