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
    var parameters = ModalRoute.of(context)!.settings.arguments as List<Answer>;

    int hits = parameters.where((filter) => filter.correct == true).length;

    double quizScore = _calculateQuizScore(parameters);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tema do Quiz', textDirection: TextDirection.ltr,),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Result: ${hits.toString()}/${parameters.length}'),
            Text('Score: $quizScore'),
            ElevatedButton(
              onPressed: () { 
                  print (loggedUser.score);
                  loggedUser.score = loggedUser.score +  quizScore.toInt();
                  print(loggedUser.score);
                  Navigator.pushNamed(context, Home.routeName);
                  }, 
              child: const Text("<< Home"),
            )
          ],
        ),
      ) ,
    );
  }

double _calculateQuizScore(List<Answer> _answers){

  double _score = 0.0;

  for (Answer _answer in _answers) {
    _score = _score + _answer.score;
  }

  return _score;

}

}