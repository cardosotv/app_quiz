part of 'question_cubit.dart';

sealed class QuestionState extends Equatable {
  // final int id;
  // final String question;
  // final List<String> options;
  // final String correctAnswer;
  
  //const QuestionState(this.id, this.question, this.options, this.correctAnswer);
  const QuestionState();

  @override
  List<Object> get props => [];
}

final class QuestionEmpty extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionLoaded extends QuestionState {}

final class QuestionAnswered extends QuestionState {}

final class QuestionDone extends QuestionState {}
