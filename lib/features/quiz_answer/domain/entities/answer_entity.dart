import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String questionId;
  final String answer;
  final String correctOption;
  final bool correct;
  final int score;

  Answer({ this.questionId = " ", 
               this.answer = " ",
        this.correctOption = " " ,
              this.correct = false, 
                this.score = 0,  
              });

 @override
  List<Object> get props => [questionId, answer, correctOption, correct, score];

}
