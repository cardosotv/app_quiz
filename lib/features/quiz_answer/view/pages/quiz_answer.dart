// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/question.dart';
import 'package:app_quiz/features/home/view/pages/home.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_result.dart';
import 'package:app_quiz/features/quiz_answer/view/widgets/question.dart';
import 'dart:math';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:app_quiz/features/quiz_answer/domain/models/answer.dart';

class QuestionOptions extends StatefulWidget {
  static const routeName = '/questionOption';

  const QuestionOptions({super.key});

  @override
  State<QuestionOptions> createState() => _QuestionOptions();

}

class _QuestionOptions extends State<QuestionOptions> {
  int timerCounter = 0;
  double score = 0.0;
  String? _optionSelect;
  int indexQuestion = 0;
  //bool firstQuestion = true;
  List<Question> listQuestion = [];
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  Question question = Question();
  Timer? oclock;

  @override
  Widget build(BuildContext context) {
    var parameters = ModalRoute.of(context)!.settings.arguments as Question;
    double maxWidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;


    question = parameters;

    if (indexQuestion != question.id) {
      oclock = _timerQuestion(timerMax: 10);
      indexQuestion = question.id;
      question.options.isEmpty ? options = options : options = question.options;
      indexListQuestion.remove(question.id);
      //oclock = _timerQuestion(timerMax: 10);
      print("id ${question.id}");
      print(indexQuestion);
      print(indexListQuestion);
      print(_optionSelect);
      print('List length ${indexListQuestion.length}');
      print('Answers: $listAnswers');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => {
                  oclock!.cancel(),
                  Navigator.pushNamed(context, Home.routeName),
                },
                child: const Text("< quit "),
              ),
              Text(
                "Question ${listAnswers.length+1}/10",
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
        body: Container(
          height: maxheight,
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                
                children: [
                  widgetTimeline(timerCounter),
                  widgetQuestion(question.question, myWidht: maxWidth-50, myHeight: 150),
                
                  Positioned(
                    top: 5,
                    right: 5,
                    child: 
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                           border: Border.all(width: 2, color: const Color.fromARGB(255, 219, 240, 250),),
                            shape: BoxShape.circle,
                            color: Colors.white,
                        ),
                        child: Text(
                                timerCounter.toString(),
                                style: const TextStyle(fontSize: 20, 
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                      ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                child: _widgetOptions(options)
                ),
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                child: ElevatedButton(
                  onPressed: _optionSelect == null
                      ? null
                      : () => {
                        oclock != null ? oclock!.cancel() :  _optionSelect = _optionSelect,  
                        _nextQuestion(),
                      },
                  child: const Text("Next Question"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetTickLine(int time, int tick) {
    Color colorTime, colorDefault = Color.fromARGB(172, 109, 109, 109);
    
    if (time > 4 ){
      colorTime = Color.fromARGB(188, 2, 214, 23);
    }
    else if (time > 2) {
      colorTime = Color.fromARGB(210, 232, 136, 2);
    }
    else {
      colorTime = Color.fromARGB(221, 246, 16, 16);
    }

    return Padding(padding: EdgeInsets.all(0.0),
            child:
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 10,
              width: MediaQuery.of(context).size.width/11 - 10,
              decoration: BoxDecoration(
                color: time > tick ? colorDefault :
                                    colorTime,
                ),
              child: const Text(' '),
              ),
          );
  }

  Widget widgetTimeline(int time) {
    
    return Container(
            width: MediaQuery.of(context).size.width-50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                widgetTickLine(time, 9),
                widgetTickLine(time, 8),
                widgetTickLine(time, 7),
                widgetTickLine(time, 6),
                widgetTickLine(time, 5),
                widgetTickLine(time, 4),
                widgetTickLine(time, 3),
                widgetTickLine(time, 2),
                widgetTickLine(time, 1),
                widgetTickLine(time, 0),
              ],
            ),
    );
  }



  Widget _widgetOptions(List<String> options) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(options[0]),
          leading: Radio<String>(
            value: options[0],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[1]),
          leading: Radio<String>(
            value: options[1],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[2]),
          leading: Radio<String>(
            value: options[2],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[3]),
          leading: Radio<String>(
            value: options[3],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
      ],
    );
  }

// this function calculate the score
  double _calculateScore(int time, bool answerCorrect) {
    return answerCorrect ? (50 + (time * 5)) : 0;
  }

// this function call the next question
  void _nextQuestion() {
    bool isCorrectAnswer =
        _optionSelect == question.correctAnswer ? true : false;

    listAnswers.add(Answer(
      questionId: question.id,
      answer: _optionSelect!,
      correctOption: question.correctAnswer,
      correct: isCorrectAnswer,
      score: _calculateScore(timerCounter, isCorrectAnswer),
    ));

    if (indexListQuestion.isNotEmpty) {
      Navigator.pushNamed(context, QuestionOptions.routeName,
          arguments: Question().getId(
              indexListQuestion[Random().nextInt(indexListQuestion.length)]));
    } else {
      Navigator.pushNamed(context, QuestionResult.routeName,
          arguments: listAnswers);
    }
    oclock!.cancel();
  }


  // this function to able the timer for a question.
  Timer _timerQuestion({int timerMax = 60}) {
    
    timerCounter == 0 ? timerCounter = timerMax : timerCounter = timerCounter;

    Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCounter > 0) {
          setState(() {
            print('counter: $timerCounter');
            timerCounter--;
          });
        } else {
          _optionSelect == null
              ? _optionSelect = 'No answer...'
              : _optionSelect = _optionSelect;
          timer.cancel();
          _nextQuestion();
        }
    });

    return _timer;
  }
}