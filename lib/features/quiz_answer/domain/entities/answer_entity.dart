import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int questionId;
  final String answer;
  final String correctOption;
  final bool correct;
  final double score;

  Answer({ this.questionId = 0, 
               this.answer = " ",
        this.correctOption = " " ,
              this.correct = false, 
                this.score = 0.0,  
              });

 @override
  List<Object> get props => [questionId, answer, correctOption, correct, score];

}
