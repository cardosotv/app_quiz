// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/view/widgets/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';
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
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  Timer? oclock;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
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
                  "Question 1/10",
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
          body: QuestionOptions(),
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