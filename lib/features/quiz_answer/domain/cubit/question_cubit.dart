import 'package:app_quiz/features/quiz_answer/data/models/question_model.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/answer_entity.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  // set up here any var that we have
  Question question = Question();
  List<Answer> listAnswers = [];
  String userAnswer = "";
  List randomList = indexListQuestion;
  QuestionCubit() : super(QuestionEmpty());



  Future<void> getNextQuestion() async {
// purpose: return de next question to show for user
// 1. set a random list
// 2. remove this index of the random list
// 3.  delivery the question for the next index of random list 
    
    emit(QuestionLoading());
    userAnswer = "";
    List<int> listSuffle = randomList as List<int>; 
    listSuffle.shuffle();
    print(randomList.toString());
    int nextIndex = listSuffle[0];
    question = QuestionModel().getId(nextIndex);
    randomList.remove(nextIndex);
    emit(QuestionLoaded());
    print(randomList.toString());
    print(nextIndex);
  }

  Future<void> setOptionSelected(String optionSelected) async {
  // purpose: set the value for user answer and change the state of object question
  // 1. set the var userAnswer to option selected for the user
  // 2. update the state of object question for QuestionAnswered
    emit(QuestionLoaded());
    userAnswer = optionSelected;
    emit(QuestionAnswered());
  }

  Future<void> setAnswerQuestion({int time = 5}) async {
  // purpose: set the user answer identifying if the answer was correct and calculating the score
  // 1. identifying if the answer was correct
  // 2. Calculate the score
  // 3. Register the answer

    bool answerCorrect = userAnswer == question.correctAnswer ? true : false;

    listAnswers.add(
      Answer(questionId: question.id,
             answer: userAnswer,
             correctOption: question.correctAnswer,
             correct: answerCorrect,
             score: answerCorrect ? (50 + (time * 5)) : 0
             )
    );
  }
}
