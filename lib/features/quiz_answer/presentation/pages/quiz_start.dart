import 'package:app_quiz/core/presentation/widget/alert.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';
import 'package:app_quiz/features/quiz_answer/data/repositories/game_repository.dart';
import 'package:app_quiz/features/quiz_answer/presentation/pages/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizMainQuestion extends StatefulWidget {
  static const routeName = '/quiz';

  const QuizMainQuestion({super.key});

  @override
  State<QuizMainQuestion> createState() => _QuizMainQuestionState();
}

class _QuizMainQuestionState extends State<QuizMainQuestion> {
  final GameRepository gameRepository = GameRepository();
  
  @override
  Widget build(BuildContext context) {
    // this code extract te arguments pass throught the call the new screen /quiz
    final parameters = ModalRoute.of(context)!.settings.arguments as Subject;
    final TokenProvider tokenProvider = Provider.of<TokenProvider>(context);
    var game;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            " ",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 150,
              child: Column(
                children: [
                  const Icon(
                    IconData(0xe7fd, fontFamily: "MaterialIcons"),
                    color: Colors.blue,
                    size: 82,
                  ),
                  Text(
                    parameters.subject,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 1,
              margin: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                //                width: 300,
                height: 200,
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
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Back"),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        game = _callPostNewGame(tokenProvider.token.toString()
                                                , parameters.id).then((value) 
                                {
                                  print(value.toString());

                                  if(value != null){
                                    Navigator.pushNamed(context
                                        , QuestionSelected.routeName
                                        , arguments: value);
                                  }
                                });
                      },
                      child: const Text("Start"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String?, dynamic>> _callPostNewGame(String token, String id) {

    return gameRepository.createNewGameRepository(token, id);
  }
}
