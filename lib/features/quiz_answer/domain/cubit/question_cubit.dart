import 'dart:async';

import 'package:app_quiz/features/quiz_answer/data/models/question_model.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/answer_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  // set up here any var that we have
  Question question = Question();
  List<Question> listQuestions = [];
  int timeCounter = 100;
  var oClock;
  List<Answer> listAnswers = [];
  String userAnswer = "";
  var resultMatch = {'score': 0, 
                      'hits': 0,
                      'emoji':'#',
                      'message': ' ',
                      'subMessage': ' '
                    };
  int matchScore = 0;
  List randomList = indexListQuestion.toList();
  
  QuestionCubit() : super(QuestionEmpty());

  Future<void> getNextQuestion(BuildContext context, {List<Question>? questions}) async {
// purpose: return de next question to show for user
// 0. Set the status to Loading
// 1. get the first question of the list 
// 2. set it for the game
// 3. remove it from the questions list
// 4. update the status to Loaded
    emit(QuestionLoading());
    if (questions != null){
      listQuestions = questions;
    }
    userAnswer = "";
    question = listQuestions[0];
    listQuestions.remove(question);
    emit(QuestionLoaded());
    listQuestions.length;
    setTimer(context);
  }

  Future<void> setOptionSelected(String optionSelected) async {
  // purpose: set the value for user answer and change the state of object question
  // 1. set the var userAnswer to option selected for the user
  // 2. update the state of object question for QuestionAnswered
    emit(QuestionLoaded());
    userAnswer = optionSelected;
    emit(QuestionAnswered());
  }

  Future<void> setAnswerQuestion() async {
  // purpose: set the user answer identifying if the answer was correct and calculating the score
  // 1. turn off the clock
  // 2. identifying if the answer was correct
  // 3. Calculate the score
  // 4. Register the answer
    oClock.cancel();
    bool answerCorrect = userAnswer == question.correctAnswer ? true : false;
    listAnswers.add(
      Answer(questionId: question.id!,
             answer: userAnswer,
             correctOption: question.correctAnswer!,
             correct: answerCorrect,
             score: answerCorrect ? (50 + (timeCounter * 0.5)).toInt() : 0
             )
    );
  }

  // purpose: turn off the clock when the object will dispose
  // 1. turn off the clock
  @override
  Future<void> close() async {
    oClock.cancel();
    super.close();
  }

  Future<void> setTimer(BuildContext context) async{
  // purpose: set the countdown for the oclock
  // 1. turn off the clock
  // 2. show the timer in red when left 3 seg for the end
    Color timerColor = Colors.black54;
    timeCounter = 100;
    oClock = Timer.periodic(const Duration(milliseconds: 100), (timer) { 
      if (timeCounter > 0) {
        timeCounter--;
        timerColor = timeCounter >= 30 ? Colors.black54 : Colors.red;
        emit(QuestionInProgress(timeCounter, timerColor));
      }
      else {
        emit(QuestionLoaded());
        timer.cancel();
        answerTheQuesion(context);
      }
    });
  }

  Future<void> answerTheQuesion(BuildContext context) async {
  // purpose: make the actions to answer the question
  // 1. check if still exist more questions 
  // 2. set the next question
  // 3. finish the match when no exist more questions.
    setAnswerQuestion();
    //if (randomList.isNotEmpty){
    if (listQuestions.isNotEmpty) {
      getNextQuestion(context);
    } else {
      calculateQuizScore();
      Navigator.pushNamed(context, 
        '/questionResult',
        arguments: this);
      close();
    }
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
    loggedUser.score += matchScore.toInt(); 
  }

  Widget widgetResult() {
    
    return Container();
  } 
}
