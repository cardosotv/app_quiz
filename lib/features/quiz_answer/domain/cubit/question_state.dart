part of 'question_cubit.dart';

sealed class QuestionState extends Equatable {
  // final int id;
  // final String question;
  // final List<String> options;
  // final String correctAnswer;
  final int? timer;
  final Color? timerColor;
  const QuestionState(this.timer, {this.timerColor = Colors.black54});
  
  @override
  List<Object> get props => [timer!, timerColor!];
}

final class QuestionEmpty extends QuestionState {
  QuestionEmpty() : super(0);
}

final class QuestionLoading extends QuestionState {
  QuestionLoading() : super(0);
}

final class QuestionLoaded extends QuestionState {
  QuestionLoaded() : super(0);
}

final class QuestionInProgress extends QuestionState {
  QuestionInProgress(int? timer, Color timerColor) : super(timer, timerColor: timerColor);
}

final class QuestionAnswered extends QuestionState {
  QuestionAnswered() : super(0);
}

final class QuestionDone extends QuestionState {
  QuestionDone() : super(0);
}
