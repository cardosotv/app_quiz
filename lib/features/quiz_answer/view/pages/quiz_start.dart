import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/question.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/quiz.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_answer.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'dart:math';

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
    final parameters = ModalRoute.of(context)!.settings.arguments as Quiz;
    var indexRandomQuestion = Random().nextInt(9) + 1;
    Question question = Question().getId(indexRandomQuestion);

    //List<Quiz> quizlist  = Quiz.fromJson(json.decode("../repositories/quiz.json"));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Container(
          height: 500,
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Welcome to Tela ${parameters.name}"),
              Text("About: ${question.question}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("<< Back"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => answer["answer"] = " ");
                      Navigator.pushNamed(context, QuestionOptions.routeName,
                          arguments: Question().getId(indexListQuestion[
                              Random().nextInt(indexListQuestion.length)]));
                    },
                    child: const Text("<<Start>>"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
