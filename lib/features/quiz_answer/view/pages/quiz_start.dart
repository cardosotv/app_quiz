import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/quiz.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class QuizMainQuestion extends StatefulWidget {
  static const routeName = '/quiz';

  const QuizMainQuestion({super.key});

  @override
  State<QuizMainQuestion> createState() => _QuizMainQuestionState();
}

class _QuizMainQuestionState extends State<QuizMainQuestion> {
  @override
  Widget build(BuildContext context) {
    // this code extract te arguments pass throught the call the new screen /quiz
    final parameters = ModalRoute.of(context)!.settings.arguments as Subject;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
           title: const Text(
            "Quiz",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Text(
                    parameters.subject,
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18.0),
                  //                width: 300,
                  height: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 241, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    parameters.about,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("<< Back"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context , QuestionSelected.routeName);
                        },
                        child: const Text("<<Start>>"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
