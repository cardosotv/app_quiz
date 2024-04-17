

import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';

class QuestionUseCase {


  List<Question> extractQuestionListFromGame(Map<String?, dynamic> game) {


    List<Question> listQuestion = [];

    var list = game['gameQuestions'];

    for (var item in list) {
      Question question = Question();
      question.fromJson(item['question']);
      listQuestion.add(question);
    }

    return listQuestion;
  }

}