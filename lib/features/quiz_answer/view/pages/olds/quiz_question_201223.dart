// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/view/widgets/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_result.dart';
import 'package:app_quiz/features/quiz_answer/view/widgets/question.dart';
import 'dart:math';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/answer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionSelected extends StatefulWidget {
  static const routeName = '/question';

  const QuestionSelected({super.key});

  @override
  State<QuestionSelected> createState() => _QuestionSelected();
}

class _QuestionSelected extends State<QuestionSelected> {
  int timerCounter = 0;
  double score = 0.0;
  int indexQuestion = 0;
  //bool firstQuestion = true;
  List<Question> listQuestion = [];
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  //Question question = Question();
  Timer? oclock;

  @override
  Widget build(BuildContext context) {
    //var parameters = ModalRoute.of(context)!.settings.arguments as Question;
    double maxWidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;

    // Initializate the var Question
    //QuestionCubit().getNextQuestion();
    //question = QuestionCubit().question;

    // question = state.question;

    // if (indexQuestion != question.id) {
    //   indexQuestion = question.id!;
    //   question.options!.isEmpty ? options = options : options = question.options!;
    //oclock = _timerQuestion(timerMax: 10);
    // print("id ${question.id}");
    // print(indexQuestion);
    // print(indexListQuestion);
    // print(_optionSelect);
    // print('List length ${indexListQuestion.length}');
    // print('Answers: $listAnswers');
    // }
    return MaterialApp(
      home: BlocProvider(
        create: (context) => QuestionCubit(),
        child: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, Home.routeName),
                          },
                          child: const Text("quit"),
                        ),
                        Text(
                          "Question ${listAnswers.length + 1}/10",
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                  ),
                  body: QuestionOptions(),
                ),
      ),
    );
  }
}

class ScreenStateControl extends StatelessWidget {
  const ScreenStateControl({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        Widget resultScreen = const Text('Starting the widget!');

        if (state is QuestionLoading) {
          resultScreen = const Center(
            child: Text('Question Empty!'),
          );
        } else if (state is QuestionLoading) {
          resultScreen = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuestionLoaded) {
        } else {}

        return resultScreen;
      },
    );
  }
}
