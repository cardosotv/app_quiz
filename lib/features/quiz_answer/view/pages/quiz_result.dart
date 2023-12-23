import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';

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
    var maxWidth = MediaQuery.of(context).size.width;
    //int hits = parameters.where((filter) => filter.correct == true).length;
    //double quizScore = _calculateQuizScore(parameters);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text('Quiz IA', 
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),
                ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //height: 200,
              margin: const EdgeInsets.only(top:80),
              width: maxWidth,
              alignment: Alignment.center,
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(parameters.resultMatch['message'].toString(), 
                          style: const TextStyle(fontSize: 38, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ), 
                        Text(parameters.resultMatch['subMessage'].toString(), 
                          style: const TextStyle(fontSize: 14, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        ],             
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top:30),
              width: maxWidth,
              child: Text(parameters.resultMatch['emoji'].toString(),
                style: const TextStyle(fontSize: 150),),
            ),
            Container(
              height: 100,
              width: maxWidth,
              margin: const EdgeInsets.only(top:30),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('+ ${parameters.resultMatch['score'].toString()} pts',
                    style: const TextStyle(fontSize: 48,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("You've got ${parameters.resultMatch['hits'].toString()} from 10 questions.",
                    style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                   height: 50,
                    child: ElevatedButton(
                      onPressed: () { 
                          Navigator.pushNamed(context, Home.routeName);
                          }, 
                      child: const Text("Home"),
                    ),
                  ), 
                  SizedBox(
                    width: 150,
                   height: 50,
                    child: ElevatedButton(
                      onPressed: () { 
                          Navigator.pushNamed(context, Home.routeName);
                          }, 
                      child: const Text("Restart"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }

}