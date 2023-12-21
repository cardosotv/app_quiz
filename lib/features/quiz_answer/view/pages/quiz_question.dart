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
  int indexQuestion = 0;
  Timer? oclock;
  var questionCubit = QuestionCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, Home.routeName),
                },
                child: const Text("quit", 
                                  style: TextStyle(color: Colors.blue),),
              ),
              BlocBuilder<QuestionCubit, QuestionState>(
                builder: (context, state) {
                  questionCubit = context.read<QuestionCubit>();
                  return Text(
                    "${questionCubit.listAnswers.length+1}/10",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(color: Colors.blue),
                  );
                },
              ),
              const Text(" "),
            ],
          ),
        ),
        body: Container(
                margin: const EdgeInsets.only(top: 50.0),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: QuestionOptions(),
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
