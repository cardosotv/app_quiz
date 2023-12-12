import 'package:app_quiz/features/quiz_answer/domain/models/answer.dart';
import 'package:app_quiz/core/domain/models/User.dart';

String optionSelected = " ";

Map<String, dynamic> answer = {
      "question": " ",
      "answer": " ",
      "correct_answer": " "
    };

List<int> indexListQuestion = [1,2,3,4,5,6,7,8,9,10];

List<Answer> listAnswers = [];

User loggedUser = User();

