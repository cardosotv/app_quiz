import '../../data/repositories/question_options_sapiens.dart';

class Question {
  final int id;
  final String question;
  final List<String> options;
  String correctAnswer;

  Question(
      {this.id = 0,
      this.question = " ",
      this.options = const [],
      this.correctAnswer = " "});

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



  // factory Quiz.fromJson(Map<String, dynamic> json) {
  //   return Quiz(id:json['id'], name:json['subject'], about:json['about']);
  // }

  // Map<String, dynamic> toJson() => {
  //   "id": this.id,
  //   "subject": this.name,
  //   "about": this.about,
  // };
