import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/answer_entity.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';

class QuestionResult extends StatefulWidget {
  static const routeName = '/questionResult';
  const QuestionResult({super.key});

  @override
  State<QuestionResult> createState() => _QuestionResultState();
}

class _QuestionResultState extends State<QuestionResult> {
  @override
  Widget build(BuildContext context) {
    var parameters = ModalRoute.of(context)!.settings.arguments as QuestionCubit;
    //int hits = parameters.where((filter) => filter.correct == true).length;
    //double quizScore = _calculateQuizScore(parameters);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tema do Quiz', textDirection: TextDirection.ltr,),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Text('Result: ${hits.toString()}/${parameters.length}'),
            Text('Result: ${parameters.resultMatch['hits'].toString()}/10'),
            Text('Score: ${parameters.resultMatch['score'].toString()}'),
            const Text("🥳🎉",
              style: TextStyle(fontSize: 80),),
            ElevatedButton(
              onPressed: () { 
                  Navigator.pushNamed(context, Home.routeName);
                  }, 
              child: const Text("<< Home"),
            )
          ],
        ),
      ) ,
    );
  }

}