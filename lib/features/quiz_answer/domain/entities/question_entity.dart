import "package:equatable/equatable.dart";

class Question extends Equatable {
  final int id;
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(
      {this.id = 0,
      this.question = " ",
      this.options = const [],
      this.correctAnswer = " "});

  @override
  List<Object> get props => [id, question, options, correctAnswer];
}
