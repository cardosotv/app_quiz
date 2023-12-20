import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import '../repositories/question_options.dart';

class QuestionModel extends Question  {

  List<Question> getList() {
    List<Map<String, dynamic>> list = questionOptions;
    List<Question> result = [];

    for (var item in list) {
      result.add(Question(
          id: item['id'],
          question: item['question'],
          options: item['options'],
          correctAnswer: item['correct_answer']));
    }
    return result;
  }
  
  Question getId(int id) {
    List<Question> listQuestion = getList();
    Question question = listQuestion.where((filter) => filter.id == id).first;

    return question;
  }
}