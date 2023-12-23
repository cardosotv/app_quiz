import 'package:app_quiz/features/quiz_answer/data/models/question_model.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/answer_entity.dart';
import 'package:flutter/material.dart';
part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  // set up here any var that we have
  Question question = Question();
  List<Answer> listAnswers = [];
  String userAnswer = "";
  var resultMatch = {'score': 0, 
                      'hits': 0,
                      'emoji':'#',
                      'message': ' ',
                      'subMessage': ' '
                    };
  double matchScore = 0.0;
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
    int nextIndex = listSuffle[0];
    question = QuestionModel().getId(nextIndex);
    randomList.remove(nextIndex);
    emit(QuestionLoaded());
  }

  Future<void> setOptionSelected(String optionSelected) async {
  // purpose: set the value for user answer and change the state of object question
  // 1. set the var userAnswer to option selected for the user
  // 2. update the state of object question for QuestionAnswered
    emit(QuestionLoaded());
    userAnswer = optionSelected;
    emit(QuestionAnswered());
  }

  Future<void> setAnswerQuestion({int time = 1}) async {
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

  Future<void> calculateQuizScore() async{
  // purpose: This function should calculate the match score.
  // 1. sum the result of each match 
  // 2. add the score of match to user score.
    int hits=0;
    for (Answer answer in listAnswers) {
      matchScore = matchScore + answer.score;
      hits = hits + (answer.correct ? 1 : 0);
    } 
    resultMatch['score'] = matchScore;
    resultMatch['hits'] = hits;
    if(matchScore > 850){
      resultMatch['message'] = "You are the best!";
      resultMatch['subMessage'] = "This match was absolutely phenomenal.";
      resultMatch['emoji'] = "🏆";
    }
    else if(matchScore > 700){
      resultMatch['message'] = "Congratulations!";
      resultMatch['subMessage'] = "You are really good.";
      resultMatch['emoji'] = "🎉";    
      }
    else if(matchScore > 500){
      resultMatch['message'] = "Good effort!";
      resultMatch['subMessage'] = "You are on the right trackt.";
      resultMatch['emoji'] = "👏";    
    }
    else if(matchScore > 300){
      resultMatch['message'] = "It's a stumble!";
      resultMatch['subMessage'] = "Keep your head up, there's always room for improvement.";
      resultMatch['emoji'] = "😬";    
    }
    else {
      resultMatch['message'] = "Terrible!";
      resultMatch['subMessage'] = "Improve your self and get back in the game.";
      resultMatch['emoji'] = "😱";    
    
    }
    //  'message': ' ',
    //  'color_score': ' '
    loggedUser.score += loggedUser.score + matchScore.toInt(); 
  }

  Widget widgetResult() {
    
    return Container();
  } 
}
