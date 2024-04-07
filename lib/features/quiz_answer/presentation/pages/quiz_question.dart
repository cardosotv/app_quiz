// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/presentation/widgets/question_screen.dart';
import 'package:app_quiz/features/quiz_answer/presentation/widgets/question_timer.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/presentation/pages/home.dart';
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
                  questionCubit.close(),
                  Navigator.pushNamed(context, Home.routeName),
                },
                child: const Text(
                  "quit",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              BlocBuilder<QuestionCubit, QuestionState>(
                builder: (context, state) {
                  questionCubit = context.read<QuestionCubit>();
                  return Text(
                    "${questionCubit.listAnswers.length + 1}/10",
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(color: Colors.blue),
                  );
                },
              ),
              const Text(" "),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: QuestionOptions(),
            ),
            Positioned(
                top: 15,
                right: (MediaQuery.of(context).size.width / 2) - 40,
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  //padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: const Color.fromARGB(255, 219, 240, 250),
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                child: BlocBuilder<QuestionCubit, QuestionState>(
                  builder: (context, state) {
                    return Text(
                              state.timer.toString().length == 2 ?  
                              state.timer.toString().substring(0,1) :
                              '0',
                              style: TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.bold,
                                color: state.timerColor,
                                ),
                              );
                    },
                  ),
                ),
              ),
            ],
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
